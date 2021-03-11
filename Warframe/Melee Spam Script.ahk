#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#MaxThreadsPerHotkey, 2

SetTimer, Close, 1000
Toggle := False

#IfWinActive, ahk_exe Warframe.x64.exe

; Suspend Script
Media_Play_Pause::
Suspend

; Hold e to spam melee
$e::
    While GetKeyState("e","P")
    {
        Send, e
        Sleep, 50 ; 50 millisecond delay between each press
    }
Return

; Press ` to toggle melee spam
~`::
    Toggle := !Toggle

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