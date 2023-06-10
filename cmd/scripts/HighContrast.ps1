#start-process -filepath "C:\Windows\Resources\Ease of Access Themes\hc1.theme"; timeout /t 3; taskkill /im "systemsettings.exe" /f>NUL

# Check the current High Contrast mode state
#$currentMode = Get-ItemProperty -Path "HKCU:\Control Panel\Accessibility\HighContrast" | select-object HighContrastOn


#---------------------------------------------------------------------
$vKrabsCurrentTheme = "$(Get-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes | Select-Object CurrentTheme | ForEach-Object{($_ -split "=")[1]} | ForEach-Object{($_ -split "}")[0]})"
write-host "$vKrabsCurrentTheme"
if (Test-Path -Path "theme.tmp") {
	$vKrabs_Theme = "$(Get-Content -Path 'theme.tmp')"
} else {
    Set-Content -Path 'theme.tmp' -Value "$vKrabsCurrentTheme"
}
Write-Host "$vKrabs_Theme"
# Check if high contrast mode is currently enabled
#$highContrastEnabled = "$(Get-ItemProperty -Path "HKCU:\Control Panel\Accessibility\HighContrast" | Select-Object HighContrastOn)"
#Write-Host $highContrastEnabled
# Toggle the high contrast mode
if ("$vKrabsCurrentTheme" -eq "C:\Windows\Resources\Ease of Access Themes\hc1.theme") {
    # High contrast is enabled, so disable it
    start-process -filepath "$vKrabs_Theme"
    timeout /t 3
    taskkill /im "systemsettings.exe" /f 
} elseif ("$vKrabsCurrentTheme" -ne "C:\Windows\Resources\Ease of Access Themes\hc1.theme") {
    # High contrast is disabled, so enable it
    start-process -filepath "C:\Windows\Resources\Ease of Access Themes\hc1.theme"
    timeout /t 3
    taskkill /im "systemsettings.exe" /f
}