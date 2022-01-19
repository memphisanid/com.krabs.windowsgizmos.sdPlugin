@echo off
REM echo setTitle This is\nthe title
IF "%BPS_vKrabs_Force%"=="true" vForce="/f"
IF "%BPS_vKrabs_ApplicationName%"=="" ( vTestFailed=True ) ELSE (taskkill /im %BPS_vKrabs_ApplicationName% /t %vForce%)
