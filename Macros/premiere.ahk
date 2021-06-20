; ---------------------------------------------------------------------------- ;
;                              Premiere Pro Macros                             ;
; ---------------------------------------------------------------------------- ;

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