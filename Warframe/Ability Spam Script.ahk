; ---------------------------------------------------------------------------- ;
;                                 Spam ability                                 ;
; ---------------------------------------------------------------------------- ;

#MaxThreadsPerHotkey, 2
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; For toggle tooltip
CoordMode, ToolTip, Client

Toggle := False
AbilityNumber := 1
WinGetPos,,, winWidth, winHeight, Warframe

; Coroutine to kill script if Warframe is closed
SetTimer, Close, 1000
Return

; Gui to change ability number
; Shift ` to open
+`::
    Gui, Add, Text,, Enter Ability Number:
    Gui, Add, Edit, v_AbilityNo Limit1 Number
    Gui, Add, Button, Default w80, OK
    Gui, Show, AutoSize Center, Enter Ability Number
Return

ButtonOK:
    Gui, Submit
    Gui, Destroy
    ; Show tooltip for 1 sec
    ToolTip, Ability: %AbilityNumber%, , , 2
    Sleep, 1000
    ToolTip,,,, 2
    Click
Return

#IfWinActive, ahk_exe Warframe.x64.exe

; Suspend Script
Media_Play_Pause::Suspend

; Spam ability on `
; Default ability 1
`::
    Toggle := !Toggle

    If (Toggle)
        ToolTip, Spamming ability: %AbilityNumber%, %winWidth%, %winHeight%, 1
    Else
        ToolTip,,,, 1

    While(Toggle)
    {
        Send, %AbilityNumber%
        Sleep, 500 ; 500 millisecond delay between each cast
    }
Return

#IfWinActive

Close:
    WinWaitClose, ahk_exe Warframe.x64.exe
ExitApp
