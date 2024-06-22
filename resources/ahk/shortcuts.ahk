;; Virtual Desktops
switchToVirtualDesktop(pos) {
    global VirtualDesktopAlreadyCreated
    if (!VirtualDesktopAlreadyCreated) {
        Send, #^d ;; win-control-d = creates Virtual Desktop 
        VirtualDesktopAlreadyCreated = 1 ;; set as already created D
    }

    if (pos=1) {
        Send ^#{Left} ;; win-control-left = Go to previous Virtual Desktop 
    }
    if (pos=2) {
        Send ^#{Right} ;; win-control-left = Go to next Virtual Desktop 
    }
}

#1::switchToVirtualDesktop(1)
#2::switchToVirtualDesktop(2)
#3::switchToVirtualDesktop(3)
#4::return

#Enter::Run "%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe"

;; Close the window
LWin & q::PostMessage, 0x0112, 0xF060,,, A

;; Toggle fullscreen
LWin & f::
   WinGet MX, MinMax, A    
   If MX
        WinRestore A
   Else WinMaximize A