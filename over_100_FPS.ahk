;  ###################################################
;  #   Macro for GTA V Online created by 0xLuxxz     #
;  #                                                 #
;  #              Last UPD: 07/03/23                 #
;  ###################################################

#InstallKeybdHook
#SingleInstance Force
if not A_IsAdmin {
    Run *RunAs "%A_ScriptFullPath%"
}

Hotkeys:
    $q::DropBST()
    $+f6::CreatePrivateSession()
    $+f7::GhostCEO()
    $+f8::ActivateThermalVision()
    $lcontrol::EWO()
    $rcontrol::KillProcess()
    $\::NoobMode()
    $xbutton2::RapidRPG()
    $xbutton1::RapidSniper()
    NumpadSub::BecomeCEO()
    +NumpadSub::BecomeMC()
    NumpadAdd::BuyRPGammo()
    NumpadDiv::Teleports()
return

DropBST() {
    Send, {m}{Enter}{Up 3}{Enter}{Down}{Enter}
}

CreatePrivateSession() {
    Process, Exist, GTA5.exe
    if (ErrorLevel) {
        h := DllCall("OpenProcess", "UInt", 0x1F0FFF, "Int", 0, "UInt", ErrorLevel)
        if (h) {
            DllCall("ntdll.dll\NtSuspendProcess", "UInt", h)
            Sleep, 10000
            DllCall("ntdll.dll\NtResumeProcess", "UInt", h)
            DllCall("CloseHandle", "UInt", h)
        }
    }
}

GhostCEO() {
    Send, {m}{Enter}{Up 3}{Enter}{Up 3}{Enter}
}

ActivateThermalVision() {
	Send, {m}
    Send, {Down 4}{Enter}{Down}{Enter}
    Send, {Down 4}{Space}{m}
}

EWO() {
	Send, {CapsLock}{m}{c down}{up 2}{Enter}{c up}
    SetCapsLockState, Off
}

KillProcess(){
	IfWinActive, ahk_class grcWindow
	{
        Run, taskkill /f /im GTA5.exe
        ExitApp
    }
}

NoobMode(){
	Send, {m}{Up}{Enter}{m}
}

RapidRPG(){
	Send, {4}{LAlt}
}

RapidSniper(){
	Send, {4}{x}
}

BecomeCEO(){

}

BecomeMC(){

}

BuyRPGammo(){

}

Teleports(){
	Send, {m}
	Send, {Down 7}{Enter}{Down 2}{Enter}
	Sleep, 20
	Send, {Left}{m}
}