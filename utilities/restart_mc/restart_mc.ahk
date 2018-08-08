CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

Process, Close, javaw.exe

If WinExist("ahk_class LWJGL")
{
	WinClose

	;; Sleep for 5 seconds to give everything time to deallocate
	Sleep, 5000
}

If !WinExist("ahk_class LWJGL")
{
	Run, "C:\Program Files (x86)\Minecraft\MinecraftLauncher.exe"
	
	;; Loop until we find a play button, checking ten times a second
	X := ""
	While (X == "")
	{
		ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, ./img/playbutton.png
		If (X == "")
		{
			ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, ./img/playbutton2.png
		}
		If (X == "")
		{
			ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, ./img/playbutton3.png
		}
		Sleep, 100
	}
	
	;; Press "Play"
	Click, %X%, %Y%
	
	;; Loop until we see a multiplayer button, checking ten times a second
	;; Or perhaps we need the "start anyway" button, if the client is complaining
	X := ""
	S := 0
	While (X == "")
	{
		ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, ./img/multiplayer.png
		If (X == "")
		{
			ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, ./img/multiplayer2.png
		}
		If (X == "")
		{
			ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, ./img/startanyway.png
			If (X != "")
			{
				S := 1
			}
		}
		Sleep, 100
	}
	
	;; Press "Multiplayer" or "Start Anyway"
	Click, %X%, %Y%

	If (S == 1)
	{
		Sleep, 100
		X := ""
		While (X == "")
		{
			ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, ./img/multiplayer.png
			If (X == "")
			{
				ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, ./img/multiplayer2.png
			}
			Sleep, 100
		}
		
		;; Press "Multiplayer"
		Click, %X%, %Y%
	}
	
	;; Loop until we see a server named "Autojoin", checking ten times a second
	X := ""
	While (X == "")
	{
		ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, ./img/autojoin.png
		Sleep, 100
	}
	
	;; Press "Autojoin" server
	x := X + 5
	Y := Y + 5
	Click, %X%, %Y%
	Sleep, 500
	Send, {Enter}
}

;; Make the window transparent and move it to the corner.  Used for convenient viewing
;; of the RDP session
If WinExist("ahk_class LWJGL")
{
    WinActivate
    Sleep, 100
    WinSet, Style, -0xC00000
    WinSet, Transparent, 200
    WinMove, , , 0, 0, 640, 500
}

#SingleInstance force