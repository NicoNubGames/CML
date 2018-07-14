for /f "skip=1 tokens=3" %%s in ('query user 1') do (
	echo AutoHotkey.exe C:\Shared\CML\utilities\restart_mc\restart_mc.ahk > C:\Shared\CML\utilities\remote_hosting_tools\_temp.bat
	C:\Shared\CML\utilities\remote_hosting_tools\RunInSession.exe %%s "runas /user:1 /savecred C:\Shared\CML\utilities\remote_hosting_tools\_temp.bat"
	rm "C:\Shared\CML\utilities\remote_hosting_tools\_temp.bat"
)