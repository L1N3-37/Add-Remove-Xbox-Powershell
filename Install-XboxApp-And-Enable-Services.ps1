# Clear the terminal before execution
Clear-Host

# Instruction
Write-Host "Enabling Xbox Services..."
Start-Sleep -Seconds 1

# Enable Xbox Services
$services = @(
"XboxGipSvc",				# Xbox Accessory Management Service
"XboxNetApiSvc",			# Xbox Live Networking Service
"GamingServices",			# Gaming Services
"GamingServicesNet"			# Gaming Services Network
)

foreach ($service in $services) {
    Get-Service -Name $service -ErrorAction SilentlyContinue | ForEach-Object {
        Start-Service -Name $_.Name -ErrorAction SilentlyContinue
        Set-Service -Name $_.Name -StartupType Automatic -ErrorAction SilentlyContinue
    }
}
# Instruction
Write-Host "Opening the Xbox App page in Microsoft Store..."
Start-Sleep -Seconds 1

# Instruction
Write-Host "Click the Install button"
Start-Sleep -Seconds 1

# Open Microsoft Store
$storeApp = "ms-windows-store://pdp/?productid=9MV0B5HZVK9Z"
Start $storeApp

# Instruction
Write-Host "Completed! You may close your Terminal."
