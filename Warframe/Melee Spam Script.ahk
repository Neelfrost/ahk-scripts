; ---------------------------------------------------------------------------- ;
;                                  Spam melee                                  ;
; ---------------------------------------------------------------------------- ;

#MaxThreadsPerHotkey, 2
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; For toggle tooltip
CoordMode, ToolTip, Client

Toggle := False

; Coroutine to kill script if Warframe is closed
SetTimer, Close, 1000
Return

#IfWinActive, ahk_exe Warframe.x64.exe

; Suspend Script
Media_Play_Pause::Suspend

; Hold e to spam melee
$e::
    While GetKeyState("e","P")
    {
        Send, e
        Sleep, 50 ; 50 millisecond delay between each press
    }
Return

; Press ` to toggle melee spam
`::
    Toggle := !Toggle

    If (Toggle)
        ToolTip, Toggle On, 4, 4
    Else
        ToolTip

    While (Toggle)
    {
        Send, e
        Sleep, 50 ; 50 millisecond delay between each press
    }

Return

#IfWinActive

Close:
    WinWaitClose, ahk_exe Warframe.x64.exe
ExitApp
