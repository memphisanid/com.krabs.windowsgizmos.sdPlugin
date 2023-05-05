@echo off
REM echo setTitle This is\nthe title
PowerShell.exe -ExecutionPolicy Bypass -Command './cmd/scripts/FocusWindow.ps1 "%BPS_vKrabs_ProcessName%"'
EXIT