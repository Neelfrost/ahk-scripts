#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

SetTimer, Close, 1000
Toggle := False

#IfWinActive, ahk_exe Warframe.x64.exe
Media_Play_Pause::
Suspend

; Spam Spores on `
~`::
    Toggle := !Toggle

    While(Toggle)
    {
        Send, 1
        Sleep, 500 ; 500 millisecond delay between each cast
    }
Return
#IfWinActive

Close:
    WinWaitClose, ahk_exe Warframe.x64.exe
ExitApp