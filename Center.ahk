; ---------------------------------------------------------------------------- ;
;                      Centers active window automatically                     ;
; ---------------------------------------------------------------------------- ;

#KeyHistory 0
#NoEnv
#Persistent
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

SetTitleMatchMode, 2

#Include, D:\My Folder\Auto Hotkey Scripts\Macros\functions.ahk

; Check if admin, if not re-run as admin
if not A_IsAdmin
{
    try
    Run *RunAs "%A_ScriptFullPath%"
    catch
        MsgBox, 4144, Could not run as admin.`n`nRun again and select "Yes" when asked., 1
    ExitApp
}

Menu, Tray, Icon, D:\My Folder\Auto Hotkey Scripts\Icon\center.ico

; Filers
GroupAdd, CenterAllowed, ahk_class CabinetWClass
GroupAdd, CenterAllowed, ahk_exe alacritty.exe
GroupAdd, CenterAllowed, ahk_class #32770
GroupAdd, CenterAllowed, Folder Options
GroupAdd, CenterAllowed, ahk_exe teracopy.exe
GroupAdd, CenterAllowed, ahk_exe TeraCopy.exe
GroupAdd, CenterAllowed, Properties
GroupAdd, CenterAllowed, Copying
GroupAdd, CenterAllowed, ahk_class OperationStatusWindow

GroupAdd, ResizeAllowed, ahk_class #32770, Save
GroupAdd, ResizeAllowed, ahk_class #32770, save
GroupAdd, ResizeAllowed, ahk_class #32770, Open
GroupAdd, ResizeAllowed, ahk_class #32770, open
GroupAdd, ResizeAllowed, ahk_exe PickerHost.exe

GroupAdd, CenterNotAllowed, ahk_exe Launchy.exe

GroupAdd, ResizeNotAllowed, ahk_exe Launchy.exe
GroupAdd, ResizeNotAllowed, ahk_class #32770, Run
GroupAdd, ResizeNotAllowed, Folder Options
GroupAdd, ResizeNotAllowed, ahk_exe teracopy.exe
GroupAdd, ResizeNotAllowed, ahk_exe TeraCopy.exe
GroupAdd, ResizeNotAllowed, Properties
GroupAdd, ResizeNotAllowed, ahk_exe ThrottleStop.exe
GroupAdd, ResizeNotAllowed, ahk_exe HWiNFO64.exe
GroupAdd, ResizeNotAllowed, ahk_exe ClipboardFusion.exe
GroupAdd, ResizeNotAllowed, ahk_exe EXCEL.EXE

; Coroutine
SetTimer, checkWindow, 250
Return

ActiveLastTitle := ActiveNowTitle

checkWindow:
WinGetTitle, ActiveNowTitle, A

if (ActiveNowTitle <> ActiveLastTitle)
{
    if !WinActive("ahk_group CenterNotAllowed") && WinActive("ahk_group CenterAllowed")
        CenterActiveWindow()
    if !WinActive("ahk_group ResizeNotAllowed") && WinActive("ahk_group ResizeAllowed")
        SetSize()
}
ActiveLastTitle := ActiveNowTitle
Return

; Pause script on Pausebreak
Pause::Pause
