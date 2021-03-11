; ---------------------------------------------------------------------------- ;
;                       Modded Minecraft Teleport Script                       ;
; ---------------------------------------------------------------------------- ;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#IfWinActive, Minecraft 1.12.2
z & Numpad1::
    Send, t
    Sleep, 50
    Send, /home base {Enter}
Return

z & Numpad2::
    Send, t
    Sleep, 50
    Send, /home base2 {Enter}
Return

z & Numpad3::
    Send, t
    Sleep, 50
    Send, /home level2 {Enter}
Return

z & Numpad4::
    Send, t
    Sleep, 50
    Send, /home level3 {Enter}
Return

;Suspend
Media_Play_Pause::Suspend