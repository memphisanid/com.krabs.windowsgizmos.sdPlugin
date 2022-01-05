function Show-Notification {
    [cmdletbinding()]
    Param (
        [int]
        $ToastTime,
        [string]
        $ToastTag,
        [string]
        $ToastTitle,
        [string]
        [parameter(ValueFromPipeline)]
        $ToastText
    )

    [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null
    $Template = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastText02)

    $RawXml = [xml] $Template.GetXml()
    ($RawXml.toast.visual.binding.text|where {$_.id -eq "1"}).AppendChild($RawXml.CreateTextNode($ToastTitle)) > $null
    ($RawXml.toast.visual.binding.text|where {$_.id -eq "2"}).AppendChild($RawXml.CreateTextNode($ToastText)) > $null

    $SerializedXml = New-Object Windows.Data.Xml.Dom.XmlDocument
    $SerializedXml.LoadXml($RawXml.OuterXml)

    $Toast = [Windows.UI.Notifications.ToastNotification]::new($SerializedXml)
    $Toast.Tag = "PowerShell"
    $Toast.Group = "PowerShell"
    if($ToastTime -as [int] -is [int] -And $ToastTime -ge 0){
      $Toast.ExpirationTime = [DateTimeOffset]::Now.AddMinutes($ToastTime)
    }else {
      $Toast.ExpirationTime = ''
    }



    $Notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("$ToastTag")
    $Notifier.Show($Toast);
}
Show-Notification $args[0] $args[1] $args[2] $args[3]
