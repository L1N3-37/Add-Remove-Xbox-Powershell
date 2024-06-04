Clear-Host                                                                                    # Clear the terminal before execution

Write-Host "`n--> Enabling Xbox Services..."                                                  # Instruction

# Enable Xbox Services
$services = @(
"XboxGipSvc",				                                                                  # Xbox Accessory Management Service
"XboxNetApiSvc",			                                                                  # Xbox Live Networking Service
"GamingServices",			                                                                  # Gaming Services
"GamingServicesNet"			                                                                  # Gaming Services Network
)

foreach ($service in $services) {
    Get-Service -Name $service -ErrorAction SilentlyContinue | ForEach-Object {
        Start-Service -Name $_.Name -ErrorAction SilentlyContinue
        Set-Service -Name $_.Name -StartupType Automatic -ErrorAction SilentlyContinue
    }
}

Write-Host "`n--> Opening the Xbox App page in Microsoft Store..."                            # Instruction
Start-Sleep -Seconds 1

$storeApp = "ms-windows-store://pdp/?productid=9MV0B5HZVK9Z"                                  # Open Microsoft Store   
Start $storeApp

Write-Host "`n--> Click the -[ Install ]- button when prompted"                               # Instruction
Start-Sleep -Seconds 2

Write-Host "`n---------------------------------------------------"                            # Separation line

Read-Host "`n Completed! Press any key to close the Terminal"                                 # Instruction
