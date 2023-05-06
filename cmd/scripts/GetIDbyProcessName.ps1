$vProcessName=$args[0]
Get-Process | Where-Object {$_.mainWindowTitle} | Select-Object Name,ID | Where-Object{$_.Name -eq "$vProcessName"} | Select-Object Id | ForEach-Object {$_.Id}
