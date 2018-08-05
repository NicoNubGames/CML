for /f "skip=1 tokens=3" %%s in ('query user 3') do (
    C:\Shared\CML\utilities\remote_hosting_tools\RunInSession.exe %%s "runas /user:3 /savecred C:\Shared\CML\utilities\restart_mc\kill_mc.bat"
)