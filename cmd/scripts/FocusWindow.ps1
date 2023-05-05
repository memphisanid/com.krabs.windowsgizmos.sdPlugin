#Get-Process | Select MainWindowTitle,ProcessName | where{$_.MainWindowTitle -ne ""}
$vProcessName=$args[0]
$wshell = New-Object -ComObject wscript.shell
$wshell.AppActivate($vProcessName)