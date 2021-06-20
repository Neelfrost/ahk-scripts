; ---------------------------------------------------------------------------- ;
;                                 Notion Macros                                ;
; ---------------------------------------------------------------------------- ;

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
    ; Send, {End}
Return