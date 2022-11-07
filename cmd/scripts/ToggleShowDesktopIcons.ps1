$signatures = @'
[DllImport("user32.dll")]
public static extern IntPtr FindWindow(string lpClassName, string lpWindowName);
[DllImport("user32.dll")]
public static extern IntPtr FindWindowEx(IntPtr hwndParent, IntPtr hwndChildAfter, string lpszClass, string lpszWindow);
[DllImport("user32.dll")]
public static extern IntPtr SendMessage(IntPtr hWnd, uint Msg, IntPtr wParam, IntPtr lParam);
'@
$API = Add-Type -MemberDefinition $signatures -Name 'Win32' -Namespace 'Win32Functions' -PassThru
 
$progman_handle = $API::FindWindow('Progman', 'Program Manager')
$shellviewwin_handle = $API::FindWindowEx($progman_handle, 0, 'SHELLDLL_DefView', '')
[void]$API::SendMessage($shellviewwin_handle, 0x0111, 0x7402, 0)