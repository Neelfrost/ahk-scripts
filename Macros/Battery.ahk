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
Return