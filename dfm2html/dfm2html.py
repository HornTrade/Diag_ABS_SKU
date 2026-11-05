#!/usr/bin/env python3
"""
dfm2html.py — Convert Delphi DFM form files to standalone HTML (Bootstrap 5).

Usage:
    python dfm2html.py MainForm.dfm
    python dfm2html.py MainForm.dfm -o MainForm.html
    python dfm2html.py ./forms/ -o ./html/
    python dfm2html.py ./forms/ -o ./html/ --recursive

Supports:
    * Text-format DFM (object/inherited/inline ... end)
    * Unicode escapes #NNNN and #$NNNN
    * String concatenation with + and juxtaposition
    * Sets [a, b, c], collections ('a' 'b'), items <item..end>
    * Non-visual components (TTimer, TSocket, TDialog) skipped

Limitations:
    * Binary DFM (TPF0 header) is detected and skipped — convert first:
        Delphi bin\\convert.exe MainForm.dfm MainForm.txt.dfm
      or open in Delphi IDE → "Save As Text"
    * Picture.Data / Glyph.Data / Bitmap blobs are skipped
    * TChart → placeholder (replace with Chart.js / ECharts)
    * Event handlers → console.log stubs (logic lives in .pas)
"""

import re
import sys
import argparse
from pathlib import Path

# ============================================================
# DFM AST
# ============================================================

class DfmNode:
    __slots__ = ('kind', 'name', 'cls', 'props', 'children', 'line')
    def __init__(self, kind, name, cls, line=0):
        self.kind = kind
        self.name = name
        self.cls = cls
        self.props = {}
        self.children = []
        self.line = line

    def __repr__(self):
        return f"<{self.kind} {self.name}:{self.cls} p={len(self.props)} c={len(self.children)}>"


# ============================================================
# Tokenizer
# ============================================================

class Token:
    __slots__ = ('kind', 'value', 'line')
    def __init__(self, kind, value, line):
        self.kind, self.value, self.line = kind, value, line
    def __repr__(self):
        return f"{self.kind}({self.value!r})"


def tokenize(text):
    tokens = []
    i, n, line = 0, len(text), 1
    while i < n:
        c = text[i]
        # whitespace / newlines
        if c in ' \t\r':
            i += 1; continue
        if c == '\n':
            line += 1; i += 1; continue
        # Binary/comment block { ... }
        if c == '{':
            j = text.find('}', i)
            if j == -1:
                # Unterminated — не съедаем весь файл
                j = text.find('\n', i)
                if j == -1: j = n - 1
                print(f"WARN line {line}: unterminated {{ — skipping to EOL")
            line += text[i:j].count('\n')
            i = j + 1
            continue
        # Pascal-style comment { ... }
        if c == '{':
            j = text.find('}', i)
            if j == -1: j = n - 1
            line += text[i:j].count('\n')
            i = j + 1; continue
        # quoted string
        if c == "'":
            j = i + 1
            buf = []
            start_line = line
            while j < n:
                if text[j] == "'":
                    if j + 1 < n and text[j+1] == "'":
                        buf.append("'"); j += 2; continue
                    break
                if text[j] == '\n': line += 1
                buf.append(text[j]); j += 1
            tokens.append(Token('string', ''.join(buf), start_line))
            i = j + 1; continue
        # char escape #NNNN or #$NNNN
        if c == '#':
            j = i + 1
            is_hex = j < n and text[j] == '$'
            if is_hex: j += 1
            k = j
            while k < n and (text[k].isdigit() or (is_hex and text[k] in 'abcdefABCDEF')):
                k += 1
            if k > j:
                try:
                    cp = int(text[j:k], 16 if is_hex else 10)
                    tokens.append(Token('char', cp, line))
                except ValueError:
                    pass
                i = k; continue
        # punctuation
        if c in '=:[](),<>.+-':
            tokens.append(Token('punct', c, line))
            i += 1; continue
        # identifier / number / $hex / %bin
        if c.isalnum() or c in '_$%@&':
            j = i
            while j < n and (text[j].isalnum() or text[j] in '_%.$'):
                j += 1
            tokens.append(Token('id', text[i:j], line))
            i = j; continue
        # unknown char — skip
        i += 1
    tokens.append(Token('eof', None, line))
    return tokens


# ============================================================
# Parser (recursive descent)
# ============================================================

class DfmParser:
    def __init__(self, text):
        self.tokens = tokenize(text)
        self.pos = 0

    def peek(self, k=0):
        idx = self.pos + k
        return self.tokens[idx] if idx < len(self.tokens) else self.tokens[-1]

    def take(self):
        tok = self.tokens[self.pos]
        self.pos += 1
        return tok

    def expect(self, value=None):
        tok = self.take()
        if value is not None and tok.value != value:
            raise SyntaxError(f"Line {tok.line}: expected {value!r}, got {tok.value!r}")
        return tok

    # ---------- value parser ----------

    def parse_value(self):
        tok = self.peek()
        # negative number
        if tok.kind == 'punct' and tok.value == '-':
            nxt = self.peek(1)
            if nxt.kind == 'id' and (nxt.value[0].isdigit() or nxt.value[0] == '$'):
                self.take()
                return '-' + self.take().value
            self.take()
            return '-'
        # string / char sequence (with + concatenation)
        if tok.kind in ('string', 'char'):
            return self._strings()
        # identifier / number
        if tok.kind == 'id':
            return self.take().value
        # set [...]
        if tok.kind == 'punct' and tok.value == '[':
            self.take()
            items = []
            while self.peek().value != ']':
                items.append(self.parse_value())
                if self.peek().value == ',':
                    self.take()
            self.take()  # ]
            return items
        # collection (...)
        if tok.kind == 'punct' and tok.value == '(':
            self.take()
            items = []
            while self.peek().value != ')':
                items.append(self.parse_value())
                if self.peek().value == ',':
                    self.take()
            self.take()  # )
            return items
        # binary block <...> — skip
        if tok.kind == 'punct' and tok.value == '<':
            self.take()
            depth = 1
            while self.pos < len(self.tokens):
                t = self.take()
                if t.value == '<': depth += 1
                elif t.value == '>':
                    depth -= 1
                    if depth == 0: break
            return '<binary>'
        # unknown — consume one token
        self.take()
        return tok.value

    def _strings(self):
        parts = []
        while True:
            tok = self.peek()
            if tok.kind == 'string':
                parts.append(self.take().value)
            elif tok.kind == 'char':
                try: parts.append(chr(self.take().value))
                except (ValueError, OverflowError): self.take()
            elif tok.kind == 'punct' and tok.value == '+':
                nxt = self.peek(1)
                if nxt.kind in ('string', 'char'):
                    self.take()  # skip +
                else:
                    break
            else:
                break
        return ''.join(parts)

    # ---------- object parser ----------
    def parse(self):
        node = self._object()
        # === DEBUG ===
        print(f"\n[DEBUG] Parsed tree of {node.name}:{node.cls}")
        self._dump_tree(node, 0)
        leftover = [t for t in self.tokens[self.pos:] if t.kind != 'eof']
        if leftover:
            print(f"[WARN] {len(leftover)} tokens not parsed after root!")
            for t in leftover[:10]:
                print(f"       line {t.line}: {t.kind}={t.value!r}")
        return node

    def _dump_tree(self, node, depth=0):
        pad = "  " * depth
        n_vis = sum(1 for c in node.children if c.props.get('Visible') != 'False')
        print(f"{pad}{node.kind} {node.name}:{node.cls} "
              f"(children={len(node.children)}, visible={n_vis})")
        for c in node.children:
            self._dump_tree(c, depth + 1)

    def _object(self):
        head = self.take()
        if head.value not in ('object', 'inherited', 'inline'):
            raise SyntaxError(f"Line {head.line}: expected object/inherited/inline, got {head.value!r}")
        name_tok = self.take()
        name = name_tok.value or 'Noname'
        cls = None
        if self.peek().value == ':':
            self.take()
            cls = self.take().value
        node = DfmNode(head.value, name, cls, head.line)
        while True:
            tok = self.peek()
            if tok.kind == 'eof':
                break
            if tok.value == 'end':
                self.take(); break
            if tok.value in ('object', 'inherited', 'inline'):
                node.children.append(self._object())
                continue
            # property: ID ('.' ID)* '=' value
            if tok.kind == 'id':
                key_parts = [self.take().value]
                while self.peek().value == '.':
                    self.take()
                    key_parts.append(self.take().value)
                if self.peek().value == '=':
                    self.take()
                    node.props['.'.join(key_parts)] = self.parse_value()
                else:
                    # orphan identifier — ignore
                    pass
            else:
                # skip anything we don't understand
                self.take()
        return node


# ============================================================
# HTML Renderer
# ============================================================

def esc(s):
    if s is None: return ''
    return (str(s).replace('&', '&amp;').replace('<', '&lt;')
                   .replace('>', '&gt;').replace('"', '&quot;'))

def sid(name):
    return re.sub(r'[^A-Za-z0-9_-]', '_', name or 'x')

def iprop(props, key, default=0):
    try: return int(str(props.get(key, default)))
    except (ValueError, TypeError): return default

def bprop(props, key, default=False):
    return props.get(key, default) in (True, 'True', 'true', 1, '1')

def vprop(props, key, default=True):
    return bprop(props, key, default)


# --- Control library ---

class Control:
    def render(self, node, ctx): ...
    def __init__(self):
        self.name = None
        self.node = None


class H:
    """Helper: renders one component to ctx.out (list of lines)."""

    def __init__(self, ctx):
        self.ctx = ctx

    def line(self, s, indent=None):
        ind = self.ctx['indent'] if indent is None else indent
        self.ctx['out'].append('  ' * ind + s)

    def push(self): self.ctx['indent'] += 1
    def pop(self):  self.ctx['indent'] -= 1
    def script(self, s): self.ctx['scripts'].append(s)
    def add_class(self, s): self.ctx['extra_css'].append(s)


class Renderer:
    """Main renderer, dispatches per-class."""

    def __init__(self, root):
        self.root = root
        self.ctx = {
            'out': [], 'indent': 0, 'scripts': [],
            'extra_css': [], 'seen_classes': set(),
        }
        self.h = H(self.ctx)

    # ---------- entry ----------

    def render(self):
        h = self.h
        h.line('<!DOCTYPE html>')
        h.line('<html lang="ru"><head><meta charset="UTF-8">')
        title = self.root.props.get('Caption') or self.root.name or 'DFM Form'
        h.line(f'<title>{esc(title)}</title>')
        h.line('<meta name="viewport" content="width=device-width, initial-scale=1">')
        h.line('<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">')
        h.line('<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">')
        self._css()
        h.line('</head><body>')

        children = [c for c in self.root.children if c.props.get('Visible') != 'False']
        is_main = any(c.cls in ('TPageControl', 'TToolBar') for c in children)

        # ---- Классификация верхнего уровня ----
        toolbars   = [c for c in children if c.cls == 'TToolBar']
        statusbars = [c for c in children if c.cls == 'TStatusBar']
        pageconts  = [c for c in children if c.cls == 'TPageControl']
        menus      = [c for c in children if c.cls == 'TMainMenu']
        lamps      = [c for c in children if c.cls == 'TSpeedButton']

        # TLabel, привязанные к лампам (Top чуть ниже + Left рядом)
        lamp_labels = []
        for lbl in (c for c in children if c.cls == 'TLabel'):
            lL, lT = iprop(lbl.props, 'Left', 0), iprop(lbl.props, 'Top', 0)
            for lamp in lamps:
                pL, pT = iprop(lamp.props, 'Left', 0), iprop(lamp.props, 'Top', 0)
                if abs(lL - pL) < 30 and 15 <= (lT - pT) <= 30:
                    lamp_labels.append(lbl)
                    break

        rendered = set(toolbars + statusbars + pageconts + menus + lamps + lamp_labels)

        # Всё "лишнее" — только то, что реально видно в пределах ClientHeight
        ch = iprop(self.root.props, 'ClientHeight', iprop(self.root.props, 'Height', 0))
        others = [c for c in children
                  if c not in rendered and iprop(c.props, 'Top', 0) < ch + 50]

        # ---- Каркас ----
        if is_main:
            h.line('<div class="app">')
            h.push()

            # header (лампа + подпись)
            if lamps:
                h.line('<div class="app-header">')
                h.line(f'  <span class="app-title">{esc(title)}</span>')
                h.line('  <div class="app-lamps">')
                for lamp in sorted(lamps, key=lambda c: iprop(c.props, 'Left', 0)):
                    pL = iprop(lamp.props, 'Left', 0)
                    match = next((l for l in lamp_labels if abs(iprop(l.props, 'Left', 0) - pL) < 30), None)
                    h.line('    <div class="lamp-pair">')
                    self.render_node(lamp)
                    if match: self.render_node(match)
                    h.line('    </div>')
                h.line('  </div>')
                h.line('</div>')

            # menu
            for m in menus:
                self._render_menu(m)

            # toolbars
            for tb in toolbars:
                self.render_node(tb)

            # body
            h.line('<div class="app-body">')
            h.push()
            for pc in pageconts:
                self.render_node(pc)
            for o in others:
                self.render_node(o)
            h.pop()
            h.line('</div>')

            # statusbars
            for sb in statusbars:
                self.render_node(sb)

            h.pop()
            h.line('</div>')
        else:
            # Маленький диалог — центрированный
            h.line('<div class="dialog-wrapper"><div class="dialog">')
            if title:
                h.line(f'<div class="dialog-title">{esc(title)}</div>')
            for c in children:
                self.render_node(c)
            h.line('</div></div>')

        self._scripts()
        h.line('<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>')
        h.line('</body></html>')
        return '\n'.join(self.ctx['out'])

    def _css(self):
        h = self.h
        h.line('<style>')
        h.line('  *{box-sizing:border-box;}')
        h.line('  html,body{margin:0;padding:0;height:100%;}')
        h.line('  body{background:#a0a0a0;font-family:"MS Sans Serif",Tahoma,sans-serif;font-size:11px;color:#000;}')

        # ---------- main app shell ----------
        h.line('  .app{display:flex;flex-direction:column;width:100vw;height:100vh;background:#ece9d8;}')
        h.line('  .app-header{display:flex;justify-content:space-between;align-items:center;'
               'padding:4px 10px;background:linear-gradient(#0a246a,#3a6ea5);color:#fff;'
               'font-size:12px;flex-shrink:0;}')
        h.line('  .app-title{font-weight:bold;}')
        h.line('  .app-lamps{display:flex;gap:10px;align-items:flex-end;}')
        h.line('  .lamp-pair{display:flex;flex-direction:column;align-items:center;gap:1px;}')
        h.line('  .lamp{width:18px;height:18px;border-radius:50%;border:1px solid #333;'
               'background:#555;cursor:pointer;}')
        h.line('  .lamp.on.off{background:#8b0000;}')
        h.line('  .lamp.on.warn{background:#ffb000;}')
        h.line('  .lamp.on.ok{background:#0a0;}')
        h.line('  .lamp-pair .lbl{font-size:10px;color:#fff;line-height:1;}')

        # ---------- menu ----------
        h.line('  .menu-bar{display:flex;background:#ece9d8;padding:2px 0;'
               'border-bottom:1px solid #aaa;flex-shrink:0;}')
        h.line('  .menu-bar>span{padding:2px 10px;cursor:pointer;font-size:11px;}')
        h.line('  .menu-bar>span:hover{background:#316ac5;color:#fff;}')

        # ---------- toolbar ----------
        h.line('  .toolbar{display:flex;flex-wrap:wrap;gap:2px;background:#d4d0c8;'
               'padding:3px 6px;border-bottom:1px solid #aaa;flex-shrink:0;}')
        h.line('  .toolbar>button{padding:3px 10px;border:1px solid transparent;'
               'background:none;cursor:pointer;font-size:11px;}')
        h.line('  .toolbar>button:hover{border-color:#888;background:#ece9d8;}')
        h.line('  .toolbar>button:disabled{color:#999;cursor:default;}')

        # ---------- body / page control ----------
        h.line('  .app-body{flex:1 1 auto;display:flex;flex-direction:column;min-height:0;overflow:hidden;}')
        h.line('  .pagecontrol{display:flex;flex-direction:column;width:100%;height:100%;min-height:120px;flex:1 1 auto;}')
        h.line('  .tabs-bar{display:flex;flex-wrap:wrap;background:#ece9d8;padding:2px 4px 0;'
               'border-bottom:1px solid #888;flex-shrink:0;}')
        h.line('  .tabs-bar>a{padding:3px 12px;background:#d4d0c8;border:1px solid #888;'
               'border-bottom:none;margin-right:2px;color:#000;text-decoration:none;font-size:11px;}')
        h.line('  .tabs-bar>a.active{background:#ece9d8;margin-bottom:-1px;padding-bottom:4px;}')
        h.line('  .tabs-bar>a:hover{background:#e4e0d8;}')
        h.line('  .tab-panes{flex:1 1 auto;overflow:auto;background:#ece9d8;padding:6px;}')
        h.line('  .tab-pane{display:none;}')
        h.line('  .tab-pane.active{display:flex;flex-direction:column;gap:8px;}')

        # ---------- groupbox ----------
        h.line('  .groupbox{border:1px solid #888;border-radius:3px;padding:8px 10px;'
               'background:#ece9d8;position:relative;}')
        h.line('  .groupbox>.gb-title{position:absolute;top:-7px;left:8px;background:#ece9d8;'
               'padding:0 4px;font-size:11px;line-height:1;pointer-events:none;}')
        h.line('  .groupbox-inner{display:flex;flex-wrap:wrap;gap:6px 14px;align-items:center;'
               'padding-top:4px;}')
        h.line('  .groupbox-inner>.groupbox{flex:1 1 100%;min-width:200px;}')
        h.line('  .groupbox-inner>.pagecontrol{flex:1 1 100%;min-height:200px;}')

        # ---------- fields ----------
        h.line('  .field{display:inline-flex;align-items:center;gap:6px;}')
        h.line('  .field>label{white-space:pre;font-size:11px;color:#000;line-height:1.2;}')
        h.line('  .field>input,.field>select{font-size:11px;padding:1px 4px;height:22px;'
               'border:1px solid #7f9db9;background:#fff;font-family:inherit;}')
        h.line('  input.form-control-sm,select.form-select-sm,textarea.memo{font-size:11px;'
               'font-family:"MS Sans Serif",Tahoma,sans-serif;}')
        h.line('  textarea.memo{width:100%;min-height:80px;max-height:300px;resize:vertical;'
               'font-family:Consolas,"Courier New",monospace;font-size:12px;padding:3px;'
               'border:1px solid #7f9db9;background:#fff;}')

        # ---------- chk/radio ----------
        h.line('  .chk{display:inline-flex;align-items:center;gap:5px;font-size:11px;'
               'white-space:pre;cursor:pointer;line-height:1.2;}')
        h.line('  .chk>input[type=checkbox],.chk>input[type=radio]{width:13px;height:13px;'
               'margin:0;cursor:pointer;flex-shrink:0;}')
        h.line('  .chk-grid{display:flex;flex-wrap:wrap;gap:4px 16px;align-items:center;}')

        # ---------- buttons ----------
        h.line('  .btn-secondary,.btn-primary,.btn-danger{padding:3px 12px;font-size:11px;'
               'font-family:inherit;border:1px solid #888;border-radius:3px;cursor:pointer;'
               'background:#e4e0d8;min-width:60px;}')
        h.line('  .btn-primary{background:#d6e4f7;border-color:#316ac5;}')
        h.line('  .btn-danger{background:#f7d6d6;border-color:#c00000;}')
        h.line('  .btn-secondary:hover{background:#d4d0c8;}')
        h.line('  .btn-secondary:disabled,.btn-primary:disabled{color:#999;cursor:default;}')

        # ---------- tables ----------
        h.line('  .kv-table{border-collapse:collapse;width:100%;font-size:11px;margin-top:4px;}')
        h.line('  .kv-table td{padding:2px 12px 2px 0;vertical-align:top;}')
        h.line('  .kv-table td.k{white-space:pre;color:#000;}')
        h.line('  .kv-table td.v{white-space:pre;color:#333;}')
        h.line('  .grid{border-collapse:collapse;font-size:11px;margin-top:4px;}')
        h.line('  .grid td{border:1px solid #888;padding:1px 4px;min-width:22px;height:17px;}')

        # ---------- radiogroup ----------
        h.line('  .radiogroup{border:1px solid #888;border-radius:3px;padding:8px 10px;'
               'position:relative;margin:2px 0;}')
        h.line('  .radiogroup>.gb-title{position:absolute;top:-7px;left:8px;background:#ece9d8;'
               'padding:0 4px;font-size:11px;line-height:1;}')

        # ---------- statusbar ----------
        h.line('  .statusbar{display:flex;background:#ece9d8;border-top:1px solid #888;'
               'padding:3px 10px;font-size:11px;gap:10px;flex-shrink:0;}')
        h.line('  .statusbar>span{padding:0 8px;border-right:1px solid #ccc;}')
        h.line('  .statusbar>span:last-child{border-right:none;}')

        # ---------- dialog (маленькие формы) ----------
        h.line('  .dialog-wrapper{position:fixed;inset:0;display:flex;align-items:center;'
               'justify-content:center;background:rgba(0,0,0,.2);padding:20px;overflow:auto;}')
        h.line('  .dialog{background:#ece9d8;border:1px solid #555;border-radius:3px;'
               'padding:8px 12px 12px;max-width:min(95vw,800px);max-height:95vh;overflow:auto;'
               'display:flex;flex-direction:column;gap:8px;}')
        h.line('  .dialog-title{background:linear-gradient(#0a246a,#3a6ea5);color:#fff;'
               'padding:3px 8px;margin:-8px -12px 6px;font-weight:bold;font-size:12px;}')

        # ---------- misc ----------
        h.line('  .dfm-log{background:#111;color:#0f0;font-family:Consolas,monospace;'
               'font-size:12px;padding:4px;height:100px;overflow-y:auto;white-space:pre-wrap;'
               'border:1px solid #333;margin-top:6px;}')
        h.line('  .dfm-paintbox{border:1px solid #888;background:#fff;min-height:80px;}')
        h.line('  .dfm-chart{border:1px dashed #999;background:#fafafa;padding:14px;'
               'color:#888;text-align:center;font-style:italic;}')
        h.line('  .dfm-img{display:inline-block;border-radius:50%;border:1px solid #333;'
               'vertical-align:middle;}')
        h.line('  .progress{display:flex;height:14px;background:#ddd;border:1px solid #888;'
               'width:180px;overflow:hidden;}')
        h.line('  .progress>div{background:#0a64c8;height:100%;color:#fff;font-size:10px;'
               'text-align:center;line-height:12px;width:0;}')
        h.line('  input[type=range]{vertical-align:middle;}')

        for s in self.ctx['extra_css']:
            h.line('  ' + s)
        h.line('</style>')

    def _scripts(self):
        h = self.h
        h.line('<script>')
        h.line('  function dfmLog(m){'
               'const e=document.querySelector(".dfm-log");'
               'if(!e){console.log(m);return;}'
               'const t=new Date().toLocaleTimeString();'
               'e.innerHTML+="["+t+"] "+m+"\\n";e.scrollTop=e.scrollHeight;}')
        h.line('  function dfmToggleLamp(el){el.classList.toggle("on");}')
        h.line('''
      document.addEventListener('click', function(e){
        var a = e.target.closest('.tabs-bar > a');
        if (!a) return;
        e.preventDefault();
        var group = a.closest('.pagecontrol');
        if (!group) return;
        var id = a.getAttribute('href').substring(1);
        group.querySelectorAll(':scope > .tabs-bar > a')
             .forEach(function(x){x.classList.remove('active');});
        group.querySelectorAll(':scope > .tab-panes > .tab-pane')
             .forEach(function(p){p.classList.remove('active');});
        a.classList.add('active');
        var pane = document.getElementById(id);
        if (pane) pane.classList.add('active');
      });
        ''')
        for s in self.ctx['scripts']:
            h.line('  ' + s)
        h.line('</script>')

    # ---------- dispatcher ----------
    def render_node(self, node):
        cls = node.cls or ''
        if node.props.get('Visible') == 'False' and cls not in ('TTimer',):
            if self.ctx.get('debug'):
                print(f"  [skip] {cls} #{node.name} (Visible=False)")
            return
        method = getattr(self, f'r_{cls}', None)
        if method is None:
            if self.ctx.get('debug'):
                print(f"  [fallback] {cls} #{node.name} -> r__container")
            method = self.r__container
        elif self.ctx.get('debug'):
            print(f"  [render] {cls} #{node.name}")
        method(node)

    def _render_menu(self, n):
        h = self.h
        h.line('<div class="menu-bar">')
        for item in n.children:
            if item.props.get('Visible') == 'False': continue
            cap = item.props.get('Caption') or ''
            if cap:
                h.line(f'<span>{esc(cap)}</span>')
        h.line('</div>')

    def _abs_style(node):
        L = iprop(node.props, 'Left', 0)
        T = iprop(node.props, 'Top', 0)
        W = iprop(node.props, 'Width', 0)
        H = iprop(node.props, 'Height', 0)
        return f'position:absolute;left:{L}px;top:{T}px;width:{W}px;height:{H}px;'
    # ---------- default ----------

    def r__container(self, node):
        h = self.h
        h.line(f'<!-- {node.cls} #{node.name} -->')
        h.line(f'<div class="dfm-unknown" data-class="{esc(node.cls)}" '
               f'data-name="{esc(node.name)}" style="border:1px dashed #ccc;padding:2px;">')
        h.push()
        for c in node.children: self.render_node(c)
        h.pop()
        h.line('</div>')

    # ---------- non-visual (skip) ----------

    def r_TTimer(self, n): pass
    def r_TOpenDialog(self, n): pass
    def r_TSaveDialog(self, n): pass
    def r_TColorDialog(self, n): pass
    def r_TFontDialog(self, n): pass
    def r_TPrintDialog(self, n): pass
    def r_TPrinterSetupDialog(self, n): pass
    def r_TFindDialog(self, n): pass
    def r_TReplaceDialog(self, n): pass
    def r_TImageList(self, n): pass
    def r_TMainMenu(self, n): pass
    def r_TPopupMenu(self, n): pass
    def r_TClientSocket(self, n): pass
    def r_TServerSocket(self, n): pass
    def r_TXMLDocument(self, n): pass


    # ---------- labels, edits ----------
    def r_TLabel(self, n):
        cap = n.props.get('Caption') or ''
        if cap:
            self.h.line(f'<span class="lbl">{esc(cap)}</span>')

    def r_TEdit(self, n):
        h = self.h
        txt  = n.props.get('Text') or ''
        w    = iprop(n.props, 'Width', 100)
        fid  = sid(n.name)
        hint = n.props.get('Hint') or n.name
        pw   = 'type="password"' if n.props.get('PasswordChar') not in (None, '#0', '') else 'type="text"'
        en   = '' if vprop(n.props, 'Enabled', True) else ' disabled'
        ro   = ' readonly' if bprop(n.props, 'ReadOnly') else ''
        h.line(f'<input id="{fid}" class="form-control-sm" {pw} '
               f'value="{esc(txt)}" style="width:{w}px;" '
               f'aria-label="{esc(hint)}"{en}{ro}>')

    def r_TMaskEdit(self, n):
        self.r_TEdit(n)

    def r_TSpinEdit(self, n):
        h = self.h
        val  = iprop(n.props, 'Value', 0)
        mn   = iprop(n.props, 'MinValue', 0)
        mx   = iprop(n.props, 'MaxValue', 100)
        w    = iprop(n.props, 'Width', 60)
        fid  = sid(n.name)
        hint = n.props.get('Hint') or n.name
        h.line(f'<input id="{fid}" type="number" class="form-control-sm" '
               f'min="{mn}" max="{mx}" value="{val}" '
               f'style="width:{w}px;" aria-label="{esc(hint)}">')

    # ---------- buttons ----------

    def _btn(self, n, variant='secondary'):
        h = self.h
        cap = n.props.get('Caption') or n.name or 'Button'
        en  = '' if vprop(n.props, 'Enabled', True) else ' disabled'
        onclick = n.props.get('OnClick')
        handler = ''
        if onclick:
            fn = sid(n.name) + '_Click'
            handler = f' onclick="{fn}()"'
            h.script(f'function {fn}(){{ dfmLog("Клик: {esc(cap)}"); }}')
        h.line(f'<button type="button" class="btn-{variant}"{en}{handler}>{esc(cap)}</button>')

    def r_TButton(self, n):  self._btn(n, 'primary')
    def r_TBitBtn(self, n):
        kind = n.props.get('Kind', 'bkCustom')
        self._btn(n, 'danger' if 'Cancel' in kind else 'primary')

    def r_TSpeedButton(self, n):
        if n.props.get('Caption'):
            self._btn(n, 'secondary')
        else:
            self.h.line('<div class="lamp" onclick="dfmToggleLamp(this)"></div>')

    # ---------- choices ----------
    def r_TRadioButton(self, n):
        h = self.h
        cap   = n.props.get('Caption') or n.name
        ck    = ' checked' if bprop(n.props, 'Checked') else ''
        base  = n.name.split('_')[0] if '_' in n.name else n.name
        group = 'rg_' + sid(base)
        fid   = sid(n.name)
        h.line(f'<label class="chk">'
               f'<input id="{fid}" type="radio" name="{group}"{ck}> '
               f'<span>{esc(cap)}</span></label>')

    def r_TRadioGroup(self, n):
        h = self.h
        cap   = n.props.get('Caption') or ''
        items = n.props.get('Items.Strings') or []
        if not isinstance(items, list): items = [str(items)]
        idx = iprop(n.props, 'ItemIndex', -1)
        gid = sid(n.name)
        h.line(f'<div class="radiogroup" role="radiogroup" '
               f'aria-label="{esc(cap or n.name)}">')
        if cap:
            h.line(f'  <div class="gb-title">{esc(cap)}</div>')
        h.line('  <div class="chk-grid">')
        for i, it in enumerate(items):
            ck  = ' checked' if i == idx else ''
            rid = f'{gid}_{i}'
            h.line(f'    <label class="chk">'
                   f'<input id="{rid}" type="radio" name="{gid}"{ck}> '
                   f'<span>{esc(it)}</span></label>')
        h.line('  </div>')
        h.line('</div>')

    def r_TComboBox(self, n):
        h = self.h
        items = n.props.get('Items.Strings') or []
        if not isinstance(items, list): items = [str(items)]
        txt  = n.props.get('Text', '')
        w    = iprop(n.props, 'Width', 100)
        fid  = sid(n.name)
        hint = n.props.get('Hint') or n.name
        opts = ''.join(
            f'<option{" selected" if str(it)==str(txt) else ""}>{esc(it)}</option>'
            for it in items
        )
        h.line(f'<select id="{fid}" class="form-select-sm" '
               f'aria-label="{esc(hint)}" style="width:{w}px;">{opts}</select>')

    def r_TCheckBox(self, n):
        h = self.h
        cap = n.props.get('Caption') or n.name
        ck  = ' checked' if bprop(n.props, 'Checked') else ''
        fid = sid(n.name)
        h.line(f'<label class="chk">'
               f'<input id="{fid}" type="checkbox"{ck}> '
               f'<span>{esc(cap)}</span></label>')

    def r_TListBox(self, n):
        h = self.h
        items = n.props.get('Items.Strings') or []
        if not isinstance(items, list): items = [str(items)]
        opts = ''.join(f'<option>{esc(it)}</option>' for it in items)
        multi = ' multiple' if n.props.get('MultiSelect') == 'True' else ''
        h.line(f'<select class="form-select form-select-sm" style="min-height:120px;"{multi}>{opts}</select>')

    def r_TCheckListBox(self, n):
        self.r_TListBox(n)

    # ---------- containers ----------

    def r_TPanel(self, n):
        h = self.h
        h.line('<div class="groupbox-inner" style="border:none;padding:0;">')
        for c in n.children:
            if c.props.get('Visible') == 'False': continue
            self.render_node(c)
        h.line('</div>')

    def r_TGroupBox(self, n):
        h = self.h
        cap = n.props.get('Caption') or ''
        h.line('<div class="groupbox">')
        if cap:
            h.line(f'  <div class="gb-title">{esc(cap)}</div>')
        if self._is_kv_panel(n):
            self._render_kv_panel(n)
        else:
            self._render_form_flow(n)
        h.line('</div>')


    def _is_kv_panel(self, n):
        """Информационная панель: все дети — TLabel, есть два столбца."""
        children = [c for c in n.children if c.props.get('Visible') != 'False']
        if len(children) < 2: return False
        if not all(c.cls == 'TLabel' for c in children): return False
        lefts = [iprop(c.props, 'Left', 0) for c in children]
        return max(lefts) - min(lefts) > 150


    def _render_kv_panel(self, n):
        """Пары "ключ — значение" по одинаковому Top."""
        h = self.h
        children = [c for c in n.children if c.props.get('Visible') != 'False']

        # Кластеризация по Top (допуск 5px)
        rows = []
        for c in children:
            top = iprop(c.props, 'Top', 0)
            for r in rows:
                if abs(r['top'] - top) <= 5:
                    r['items'].append(c); break
            else:
                rows.append({'top': top, 'items': [c]})
        rows.sort(key=lambda r: r['top'])

        h.line('<table class="kv-table">')
        for r in rows:
            items = sorted(r['items'], key=lambda c: iprop(c.props, 'Left', 0))
            if len(items) == 1:
                h.line(f'  <tr><td colspan="2">{esc(items[0].props.get("Caption") or "")}</td></tr>')
            else:
                k = esc(items[0].props.get('Caption') or '')
                v = esc(' '.join(str(c.props.get('Caption') or '') for c in items[1:]).strip())
                h.line(f'  <tr><td class="k">{k}</td><td class="v">{v}</td></tr>')
        h.line('</table>')


    def _render_form_flow(self, n):
        """Form layout: пары «label — edit» + чекбоксы/кнопки в потоке."""
        h = self.h
        children = [c for c in n.children if c.props.get('Visible') != 'False']
        # Сортируем по (Top, Left) — сохранит визуальный порядок
        children.sort(key=lambda c: (iprop(c.props, 'Top', 0), iprop(c.props, 'Left', 0)))

        edits = [c for c in children if c.cls in ('TEdit', 'TComboBox', 'TMaskEdit', 'TSpinEdit')]
        labels = [c for c in children if c.cls == 'TLabel']

        # Для каждого edit ищем ближайший label слева (Top ± 10px)
        paired = {}        # edit -> label
        used_labels = set()
        for e in edits:
            eL, eT = iprop(e.props, 'Left', 0), iprop(e.props, 'Top', 0)
            best, best_d = None, 1e9
            for lbl in labels:
                if lbl in used_labels: continue
                lL, lT = iprop(lbl.props, 'Left', 0), iprop(lbl.props, 'Top', 0)
                if lL >= eL or abs(lT - eT) > 10: continue
                d = eL - lL
                if d < best_d: best, best_d = lbl, d
            if best:
                paired[e] = best
                used_labels.add(best)

        h.line('<div class="groupbox-inner">')
        for c in children:
            if c in used_labels:
                continue
            if c in paired:
                cap = paired[c].props.get('Caption') or ''
                # было: <label>{cap}</label>
                h.line(f'  <div class="field"><label for="{sid(c.name)}">{esc(cap)}</label>')
                h.push(); h.push()
                self.render_node(c)
                h.pop(); h.pop()
                h.line('  </div>')
            else:
                self.render_node(c)            
        h.line('</div>')

    def r_TTabSheet(self, n):
        # rendered by TPageControl — safe fallback
        for c in n.children: self.render_node(c)

    def r_TPageControl(self, n):
        h = self.h
        pcid = sid(n.name)
        pages = [c for c in n.children if c.cls == 'TTabSheet']
        if not pages: return

        h.line('<div class="pagecontrol">')
        h.line('  <div class="tabs-bar" role="tablist">')
        for i, pg in enumerate(pages):
            cls = ' active' if i == 0 else ''
            cap = pg.props.get('Caption') or pg.name
            h.line(f'    <a class="tab{cls}" href="#{pcid}_p{i}" role="tab">{esc(cap)}</a>')
        h.line('  </div>')

        h.line('  <div class="tab-panes">')
        for i, pg in enumerate(pages):
            cls = ' active' if i == 0 else ''
            h.line(f'    <div class="tab-pane{cls}" id="{pcid}_p{i}" role="tabpanel">')
            h.push(); h.push()
            for c in pg.children:
                if c.props.get('Visible') == 'False': continue
                self.render_node(c)
            h.pop(); h.pop()
            h.line('    </div>')
        h.line('  </div>')
        h.line('</div>')

    def r_TScrollBox(self, n):
        h = self.h
        h.line(f'<div style="overflow:auto;max-height:400px;border:1px solid #ccc;padding:4px;">')
        h.push()
        for c in n.children: self.render_node(c)
        h.pop()
        h.line('</div>')

    def r_TToolBar(self, n):
        h = self.h
        h.line('<div class="toolbar">')
        for c in n.children:
            if c.props.get('Visible') == 'False': continue
            self.render_node(c)
        h.line('</div>')

    def r_TToolButton(self, n):
        h = self.h
        cap  = n.props.get('Caption') or n.name
        hint = n.props.get('Hint') or ''
        en   = '' if vprop(n.props, 'Enabled', True) else ' disabled'
        h.line(f'<button type="button" title="{esc(hint)}"{en}>{esc(cap)}</button>')

    def r_TStatusBar(self, n):
        self.h.line('<div class="statusbar"><span>Готов</span><span>—</span></div>')

    def r_TBevel(self, n):
        self.h.line('<div class="dfm-bevel"></div>')

    def r_TSplitter(self, n):
        pass

    def r_THeader(self, n):
        h = self.h
        sections = n.props.get('Sections.Strings') or []
        if not isinstance(sections, list): sections = []
        h.line('<div class="dfm-header" style="display:flex;background:#d4d0c8;border:1px solid #888;">')
        for s in sections:
            h.line(f'<div style="flex:1;border-right:1px solid #888;padding:2px 4px;">{esc(s)}</div>')
        h.line('</div>')

    def r_TMemo(self, n):
        h = self.h
        lines = n.props.get('Lines.Strings') or []
        text  = '\n'.join(str(x) for x in lines) if isinstance(lines, list) else str(lines)
        fid   = sid(n.name)
        hint  = n.props.get('Hint') or n.name
        h.line(f'<textarea id="{fid}" class="memo" '
               f'aria-label="{esc(hint)}">{esc(text)}</textarea>')



    # ---------- grids ----------

    def r_TStringGrid(self, n):
        h = self.h
        cols = max(1, iprop(n.props, 'ColCount', 2))
        rows = max(1, iprop(n.props, 'RowCount', 2))
        hint = n.props.get('Hint') or n.name
        h.line(f'<table class="grid" role="grid" '
               f'aria-label="{esc(hint)}">')
        for r in range(rows):
            h.line('  <tr>' + ''.join('<td></td>' for _ in range(cols)) + '</tr>')
        h.line('</table>')


    def r_TDrawGrid(self, n):
        self.r_TStringGrid(n)

    # ---------- misc visual ----------

    def r_TImage(self, n):
        colors = {'Image1': '#c00', 'Image2': '#0a0', 'Image3': '#fa0', 'Image4': '#888'}
        color = colors.get(n.name, '#888')
        self.h.line(f'<span class="dfm-img" style="background:{color};width:14px;height:14px;"></span>')

    def r_TPaintBox(self, n):
        self.h.line('<div class="dfm-paintbox"></div>')

    def r_TShape(self, n):
        self.h.line('<div style="width:50px;height:50px;border:1px solid #333;"></div>')

    def r_TChart(self, n):
        self.h.line(f'<div class="dfm-chart">TChart: {esc(n.name)} — замените на Chart.js/ECharts</div>')

    def r_TProgressBar(self, n):
        self.h.line('<div class="progress"><div>0%</div></div>')

    def r_TGauge(self, n):
        self.r_TProgressBar(n)

    def r_TTrackBar(self, n):
        h = self.h
        mn   = iprop(n.props, 'Min', 0)
        mx   = iprop(n.props, 'Max', 100)
        fid  = sid(n.name)
        hint = n.props.get('Hint') or n.name
        h.line(f'<input id="{fid}" type="range" '
               f'aria-label="{esc(hint)}" min="{mn}" max="{mx}">')

    def r_TScrollBar(self, n):
        self.r_TTrackBar(n)

    def r_TUpDown(self, n):
        self.h.line('<input type="number" class="form-control form-control-sm">')

    # ---------- file/directory ----------

    def r_TDirectoryListBox(self, n):
        self.h.line('<ul class="list-group" style="max-height:200px;overflow-y:auto;">'
                    '<li class="list-group-item">C:\\</li>'
                    '<li class="list-group-item">C:\\Windows</li>'
                    '<li class="list-group-item">C:\\Program Files</li></ul>')

    def r_TFileListBox(self, n):
        self.h.line('<ul class="list-group" style="max-height:200px;overflow-y:auto;">'
                    '<li class="list-group-item">file1.txt</li>'
                    '<li class="list-group-item">file2.txt</li></ul>')

    def r_TDriveComboBox(self, n):
        self.h.line('<select class="form-select form-select-sm">'
                    '<option>C:</option><option>D:</option></select>')

    def r_TFilterComboBox(self, n):
        self.r_TComboBox(n)

    # ---------- menus ----------

    def r_TMenuItem(self, n):
        # only top-level items rendered as menu strip
        cap = n.props.get('Caption') or ''
        if cap:
            self.h.line(f'<div class="dfm-menu"><span>{esc(cap)}</span></div>')


# ============================================================
# Main
# ============================================================

def is_binary_dfm(path):
    with open(path, 'rb') as f:
        return f.read(4) == b'TPF0'

def read_dfm_text(path):
    raw = Path(path).read_bytes()
    for enc in ('utf-8-sig', 'utf-8', 'cp1251', 'latin-1'):
        try:
            return raw.decode(enc)
        except UnicodeDecodeError:
            continue
    return raw.decode('latin-1', errors='replace')

def strip_binary_props(text):
    """
    Удаляет бинарные свойства вида:
        Picture.Data = { ... }
        Glyph.Data   = { ... }
        Bitmap       = { ... }
        Icon.Data    = { ... }
    Пропускает строки до закрывающей '}', которая стоит на отдельной
    строке или в конце строки, и после которой идёт DFM-разметка.
    """
    lines = text.split('\n')
    out, skipping = [], False
    for line in lines:
        if skipping:
            # ищем закрывающую }
            if '}' in line:
                # проверяем, что после } идёт конец строки или пробелы
                tail = line.split('}', 1)[1].strip()
                if tail == '':
                    skipping = False
                    continue
                # если после } есть мусор — это НЕ настоящая закрывающая скобка
                # продолжаем пропускать (остаток строки — часть бинарных данных)
                continue
            continue
        # проверяем, не начинается ли бинарное свойство
        m = re.match(
            r'\s*(Picture\.Data|Glyph\.Data|Icon\.Data|Bitmap)\s*=\s*\{',
            line
        )
        if m:
            # если { и } на одной строке (короткая картинка)
            if '}' in line[m.end():]:
                continue
            skipping = True
            continue
        out.append(line)
    return '\n'.join(out)

def convert_file(in_path, out_path=None):
    p = Path(in_path)
    if is_binary_dfm(p):
        print(f"[SKIP] {p.name}: binary DFM (TPF0 header).")
        print(f"       Convert first:  convert.exe {p.name} {p.stem}.txt.dfm")
        print(f"       Or open in Delphi IDE → 'Save As Text'.")
        return None
    text = read_dfm_text(p)
    text = strip_binary_props(text)       # ← НОВОЕ
    try:
        root = DfmParser(text).parse()
    except SyntaxError as e:
        print(f"[ERR ] {p.name}: {e}")
        return None
    html = Renderer(root).render()
    if out_path is None:
        out_path = p.with_suffix('.html')
    Path(out_path).write_text(html, encoding='utf-8')
    print(f"[ OK ] {p.name}  ->  {out_path}  ({len(html)} bytes)")
    return out_path

def main():
    ap = argparse.ArgumentParser(
        description='Convert Delphi DFM forms to HTML (Bootstrap 5).')
    ap.add_argument('input', help='DFM file or directory')
    ap.add_argument('-o', '--output', help='output .html file or directory')
    ap.add_argument('-r', '--recursive', action='store_true',
                    help='recurse into subdirectories')
    args = ap.parse_args()
    inp = Path(args.input)
    if inp.is_dir():
        out_dir = Path(args.output) if args.output else inp
        out_dir.mkdir(parents=True, exist_ok=True)
        pattern = '**/*.dfm' if args.recursive else '*.dfm'
        for dfm in sorted(inp.glob(pattern)):
            rel = dfm.relative_to(inp).with_suffix('.html')
            convert_file(dfm, out_dir / rel)
    else:
        convert_file(inp, args.output)

if __name__ == '__main__':
    main()