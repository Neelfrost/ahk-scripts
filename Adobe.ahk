; ----------------------------- Kill adobe tasks ----------------------------- ;

#Persistent
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, Force
#KeyHistory 0
#NoTrayIcon

SetTimer, CloseAdobe, 60000
Return

CloseAdobe:
; Coroutine to stop misc. adobe exes
if (WinExist("ahk_exe Photoshop.exe") || WinExist("ahk_exe Adobe Premiere Pro.exe"))
{
    Return
}
else 
{
    Process, Close, AdobeIPCBroker.exe
    Process, Close, CCLibrary.exe
    Process, Close, CCXProcess.exe
    Process, Close, acrotray.exe
}
Return