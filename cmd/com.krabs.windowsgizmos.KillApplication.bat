@echo off
REM echo setTitle This is\nthe title
IF "%BPS_vKrabs_ApplicationExe%"=="" ( vTestFailed=True ) ELSE (taskkill /im %BPS_vKrabs_ApplicationExe% /t %BPS_vKrabs_Force%)
