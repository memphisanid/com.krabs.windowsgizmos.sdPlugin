@echo off
REM echo setTitle This is\nthe title
set vMessage='%BPS_vKrabs_ToastTime%' '%BPS_vKrabs_ToastTitle%' '%BPS_vKrabs_ToastTextTitle%' '%BPS_vKrabs_ToastText%'
PowerShell.exe -ExecutionPolicy Bypass -Command "./cmd/scripts/ToastNotification.ps1 %vMessage%"
