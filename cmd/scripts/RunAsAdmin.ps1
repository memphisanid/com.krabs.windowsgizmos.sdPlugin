$vCommand = $args[0]
$vArguments = $args[1]
if ($args[1] -eq $null) {
Start-Process -Verb RunAs "$vCommand"
} else {
Start-Process -Verb RunAs "$vCommand" -Args "$vArguments"
}
exit