; ---------------------------------------------------------------------------- ;
;                                  Hotstrings                                  ;
; ---------------------------------------------------------------------------- ;

#IfWinNotActive ahk_exe Launchy.exe
;#Hotstring SE K2

; ------------------ AUto-COrrect TWo COnsecutive CApitals. ------------------ ;
; https://www.autohotkey.com/download/AutoCorrect.ahk
; The first line of code below is the set of letters, digits, and/or symbols
; that are eligible for this type of correction.  Customize if you wish:
keys = abcdefghijklmnopqrstuvwxyz
Loop Parse, keys
    HotKey ~+%A_LoopField%, Hoty
Hoty:
    CapCount := SubStr(A_PriorHotKey,2,1)="+" && A_TimeSincePriorHotkey<999 ? CapCount+1 : 1
    if CapCount = 2
        SendInput % "{BS}" . SubStr(A_ThisHotKey,3,1)
    else if CapCount = 3
        SendInput % "{Left}{BS}+" . SubStr(A_PriorHotKey,3,1) . "{Right}"
Return

; -------------------------------- Hotstrings -------------------------------- ;
; General
::temp::temperature
::temps::temperatures
::char::characteristics

; Windows
:OC*:%local::%localappdata%
:OC*:%app::%appdata%

; Emails
:OC*:neel@g::neelfrost@gmail.com
:OC*:neel@l::neelfrost@live.in

; Discord
:OC*::jo:::joy:
:OC*::hug:::hugging:
:OC*::tri:::triumph: