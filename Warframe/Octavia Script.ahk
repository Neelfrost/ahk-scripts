#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Icon
Menu, Tray, Icon, % "D:\Neel's Folder\OctaviaOn.ico"
SetTimer, Close, 1000

#IfWinActive, ahk_exe Warframe.x64.exe

; Suspend Script
Media_Play_Pause::
Suspend

; Spam Crouch on Mouse 4
XButton1::
    Loop, 5
    {
        Send, {LCtrl down}
        Sleep, 75
        Send, {LCtrl up}
        Sleep, 75
    }
Return

; Press All abilities on `
`::
    Send, 1
    Sleep, 750
    ;Send, 2
    ;Sleep, 750
    Send, 3
    Sleep, 750
    Send, 4
Return
#IfWinActive

Close:
    WinWaitClose, ahk_exe Warframe.x64.exe
ExitApp