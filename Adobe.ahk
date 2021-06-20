; ---------------------------------------------------------------------------- ;
;                               Kill adobe tasks                               ;
; ---------------------------------------------------------------------------- ;
; Kills background Adobe tasks when Adobe programs are no longer running

#KeyHistory 0
#NoEnv
#NoTrayIcon
#Persistent
#SingleInstance, Force
SendMode Input
SetWorkingDir %A_ScriptDir%

SetTimer, CloseAdobe, 60000
Return

; Coroutine to stop misc. adobe exes
CloseAdobe:
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
