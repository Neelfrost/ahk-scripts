; ---------------------------------------------------------------------------- ;
;                             Place all wisp motes                             ;
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

; Place all motes on 1
; Modifier key (shift, ctrl, alt) + 1 uses default behavior
$1::
    Loop, 3
    {
        Send, {1 down}
        Sleep, 600 ; ability hold time, change if required
        Send, {1 up}
        Sleep, 600 ; ability hold time, change if required
        Send, 1
        Sleep, 250 ; delay next cast
    }
Return

#IfWinActive

Close:
    WinWaitClose, ahk_exe Warframe.x64.exe
ExitApp
