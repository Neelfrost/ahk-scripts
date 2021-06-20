; ---------------------------------------------------------------------------- ;
;                           Functions used in Macros                           ;
; ---------------------------------------------------------------------------- ;
; Add torrent to qbittorrent client using qbt-cli
Torrent()
{
    if (InStr(Clipboard, "magnet:?xt") || InStr(Clipboard, ".torrent"))
    {
        Run %ComSpec% /c "qbt torrent add url -s "%Clipboard%"",, Hide
        MsgBox, , Torrent Manager, Torrent added sucessfully, 1
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

        ; Get active window's width and height
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

        if (tempX != winX && tempY != winY)
            WinMove, A,, winX, winY, winW, winH
        else
            Return
    }
    else
        Return
}

SetSize()
{
    WinRestore, A
    WinGetPos, tempX, tempY, tempW, tempH, A
    WinMove, A,, tempX, tempY, 1280, 720
    CenterActiveWindow()
}