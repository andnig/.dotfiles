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

# Installing Alacritty
choco install alacritty -y

# Installing Cascadia Code Nerd Font
choco install nerdfont-hack -y

# Copying alacritty.yml to the user's AppData\Roaming\alacritty folder
$alacrittyConfigSource = "\\wsl.localhost\Ubuntu-20.04\home\andreas\.dotfiles\configs\alacritty_windows\alacritty.yml"
$wslSource = ".\configs\wsl\.wslconfig"
$userProfile = [Environment]::GetFolderPath('UserProfile')
$alacrittyConfigTarget = Join-Path $userProfile "AppData\Roaming\alacritty"

# Create the target directory if it doesn't exist
if (-not (Test-Path $alacrittyConfigTarget)) {
    New-Item -ItemType Directory -Force -Path $alacrittyConfigTarget
}

# Copy the config files
#Copy-Item $alacrittyConfigSource $alacrittyConfigTarget -Force
New-Item -ItemType SymbolicLink -Path $alacrittyConfigTarget -Name "alacritty.yml" -Value $alacrittyConfigSource -Force
Copy-Item $wslSource $userProfile -Force

choco install sparkmail -y
winget install -e --id SamHocevar.WinCompose --accept-package-agreements --accept-source-agreements
# Optional: Refresh environment variables again
refreshenv

