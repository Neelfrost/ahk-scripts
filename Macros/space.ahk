; ---------------------------------------------------------------------------- ;
;                            Space Engineers Macros                            ;
; ---------------------------------------------------------------------------- ;

#IfWinActive, ahk_exe SpaceEngineers.exe
; Selects hotbar item on ctrl+scroll
cycle:=0
^WheelUp::
    cycle-- ; subtract 1 from the cycle
    If cycle < 1
        cycle := 9
    SendEvent, ^{%cycle% Down}
    Sleep, 50
    SendEvent, ^{%cycle% Up}
Return

^WheelDown::
    cycle++ ; add 1 to the cycle
    If cycle > 9
        cycle := 1
    SendEvent, ^{%cycle% Down}
    Sleep, 50
    SendEvent, ^{%cycle% Up}
Return