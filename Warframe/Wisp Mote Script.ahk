#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

SetTimer, Close, 1000

#IfWinActive, ahk_exe Warframe.x64.exe

; Suspend Script
Media_Play_Pause::
Suspend

; Place All Motes on 1
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