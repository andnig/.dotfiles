# Ensuring the script is run as an Administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "Please run this script as an Administrator!"
    break
}

winget install -e --id LizardByte.Sunshine --accept-package-agreements --accept-source-agreements

# Define Sunshine config source and target
$sunshineConfigSource = ".\configs\sunshine"
$sunshineConfigTarget = "C:\Program Files\Sunshine"

# Create the Sunshine target directory if it doesn't exist (though installation should create it)
if (-not (Test-Path $sunshineConfigTarget)) {
    Write-Host "Creating Sunshine directory at $sunshineConfigTarget"
    New-Item -ItemType Directory -Force -Path $sunshineConfigTarget
}

# Copy the Sunshine configuration files
Write-Host "Copying Sunshine configuration files from $sunshineConfigSource to $sunshineConfigTarget"
Copy-Item -Path $sunshineConfigSource\* -Destination $sunshineConfigTarget -Recurse -Force

# Display success message
Write-Host -ForegroundColor Green "Sunshine has been successfully installed and configured!"
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Download and install the Virtual Display Driver:" -ForegroundColor White
Write-Host "   a. Navigate to: https://github.com/VirtualDrivers/Virtual-Display-Driver/releases/latest"
Write-Host "   b. Download the VDD installer (Virtual.Display.Driver-vxx.xx.xx-setup-x64.exe)"
Write-Host "   c. Run the installer and follow the prompts"
Write-Host ""
Write-Host "2. Copy the VDD configuration files:" -ForegroundColor White
Write-Host "   Copy-Item -Path '.\VirtualDisplayDriver\*' -Destination 'C:\VirtualDisplayDriver' -Recurse -Force"
Write-Host ""
Write-Host "3. Configure Sunshine with the VDD:" -ForegroundColor White
Write-Host "   a. Navigate to https://localhost:47990/troubleshooting"
Write-Host "   b. Scroll down to the Logs section and find the 'VDD by MTT' display adapter"
Write-Host "   c. Note down the ID (including the curly braces {})"
Write-Host ""
Write-Host "4. Set the Display Device ID in Sunshine:" -ForegroundColor White
Write-Host "   a. Navigate to https://localhost:47990/config"
Write-Host "   b. In the Audio/Video tab, set the noted ID as the 'Display Device Id'"
Write-Host "   c. Save the configuration"
Write-Host ""


