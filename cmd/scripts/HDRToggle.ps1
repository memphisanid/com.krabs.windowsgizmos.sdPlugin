$source = @"
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace KeyboardSend
{
    public class KeyboardSend
    {
        [DllImport("user32.dll")]
        public static extern void keybd_event(byte bVk, byte bScan, int dwFlags, int dwExtraInfo);
        private const int KEYEVENTF_EXTENDEDKEY = 1;
        private const int KEYEVENTF_KEYUP = 2;
        public static void KeyDown(Keys vKey)
        {
            keybd_event((byte)vKey, 0, KEYEVENTF_EXTENDEDKEY, 0);
        }
        public static void KeyUp(Keys vKey)
        {
            keybd_event((byte)vKey, 0, KEYEVENTF_EXTENDEDKEY | KEYEVENTF_KEYUP, 0);
        }
    }
}

"@

Add-Type -TypeDefinition $source -ReferencedAssemblies "System.Windows.Forms"

Function Win ($Key)
{
    [KeyboardSend.KeyboardSend]::KeyDown("LWin")
    [System.Windows.Forms.SendKeys]::SendWait("$Key")
    [KeyboardSend.KeyboardSend]::KeyUp("LWin")
}
#win -key N

Add-Type -AssemblyName System.Windows.Forms

#Start-Sleep -MilliSeconds 1000
win -key %b