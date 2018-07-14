for /f "skip=1 tokens=3" %%s in ('query user 3') do (
	C:\Shared\CML\utilities\remote_hosting_tools\RunInSession %%s C:\Shared\CML\utilities\restart_mc\restart_mc.ahk
)
pause