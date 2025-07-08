' Set WshShell = WScript.CreateObject("WScript.Shell")

' WshShell.SendKeys "^({ESC})"

Set objShell = CreateObject("WScript.Shell")
objShell.Run "powershell -ExecutionPolicy Bypass -File %userprofile%/.glzr/zebar/starter/scripts/OpenNetworkSettings.ps1", 0, True

