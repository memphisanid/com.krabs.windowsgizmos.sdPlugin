@echo off
REM echo setTitle This is\nthe title
setlocal enableDelayedExpansion
set /A vRandom=%RANDOM%

if "%BPS_vKrabs_Type%" == "PID" (
powershell -ExecutionPolicy Bypass -Command "./cmd/scripts/GetIDbyProcessName.ps1 %BPS_vKrabs_WindowTitle%" > %vRandom%.txt
set /P vKRABSPID=<%vRandom%.txt
%CD%/cmd/scripts/windowMode.exe -pid !vKRABSPID! -mode %BPS_vKrabs_WindowMode% > %vRandom%.txt 2>&1
set /P vError=<%vRandom%.txt
)

if "%BPS_vKrabs_Type%" == "TITLE" (
%CD%/cmd/scripts/windowMode.exe -title "%BPS_vKrabs_WindowTitle%" -mode %BPS_vKrabs_WindowMode% > %vRandom%.txt 2>&1
set /P vError=<%vRandom%.txt
)

for /f %%i in ("%vRandom%.txt") do set size=%%~zi
if %size% gtr 0 if %BPS_vKrabs_ShowErrors%==true (
powershell -ExecutionPolicy Bypass -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('%vError%', 'Change Window Display Mode: Error', 'OK', [System.Windows.Forms.MessageBoxIcon]::ERROR);}"
)

if EXIST *.txt DEL /F *.txt
EXIT