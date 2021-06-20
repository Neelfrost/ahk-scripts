; ---------------------------------------------------------------------------- ;
;                   Emulates push to talk in Microsoft teams                   ;
; ---------------------------------------------------------------------------- ;

#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
SetKeyDelay, 50, 50

#IfWinActive, ahk_exe Teams.exe
$~v::
Send, ^+m
While, (GetKeyState("v", "P"))
{
    Sleep, 100
}
Send, ^+m
Return