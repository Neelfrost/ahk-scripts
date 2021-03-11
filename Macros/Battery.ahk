; ---------------------------------------------------------------------------- ;
;                Displays Notification when battery < 40 or > 90               ;
; ---------------------------------------------------------------------------- ;

#Persistent
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#Include D:\Neel's Folder\Auto Hotkey Scripts\Macros\lib.ahk

Menu, Tray, Icon, D:\Neel's Folder\Auto Hotkey Scripts\Icon\battery.ico

notificationShown := False
adobeLaunched := False
batteryLife := 0
toggle := False

SetTimer, Battery, 10000
Return

Battery:
    BatteryStatus := GetBatteryStatus()
    batteryLife := BatteryStatus.batteryLifePercent
    batteryisCharging := BatteryStatus.acLineStatus

    if (batteryLife <= 40 && batteryisCharging == 0)
    {
        if (notificationShown == False)
        {
            SoundPlay, %A_WinDir%\Media\notify.wav
            MsgBox, , Battery Notification, Switch On, 5
            notificationShown := True
        }
    }
    ; else if (batteryLife >= 90 && batteryisCharging != 0)
    ; {
    ;     if (notificationShown == False)
    ;     {
    ;         SoundPlay, %A_WinDir%\Media\notify.wav
    ;         MsgBox, , Battery Notification, Switch Off, 5
    ;         notificationShown := True
    ;     }
    ; }
    else
    {
        notificationShown := False
    }

    ; Coroutine to stop misc. adobe exes
    if (WinExist("ahk_exe Photoshop.exe") || WinExist("ahk_exe Adobe Premiere Pro.exe"))
    {
        adobeLaunched := True
        Return
    }
    else if (adobeLaunched)
    {
        Process, Close, AdobeIPCBroker.exe
        Process, Close, CCLibrary.exe
        Process, Close, CCXProcess.exe
        adobeLaunched := False
    }
Return