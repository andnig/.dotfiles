# SendWinA.ps1
Add-Type @"
    using System;
    using System.Runtime.InteropServices;

    public class Keyboard
    {
        [DllImport("user32.dll", SetLastError = true)]
        public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, IntPtr dwExtraInfo);

        public const int KEYEVENTF_KEYDOWN = 0x0000; // Key down flag
        public const int KEYEVENTF_KEYUP = 0x0002;   // Key up flag
        public const byte VK_LWIN = 0x5B;            // Left Windows key
        public const byte VK_A = 0x41;               // 'A' key

        public static void PressKey(byte keyCode)
        {
            keybd_event(keyCode, 0, KEYEVENTF_KEYDOWN, IntPtr.Zero);
        }

        public static void ReleaseKey(byte keyCode)
        {
            keybd_event(keyCode, 0, KEYEVENTF_KEYUP, IntPtr.Zero);
        }
    }
"@

# Simulate pressing and holding Windows key, then 'a', and releasing both
[Keyboard]::PressKey([Keyboard]::VK_LWIN)  # Hold Windows key
[Keyboard]::PressKey([Keyboard]::VK_A)     # Press 'A' key
[Keyboard]::ReleaseKey([Keyboard]::VK_A)   # Release 'A' key
[Keyboard]::ReleaseKey([Keyboard]::VK_LWIN) # Release Windows key
