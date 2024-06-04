Write-Host "`n--> Removing Xbox App..."                                                                  # Instruction

Get-AppxPackage Microsoft.GamingApp | Remove-AppxPackage                                                 # Remove Xbox App

Write-Host "`n--> Removing Xbox Identity Provider..."                                                    # Instruction

Get-AppxPackage Microsoft.XboxIdentityProvider | Remove-AppxPackage                                      # Remove Xbox Identity Provider

Write-Host "`n--> Removing Xbox Speech to Text Overlay..."                                               # Instruction

Get-AppxPackage Microsoft.XboxSpeechToTextOverlay | Remove-AppxPackage                                   # Remove Xbox Speech to Text Overlay

Write-Host "`n--> Removing Xbox Game Overlay..."                                                         # Instruction

Get-AppxPackage Microsoft.XboxGameOverlay | Remove-AppxPackage                                           # Remove Xbox Game Overlay

Write-Host "`n--> Removing Xbox Game Callable UI..."                                                     # Instruction

Get-AppxPackage Microsoft.Xbox.TCUI | Remove-AppxPackage                                                 # Remove Xbox Game Callable UI

Write-Host "`n--> Removing Xbox Gaming Overlay (another possible package name)..."                       # Instruction
    
Get-AppxPackage Microsoft.XboxGamingOverlay | Remove-AppxPackage                                         # Remove Xbox Gaming Overlay (another possible package name)

Write-Host "`n--> Removing Xbox Game Bar Plugin (another possible package name)..."                      # Instruction

Get-AppxPackage Microsoft.XboxGameOverlay | Remove-AppxPackage                                           # Remove Xbox Game Bar Plugin

Write-Host "`n--> Disabling Xbox Services..."                                                            # Instruction

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

Write-Host "`n---------------------------------------------------"                                       # Separation line

Read-Host "`n Completed! Press any key to close the Terminal"                                            # Instruction
