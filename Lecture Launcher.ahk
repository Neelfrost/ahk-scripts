; ---------------------------------------------------------------------------- ;
;     Launches Google Meet Link or opens Microsoft Teams at specified time     ;
; ---------------------------------------------------------------------------- ;

#KeyHistory 0
#NoEnv
#Persistent
#SingleInstance, Off
SendMode Input
SetWorkingDir %A_ScriptDir%

Menu, Tray, Icon, D:\My Folder\Auto Hotkey Scripts\Icon\clock.ico

thisHour := 0
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
    Menu, Tray, Tip, Lecture at %_Hour%:%_Min%
Return

Timer:
    FormatTime, thisHour,, h
    if (thisHour = _Hour && A_Min >= _Min) {
        if (InStr(_Link, "teams"))
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
