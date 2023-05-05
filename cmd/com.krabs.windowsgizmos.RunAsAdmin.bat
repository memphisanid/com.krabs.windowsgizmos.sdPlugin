@echo off
REM echo setTitle This is\nthe title
set vCOMMAND="%BPS_vKrabs_Command%"
set vARGUMENTS="%BPS_vKrabs_Arguments%"
if %vARGUMENTS%=="" (
PowerShell.exe -ExecutionPolicy Bypass -Command "./cmd/scripts/RunAsAdmin.ps1 '%vCOMMAND%'"
) else (
PowerShell.exe -ExecutionPolicy Bypass -Command "./cmd/scripts/RunAsAdmin.ps1 '%vCOMMAND%' '%vARGUMENTS%'"    
)