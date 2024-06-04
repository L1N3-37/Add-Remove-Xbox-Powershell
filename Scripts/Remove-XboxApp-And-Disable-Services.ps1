# Clear the terminal before execution
Clear-Host

# Tag
Write-Host " _______________________________________ 
|					|
|    _    _  _ _  ____      ____ ___ 	|
|   | |  / || \ |<__ / ___ <__ /|_  |   |
|   | |_ | ||   | <_ \|___| <_ \ / / 	|
|   |___||_||_\_|<___/     <___//_/   	|
| 					|
|_______________________________________|
| 					|
|     https://github.com/L1N3-37        |
|_______________________________________|"

# Instruction
Write-Host "`n| --> Removing Xbox App..."

# Remove Xbox App
Get-AppxPackage Microsoft.GamingApp | Remove-AppxPackage

# Instruction
Write-Host "`n| --> Removing Xbox Identity Provider..."

# Remove Xbox Identity Provider
Get-AppxPackage Microsoft.XboxIdentityProvider | Remove-AppxPackage

# Instruction
Write-Host "`n| --> Removing Xbox Speech to Text Overlay..."

# Remove Xbox Speech to Text Overlay
Get-AppxPackage Microsoft.XboxSpeechToTextOverlay | Remove-AppxPackage

# Instruction
Write-Host "`n| --> Removing Xbox Game Overlay..."

# Remove Xbox Game Overlay
Get-AppxPackage Microsoft.XboxGameOverlay | Remove-AppxPackage

# Instruction
Write-Host "`n| --> Removing Xbox Game Callable UI..."

# Remove Xbox Game Callable UI
Get-AppxPackage Microsoft.Xbox.TCUI | Remove-AppxPackage

# Instruction
Write-Host "`n| --> Removing Xbox Gaming Overlay (another possible package name)..."

# Remove Xbox Gaming Overlay (another possible package name)
Get-AppxPackage Microsoft.XboxGamingOverlay | Remove-AppxPackage

# Instruction
Write-Host "`n| --> Removing Xbox Game Bar Plugin (another possible package name)..."

# Remove Xbox Game Bar Plugin
Get-AppxPackage Microsoft.XboxGameOverlay | Remove-AppxPackage

# Instruction
Write-Host "`n| --> Disabling Xbox Services..."

# Disable Xbox Services
$services = @(
    "XboxGipSvc",          # Xbox Accessory Management Service
    "XboxNetApiSvc",       # Xbox Live Networking Service
    "GamingServices",      # Gaming Services
    "GamingServicesNet"    # Gaming Services Network
)

foreach ($service in $services) {
    Get-Service -Name $service -ErrorAction SilentlyContinue | ForEach-Object {
        Stop-Service -Name $_.Name -Force -ErrorAction SilentlyContinue
        Set-Service -Name $_.Name -StartupType Disabled -ErrorAction SilentlyContinue
    }
}

# Separation line
Write-Host "`n----------------------------------------"

# Instruction
Read-Host "`nCompleted! Press any key to close the Terminal"
