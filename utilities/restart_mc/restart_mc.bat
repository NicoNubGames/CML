taskkill /F /IM javaw.exe /T
timeout /t 1
taskkill /F /IM MinecraftLauncher.exe /T
cd "%~dp0"
AutoHotkey restart_mc.ahk