# Clear the terminal before execution
Clear-Host

# Instruction
Write-Host "`n--> Enabling Xbox Services..."
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
Write-Host "`n--> Opening the Xbox App page in Microsoft Store..."
Start-Sleep -Seconds 1

# Instruction
Write-Host "`n--> Click the -[ Install ]- button when prompted"
Start-Sleep -Seconds 2

# Open Microsoft Store
$storeApp = "ms-windows-store://pdp/?productid=9MV0B5HZVK9Z"
Start $storeApp

# Separation line
Write-Host "`n---------------------------------------------------"

# Instruction
Read-Host "`n Completed! Press any key to close the Terminal"
