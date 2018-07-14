CoordMode, Screen

If WinExist("Minecraft")
{
	WinClose, Minecraft

	;; Sleep for 5 seconds.  I don't know how to wait until it closes.
	Sleep, 5000
}

If !WinExist("Minecraft")
{
	Run, "C:\Program Files (x86)\Minecraft\MinecraftLauncher.exe"
	
	;; Loop until we find a play button, checking ten times a second
	X := ""
	While (X == "")
	{
		ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:/Shared/CML/utilities/restart_mc/img/playbutton.png
		If (X == "")
		{
			ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:/Shared/CML/utilities/restart_mc/img/playbutton2.png
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
		ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:/Shared/CML/utilities/restart_mc/img/multiplayer.png
		If (X == "")
		{
			ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:/Shared/CML/utilities/restart_mc/img/multiplayer2.png
		}
		If (X == "")
		{
			ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:/Shared/CML/utilities/restart_mc/img/startanyway.png
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
			ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:/Shared/CML/utilities/restart_mc/img/multiplayer.png
			If (X == "")
			{
				ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:/Shared/CML/utilities/restart_mc/img/multiplayer2.png
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
		ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, C:/Shared/CML/utilities/restart_mc/img/autojoin.png
		Sleep, 100
	}
	
	;; Press "Autojoin" server
	x := X + 5
	Y := Y + 5
	Click, %X%, %Y%
	Sleep, 500
	Send, {Enter}
}

#SingleInstance force