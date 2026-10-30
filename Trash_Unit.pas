unit Trash_Unit;

interface

Function HexToByte(HexChar:Char):Byte;

implementation

Function HexToByte;
begin
        case HexChar of
        '0': HexToByte:=0;
        '1': HexToByte:=1;
        '2': HexToByte:=2;
        '3': HexToByte:=3;
        '4': HexToByte:=4;
        '5': HexToByte:=5;
        '6': HexToByte:=6;
        '7': HexToByte:=7;
        '8': HexToByte:=8;
        '9': HexToByte:=9;
        'A','a': HexToByte:=10;
        'B','b': HexToByte:=11;
        'C','c': HexToByte:=12;
        'D','d': HexToByte:=13;
        'E','e': HexToByte:=14;
        'F','f': HexToByte:=15;
        end;
end;

end.
 