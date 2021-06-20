; ---------------------------------------------------------------------------- ;
;                       Octavia crouch spam, ability spam                      ;
; ---------------------------------------------------------------------------- ;

#MaxThreadsPerHotkey, 2
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; Coroutine to kill script if Warframe is closed
SetTimer, Close, 1000
Return

#IfWinActive, ahk_exe Warframe.x64.exe

; Suspend Script
Media_Play_Pause::Suspend

; Spam crouch on mouse 4
XButton1::
    Loop, 5
    {
        Send, {LCtrl down}
        Sleep, 75
        Send, {LCtrl up}
        Sleep, 75
    }
Return

; Press all abilities on `
`::
    Send, 1
    Sleep, 750
    Send, 2
    Sleep, 750
    Send, 3
    Sleep, 750
    Send, 4
Return

#IfWinActive

Close:
    WinWaitClose, ahk_exe Warframe.x64.exe
ExitApp
