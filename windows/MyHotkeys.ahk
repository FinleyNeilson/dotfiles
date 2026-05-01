#u::#1
#i::#2
#o::#3
#p::#4
#n::#5
#m::#6

^#h::Send, ^#{Left}
^#l::Send, ^#{Right}

; Windows + F to toggle fullscreen (by sending F11 keypress)
#f::Send {F11}

; Windows + H to move left (same as Windows + Left)
#h::Send {LWin down}{Left}{LWin up}

; Windows + J to move down (same as Windows + Down)
#j::Send {LWin down}{Down}{LWin up}

; Windows + K to move up (same as Windows + Up)
#k::Send {LWin down}{Up}{LWin up}

; Windows + L to move right (same as Windows + Right)
#l::Send {LWin down}{Right}{LWin up}

; windows x to close instead of alt f4
#x::Send !{F4}

; Maps windows alt jk to up and down and alt h l to left and write because windows l sleeps the computer
	
!k::Send {UP}       ; i UP          (Cursor up line)
!j::Send {DOWN}     ; k DOWN        (Cursor down line)

!h::Send {LEFT}     ; j LEFT        (Cursor left one character)
!l::Send {RIGHT}    ; l RIGHT       (Cursor right one character)

; Map Capslock to Control
; Map press & release of Capslock with no other key to Esc
; Press both shift keys together to toggle Capslock

; When Capslock is pressed down, act like LControl.
*Capslock::
    Send {Blind}{LControl down}
    return

; When Capslock is released, if nothing else was pressed then act like Esc.
*Capslock up::
    Send {Blind}{LControl up}
    ;Popup("CAPS UP AFTER " . A_PRIORKEY)
    if A_PRIORKEY = CapsLock
    {
        Send {Esc}
    }
    return

; Function to trigger the original Capslock behaviour.
; This is needed because by default, AHK turns CapsLock off before doing Send
ToggleCaps(){
    SetStoreCapsLockMode, Off
    Send {CapsLock}
    SetStoreCapsLockMode, On
    return
}

; When both shift keys are pressed, act like Capslock
LShift & RShift::ToggleCaps()
RShift & LShift::ToggleCaps()
