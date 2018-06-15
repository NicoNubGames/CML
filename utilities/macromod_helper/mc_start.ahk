CoordMode, Screen

If !WinExist("Minecraft")
{
	Run, "C:\Program Files (x86)\Minecraft\MinecraftLauncher.exe"
	
	;; Loop until we find a play button, checking ten times a second
	X := ""
	While (X == "")
	{
		ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, img/playbutton.png
		If (X == "")
		{
			ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, img/playbutton2.png
		}
		Sleep, 100
	}
	
	;; Press "Play"
	Click, %X%, %Y%
	
	;; Loop until we see a multiplayer button, checking ten times a second
	X := ""
	While (X == "")
	{
		ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, img/multiplayer.png
		If (X == "")
		{
			ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, img/multiplayer2.png
		}
		Sleep, 100
	}
	
	;; Press "Multiplayer"
	Click, %X%, %Y%
	
	;; Loop until we see a server named "Autojoin", checking ten times a second
	X := ""
	While (X == "")
	{
		ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, img/autojoin.png
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