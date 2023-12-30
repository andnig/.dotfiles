# Parameters for the script
param(
    [string]$distro,
    [string]$wsluser
)

# Check if both parameters are provided
if (-not $distro -or -not $wsluser) {
    Write-Host "Both 'distro' and 'wsluser' parameters must be provided for this script to run."
    Write-Host "Usage: .\scriptName.ps1 -distro 'DistributionName' -wsluser 'UserName'"
    exit
}

# Ensuring the script is run as an Administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "Please run this script as an Administrator!"
    break
}

# Installing Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Ensuring the environment variables are updated
refreshenv

# Installing nerd fonts
choco install nerdfont-hack -y
choco install nerd-fonts-firacode -y
choco install nerd-fonts-jetbrainsmono -y

choco install sparkmail -y
winget install -e --id SamHocevar.WinCompose --accept-package-agreements --accept-source-agreements
winget install -e --id Microsoft.WindowsTerminal.Preview --accept-package-agreements --accept-source-agreements
winget install -e --id Microsoft.PowerToys --accept-package-agreements --accept-source-agreements
winget install -e --id Microsoft.VisualStudioCode --accept-package-agreements --accept-source-agreements
winget install -e --id Microsoft.PowerShell --accept-package-agreements --accept-source-agreements

# Installing the WSL2 distro
wsl --update
wsl --install -d $distro --no-launch
wsl --manage $distro --set-sparse true

# Optional: Refresh environment variables again
refreshenv

# Preparing symlink dirs for windows programs
$userProfile = [Environment]::GetFolderPath('UserProfile')
$wslConfigSource = ".\configs\wsl\.wslconfig"
$wslConfigTargaet = $userProfile
$windowsTerminalConfigSource = ".\configs\windows_terminal\settings.json"
$windowsTerminalConfigTarget = Join-Path $userProfile "AppData\Local\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState"

# Create the target directory if it doesn't exist
if (-not (Test-Path $windowsTerminalConfigTarget)) {
    New-Item -ItemType Directory -Force -Path $windowsTerminalConfigTarget
}

# Copy the files 
Copy-Item -Path $windowsTerminalConfigSource -Destination (Join-Path $windowsTerminalConfigTarget "settings.json") -Force
Copy-Item -Path $wslConfigSource -Destination (Join-Path $wslConfigTarget ".wslconfig") -Force

# Create Startmenu shortcut for kitty, launched in WSL
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\YourShortcutName.lnk")
$Shortcut.TargetPath = "C:\Program Files\PowerShell\7\pwsh.exe"
$Shortcut.Arguments = '-WorkingDirectory ~ -WindowStyle Hidden -Command "C:\Windows\System32\wsl.exe --cd ~ -e bash -c  ~/.local/kitty.app/bin/kitty"'
$Shortcut.IconLocation = "whiskers-tokyo.ico"
$Shortcut.Save()
