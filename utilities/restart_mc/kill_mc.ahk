CoordMode, Screen

Process, Close, javaw.exe

If WinExist("ahk_class LWJGL")
{
	WinClose

	;; Sleep for 5 seconds to give everything time to deallocate
	Sleep, 5000
}

#SingleInstance force