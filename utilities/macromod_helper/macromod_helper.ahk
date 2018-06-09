;; Author: QJI
;; MIT License

;; This is the macromod "helper" script in AHK, that performs a few activities to support macromod
;; scripting:
;;
;; - Monitors LOG files to control whether to hold ATTACK or not (externally)
;;     (Macromod currently cannot HOLD attack, leading to inefficiencies in some cases)
;;
;; - Will kill and restart Minecraft at 10:45 AM and 11:15 AM respectively (rejoining server)
;;
;; - Ensures Minecraft has focus (to prevent bot glitches)
;;
;; This script (as well as any bots) are intended to be run on a dedicated Windows user account.  This way
;; the computer may still be used, but Minecraft will always have focus.
;;
;; To download the extra required files, visit https://github.com/poteat/CML/tree/master/utilities/macromod_helper


SendMode, Input
CoordMode, Screen

file1=C:\Users\-\AppData\Roaming\.minecraft\liteconfig\common\macros\logs\_enableAttack.txt
file2=C:\Users\-\AppData\Roaming\.minecraft\liteconfig\common\macros\logs\_disableAttack.txt

FileGetTime, prevtime1, %file1%
FileGetTime, prevtime2, %file2%

SetTimer, ensure_focus, 500   ;; Ensure focus twice per second
SetTimer, hold_attack, 50     ;; Check for holding 20 times per second
SetTimer, daily_restart, 1000 ;; Check for restart/kill every second

;; Display status in corner
Gui +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui, Color, 000000
Gui, Font, s16
Gui, Add, Text, vMyText cLime, XXXXX YYYYY
GuiControl,, MyText, Helper On
X := A_ScreenWidth - 150
Y := A_ScreenHeight - 100
Gui, Show, x%X% y%Y% NoActivate

;; If Minecraft is not currently open, run it.

If (!WinExist("Minecraft"))
{
	Run %A_AHKPath% "mc_start.ahk"
}

ensure_focus:
	If (WinExist("Minecraft"))
	{
		WinActivate, Minecraft
	}
return

hold_attack:
	FileGetTime, time, %file1% 
	If (time != prevtime1) 
	{
		If (WinActive("Minecraft"))
		{
			Send {LButton Down}
		}

		prevtime1 := time
	}

	FileGetTime, time, %file2% 
	If (time != prevtime2) 
	{
		If WinActive("Minecraft")
		{
			Send {LButton Up}
		}

		prevtime2 := time
	}
return

starting_mc := false

daily_restart:
	;; Quit Minecraft at 10:45 AM
	If (A_Hour = 10 && A_Minute = 45)
	{
		If WinExist("Minecraft")
		{
			WinClose, Minecraft
		}
	}
	
	;; Start Minecraft and join Civcraft at 11:15 AM
	If (A_Hour == 19 && A_Min == 10)
	{
		If (!starting_mc)
		{
			starting_mc := true ;; Only run once during this minute
			Run %A_AHKPath% "mc_start.ahk"
		}
	}
	Else
	{
		starting_mc := false
	}
return

#Persistent
#singleinstance force