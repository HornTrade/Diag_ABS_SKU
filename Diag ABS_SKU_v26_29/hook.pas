unit hook;


interface

implementation


uses

  SysUtils, Classes, Windows, Messages,mainABSdiag;

const

  {пользовательские сообщения}
  wm_LeftShow_Event = wm_User + 133;
  wm_RightShow_Event = wm_User + 134;
  wm_UpShow_Event = wm_User + 135;
  wm_DownShow_Event = wm_User + 136;

  {handle для ловушки}
  HookHandle: hHook = 0;

var

  SaveExitProc: Pointer;

  {собственно ловушка}

function Key_Hook(Code: integer; wParam: word;
  lParam: Longint): Longint; stdcall; export;
var
  H: HWND;
begin

  {если Code>=0, то ловушка может обработать событие}
  if (Code >= 0) and (lParam and $40000000 = 0) then
  begin
    {ищем окно по имени класса и по заголовку
    (Caption формы управляющей программы должен быть равен 'XXX' !!!!)}
    H := FindWindow('TForm1', 'XXX');

    {это те клавиши?}
    case wParam of
      VK_Left: SendMessage(H, wm_LeftShow_Event, 0, 0);
      VK_Right: SendMessage(H, wm_RightShow_Event, 0, 0);
      VK_Up: SendMessage(H, wm_UpShow_Event, 0, 0);
      VK_Down: SendMessage(H, wm_DownShow_Event, 0, 0);
    end;
    {если 0, то система должна дальше обработать это событие}
    {если 1 - нет}
    Result := 0;
  end

  else if Code < 0 {если Code<0, то нужно вызвать следующую ловушку} then
    Result := CallNextHookEx(HookHandle, Code, wParam, lParam);
end;

{при выгрузке DLL надо снять ловушку}

procedure LocalExitProc; far;
begin

  if HookHandle <> 0 then
  begin
    UnhookWindowsHookEx(HookHandle);
    ExitProc := SaveExitProc;
  end;
end;

exports Key_Hook;

{инициализация DLL при загрузке ее в память}
begin
  {устанавливаем ловушку}

  HookHandle := SetWindowsHookEx(wh_Keyboard, @Key_Hook,
    hInstance, 0);
  if HookHandle = 0 then
    MessageBox(0, 'Unable to set hook!', 'Error', mb_Ok)
  else
  begin
    SaveExitProc := ExitProc;
    ExitProc := @LocalExitProc;
  end;

end.
 