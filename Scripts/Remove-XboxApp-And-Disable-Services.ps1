# Instruction
Write-Host "Removing Xbox App..."
Start-Sleep -Seconds 1

# Remove Xbox App
Get-AppxPackage Microsoft.GamingApp | Remove-AppxPackage

# Instruction
Write-Host "Removing Xbox Identity Provider..."
Start-Sleep -Seconds 1

# Remove Xbox Identity Provider
Get-AppxPackage Microsoft.XboxIdentityProvider | Remove-AppxPackage

# Instruction
Write-Host "Removing Xbox Speech to Text Overlay..."
Start-Sleep -Seconds 1

# Remove Xbox Speech to Text Overlay
Get-AppxPackage Microsoft.XboxSpeechToTextOverlay | Remove-AppxPackage

# Instruction
Write-Host "Removing Xbox Game Overlay..."
Start-Sleep -Seconds 1

# Remove Xbox Game Overlay
Get-AppxPackage Microsoft.XboxGameOverlay | Remove-AppxPackage

# Instruction
Write-Host "Removing Xbox Game Callable UI..."
Start-Sleep -Seconds 1

# Remove Xbox Game Callable UI
Get-AppxPackage Microsoft.Xbox.TCUI | Remove-AppxPackage

# Instruction
Write-Host "Removing Xbox Gaming Overlay (another possible package name)..."
Start-Sleep -Seconds 1

# Remove Xbox Gaming Overlay (another possible package name)
Get-AppxPackage Microsoft.XboxGamingOverlay | Remove-AppxPackage

# Instruction
Write-Host "Removing Xbox Game Bar Plugin (another possible package name)..."
Start-Sleep -Seconds 1

# Remove Xbox Game Bar Plugin
Get-AppxPackage Microsoft.XboxGameOverlay | Remove-AppxPackage

# Instruction
Write-Host "Disabling Xbox Services..."
Start-Sleep -Seconds 1

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

# Instruction
Write-Host "Completed! You may close your Terminal."
