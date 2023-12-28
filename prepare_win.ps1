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
wsl --install -d $distro --no-launch

# Optional: Refresh environment variables again
refreshenv

# Preparing symlink dirs for windows programs
$userProfile = [Environment]::GetFolderPath('UserProfile')
$wslConfigSource = "\\wsl.localhost\$distro\home\$wsluser\.dotfiles\configs\wsl\.wslconfig"
$wslConfigTargaet = $userProfile
$windowsTerminalConfigSource = "\\wsl.localhost\$distro\home\$wsluser\.dotfiles\configs\windows_terminal\settings.json"
$windowsTerminalConfigTarget = Join-Path $userProfile "AppData\Local\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState"

# Create the target directory if it doesn't exist
if (-not (Test-Path $windowsTerminalConfigTarget)) {
    New-Item -ItemType Directory -Force -Path $windowsTerminalConfigTarget
}

# Create the symlinks 
New-Item -ItemType SymbolicLink -Path $windowsTerminalConfigTarget -Name "settings.json" -Value $windowsTerminalConfigSource -Force
New-Item -ItemType SymbolicLink -Path $wslConfigTargaet -Name ".wslconfig" -Value $wslConfigSource -Force

