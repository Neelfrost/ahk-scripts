; ---------------------------------------------------------------------------- ;
;     Launches Google Meet Link or opens Microsoft Teams at specified time     ;
; ---------------------------------------------------------------------------- ;

#SingleInstance, Off
#Persistent
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

_Hour := 0
_Min := 0
_Link := ""

SetTimer, Timer, 60000
Return

; Press alt+` to open gui
If (!_Link){
    !`::
        Gui, Add, Text,, Enter Link:
        Gui, Add, Edit, v_Link
        Gui, Add, Text,, Enter Hour:
        Gui, Add, Edit, v_Hour
        Gui, Add, Text,, Enter Minutes:
        Gui, Add, Edit, v_Min
        Gui, Add, Button, Default w80, OK
        Gui, Show, AutoSize Center, Enter Lecture Details
    Return
}

ButtonOK:
    Gui, Submit 
    Gui, Destroy
    TrayTip, Lecture Launcher, Lecture at %_Hour%:%_Min%, 3600
Return

Timer:
    if (A_Hour = _Hour && A_Min >= _Min) {
        if (%_Link% = teams)
        {
            ; Launch Teams
            Run, "C:\Users\Neel Basak\AppData\Local\Microsoft\Teams\Update.exe" --processStart "Teams.exe"
        }
        else
        {
            ; Launch Google Meet
            Run, %_Link%
        }

        ; Launch OBS Studio
        if (!WinExist("ahk_exe obs64.exe")) {
            Run, "C:\Program Files\obs-studio\bin\64bit\obs64.exe", C:\Program Files\obs-studio\bin\64bit
            WinWait, ahk_exe obs64.exe
        }
        ExitApp
    }
Return