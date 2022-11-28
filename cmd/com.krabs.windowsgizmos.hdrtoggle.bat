@echo off
REM echo setTitle This is\nthe title
PowerShell.exe -ExecutionPolicy Bypass -Command "./cmd/scripts/HDRToggle.ps1"
dxdiag /x %TEMP%\dxdiag.xml
setlocal EnableDelayedExpansion
set RESULT="
set ISEMPTY="
for /f %%i in ('findstr /c:"<AdvancedColorEnabled>1</AdvancedColorEnabled>" %TEMP%\dxdiag.xml') do set RESULT=%%i
if "!RESULT!" == "!ISEMPTY!" ( 
echo setState 0
) else (
echo setState 1
)