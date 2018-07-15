for /f "skip=1 tokens=3" %%s in ('query user 5') do (
    C:\Shared\CML\utilities\remote_hosting_tools\RunInSession.exe %%s "runas /user:5 /savecred C:\Shared\CML\utilities\restart_mc\restart_mc.bat"
)