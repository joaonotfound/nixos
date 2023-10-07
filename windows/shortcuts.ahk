;; VIRTUAL DESKTOP MANAGEMENT ;; 

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

#1::switchToVirtualDesktop(1) ;; Switch to previous desktop
#2::switchToVirtualDesktop(2) ;; Swich to next desktop
#3::switchToVirtualDesktop(3) ;; Swich to next deskto
#4::return

#Enter::Run "%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe"

;; /VIRTUAL DESKTOP MANAGEMENT ;; 
#q::PostMessage, 0x0112, 0xF060,,, A