cd "%~dp0"
for /f "skip=1 tokens=3" %%s in ('query user 1') do (
    RunInSession.exe %%s "runas /user:1 /savecred C:/Shared/CML/utilities/restart_mc/kill_mc.bat"
)