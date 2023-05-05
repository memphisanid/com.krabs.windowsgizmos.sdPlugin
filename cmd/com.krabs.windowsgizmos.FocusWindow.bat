@echo off
REM echo setTitle This is\nthe title
vProcessname="%BPS_vKrabs_ProcessName%"
PowerShell.exe -ExecutionPolicy Bypass -Command "./cmd/scripts/FocusWindow.ps1 %BPS_vKrabs_ProcessName%"
EXIT