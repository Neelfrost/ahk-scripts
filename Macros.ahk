; ---------------------------------------------------------------------------- ;
;                         Collection of everyday macros                        ;
; ---------------------------------------------------------------------------- ;

#Persistent
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, Force
#KeyHistory 0
; #UseHook
; #InstallMouseHook
; #InstallKeybdHook
; # : Win, ! : Alt, ^ : Control, + : Shift

; Check if admin, if not re-run as admin
if not A_IsAdmin
{
    try
    Run *RunAs "%A_ScriptFullPath%"
    catch
        MsgBox, 4144, Could not run as admin.`n`nRun again and select "Yes" when asked., 1
    ExitApp
}

Menu, Tray, Icon, D:\Neel's Folder\Auto Hotkey Scripts\Icon\script.ico

; Function called on clipboard changed
OnClipboardChange("Torrent")
Return

; #region global hotkeys
; Center active window on scrolllock
ScrollLock::CenterActiveWindow()

; Rebind Mouse 4 to Middle Mouse button
XButton1:: MButton

; Rebind Capslock to Esc for vim, shift + capslock for normal capslock
CapsLock::Esc
+CapsLock::CapsLock

; Reload script alt+F12
!F12::
    Reload
Return

; Launch WhatsApp calculator
Launch_App2::
    Run, "C:\Users\Neel Basak\AppData\Local\WhatsApp\WhatsApp.exe"
Return

; Launch Unity script reference alt+mail
!Launch_Mail::
    Run, "C:\Program Files\Unity\Hub\Editor\2020.1.0f1\Editor\Data\Documentation\en\ScriptReference\index.html"
Return

; Launch Gmail mail
Launch_Mail::
    Run, "https://www.gmail.com/"
Return

; Launch Spotify alt+play
!Media_Play_Pause::
    Run, "C:\Users\Neel Basak\AppData\Roaming\Spotify\Spotify.exe"
Return

; Disable Alt Acceleration
~LAlt::
    Sendinput {Blind}{sc0E9}
    KeyWait, LAlt ; so that it doesn't keep spamming SC0E9 (as seen from an AHK window Key history and script info... window.)
Return

~RAlt::
    Sendinput {Blind}{sc0E9}
    KeyWait, RAlt ; so that it doesn't keep spamming SC0E9
Return

; Delete word before cursor on ctrl + backspace
^BackSpace::
    Send, ^+{Left}{Del}
Return

; #endregion

; #region Functions
; Added torrent to qbittorrent client using qbt-cli
Torrent()
{
    if (InStr(Clipboard, "magnet:?xt") || InStr(Clipboard, ".torrent"))
    {
        Run %ComSpec% /c "qbt torrent add url "%Clipboard%"",, Hide
        MsgBox, , Torrent Manager, Torrent added sucessfully, 2
        Clipboard := ""
    }
    else
        Return
}

; Centers active window
; Taken and modified from:
; https://superuser.com/questions/156351/keyboard-shortcut-in-windows-7-to-center-window
CenterActiveWindow()
{
    ; Get min/max status of active window
    WinGet, isMinimized, MinMax, A

    ; center window if not max or min
    if (isMinimized == 0)
    {
        ; Get the window handle from de active window.
        winHandle := WinExist("A")

        ; Get active window's widht and height
        WinGetPos, tempX, tempY, winW, winH, A

        VarSetCapacity(monitorInfo, 40)
        NumPut(40, monitorInfo)

        ; Get the current monitor from the active window handle.
        monitorHandle := DllCall("MonitorFromWindow", "uint", winHandle, "uint", 0x2)
        DllCall("GetMonitorInfo", "uint", monitorHandle, "uint", &monitorInfo)

        ; Get WorkArea bounding coordinates of the current monitor.
        A_Left := NumGet(monitorInfo, 20, "Int")
        A_Top := NumGet(monitorInfo, 24, "Int")
        A_Right := NumGet(monitorInfo, 28, "Int")
        A_Bottom := NumGet(monitorInfo, 32, "Int")

        ; Calculate window coordinates.
        winX := (A_Left + A_Right - winW) / 2
        winY := (A_Top + A_Bottom - winH) / 2

        ; MsgBox, %A_Left%`,%A_Top%`,%A_Right%`,%A_Bottom%`,%winX%`,%winY%,%winW%`,%winH%
        WinMove, A,, winX, winY, winW, winH
    }
    else
        Return
}
; #endregion

; #region Premiere Pro Macros
#IfWinActive, ahk_exe Adobe Premiere Pro.exe
; Lock video -> cut, lock audio -> cut
F4::
    Send, {F1}
    Sleep, 200
    Send, w
    Sleep, 200
    Send, {F1}
    Send, {F2}
    Sleep, 200
    Send, w
    Sleep, 200
    Send, {F2}
Return

; Lock video -> ripple delete
F5::
    Send, {F1}
    Sleep, 200
    Send, {F3}
    Sleep, 200
    Send, {F1}
Return

; Mouse button 5 -> Delete
XButton2::Delete
; #endregion

; #region Space Engineer's Macros
#IfWinActive, ahk_exe SpaceEngineers.exe
; Selects hotbar item on ctrl+scroll
cycle:=0
^WheelUp::
    cycle-- ; subtract 1 from the cycle
    If cycle < 1
        cycle := 9
    SendEvent, ^{%cycle% Down}
    Sleep, 50
    SendEvent, ^{%cycle% Up}
Return

^WheelDown::
    cycle++ ; add 1 to the cycle
    If cycle > 9
        cycle := 1
    SendEvent, ^{%cycle% Down}
    Sleep, 50
    SendEvent, ^{%cycle% Up}
Return
; #endregion

; #region Notion Macros
#IfWinActive, ahk_exe Notion.exe
; Insert chem format
^t::
    Send, ^+e
    Sleep, 50
    Send, {Home}
    Send, {Text}\ce{
    Send, {End}
    Send, {Text}}
    Send, {Enter}
    Sleep, 200
    Send, {Space}
Return

; Bold + italics
^e::
    Send, ^i
    Send, ^b
    Send, {End}
Return
; #endregion

; Reset Application specific macros
#IfWinActive

; #region Experimental Vim Mode
; Vim like hjkl movement
ToggleVim := False
$`::
    ; waits for a double tap
    KeyWait, ``
    KeyWait, ``, D T0.2
    if (ErrorLevel)
    {
        Send, ``
    }
    else
    {
        ToggleVim := !ToggleVim
    }

    if (ToggleVim)
        ToolTip, Vim Mode On, 795, 0
    else
        ToolTip,
Return

#if (ToggleVim)
{
    k::Up
    j::Down
    h::Left
    l::Right
}
#if
; #endregion

; #region Old LaTeX Macros
; ; Add ch : ctrl + ins
; ^Insert::
;     Send, {{}
;     Send, {Left}{Left}
;     Send, {Text}\ch
;     Sleep, 300
;     Send, {Esc}
; Return

; ; Add emph : alt  + ins
; !Insert::
;     Send, ^l^e
; Return

; ; Add new line \item : shift + ins
; +Insert::
;     Send, ^l^{Enter}
; Return

; ; Insert subscript : ctrl + 1
; ^1::
;     Send, {Text}_{}
;     Send, {Left}
; Return

; ; Insert supercript : ctrl + 2
; ^2::
;     Send, {Text}^{}
;     Send, {Left}
; Return
; #endregion