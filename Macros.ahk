; ---------------------------------------------------------------------------- ;
;                                  Main Macros                                 ;
; ---------------------------------------------------------------------------- ;

#KeyHistory 0
#MaxThreadsPerHotkey, 2
#NoEnv
#Persistent
#SingleInstance, Force
SendMode Input
SetWorkingDir %A_ScriptDir%

SetTitleMatchMode, 2

; # : Win, ! : Alt, ^ : Control, + : Shift

; Filters to fix unintended behavior in nvim guis, photoshop
GroupAdd, DelWord, ahk_exe Photoshop.exe
GroupAdd, DelWord, ahk_exe neovide.exe
GroupAdd, DelWord, ahk_exe nvim-qt.exe
GroupAdd, DelWord, ahk_exe goneovim.exe

; Check if admin, if not re-run as admin
if not A_IsAdmin
{
    try
    Run *RunAs "%A_ScriptFullPath%"
    catch
        MsgBox, 4144, Could not run as admin.`n`nRun again and select "Yes" when asked., 1
    ExitApp
}

Menu, Tray, Icon, D:\My Folder\Auto Hotkey Scripts\Icon\keyboard.ico

; Function called on clipboard changed
OnClipboardChange("Torrent")
Return

; Reload script alt+F12
!F12::
    Reload
Return

; Rebind Mouse 4 to Middle Mouse button
XButton1:: MButton

; Center active window
NumLock::CenterActiveWindow()
!NumLock::SetSize()

; Maximize on Win+Shift+Up
; Minimize on Win+Shift+Down
#+Up::WinMaximize, A
#+Down::WinMinimize, A

; Rebind Esc to Capslock
; Disable Capslock in vim
; Use Shift + Capslock if Capslock is needed 
CapsLock::Esc
#IfWinNotActive, ahk_exe nvim-qt.exe
+CapsLock::CapsLock
#IfWinNotActive

; Launch WhatsApp
Launch_App2::
    Run, "C:\Users\Neel Basak\AppData\Roaming\OpenShell\Pinned\WhatsApp Desktop.lnk"
Return

; Launch Unity script reference 
!Launch_Mail::
    Run, "C:\Program Files\Unity\Hub\Editor\2020.1.0f1\Editor\Data\Documentation\en\ScriptReference\index.html"
Return

; Launch Gmail
Launch_Mail::
    Run, "https://www.gmail.com/"
Return

; Launch Spotify 
!Media_Play_Pause::
    Run, "C:\Users\Neel Basak\AppData\Roaming\OpenShell\Pinned\Spotify.lnk"
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

#IfWinNotActive, ahk_group DelWord
; Delete word before cursor on ctrl + backspace, everywhere 
^BackSpace::
    Send, ^+{Left}{Del}
Return

; Delete word after cursor on ctrl + delete, everywhere
^Delete::
Send, ^+{Right}{Del}
Return

#IfWinActive, tex - Neovim
NumpadEnter::
Send, ^oo
Return
#IfWinNotActive

#Include, D:\My Folder\Auto Hotkey Scripts\Macros\functions.ahk
#Include, D:\My Folder\Auto Hotkey Scripts\Macros\premiere.ahk
#Include, D:\My Folder\Auto Hotkey Scripts\Macros\space.ahk
#Include, D:\My Folder\Auto Hotkey Scripts\Macros\notion.ahk
#Include, D:\My Folder\Auto Hotkey Scripts\Macros\hotstrings.ahk

; Reset Application specific macros
#IfWinActive
