# Clear the terminal before execution
Clear-Host

# Check if the script is running with administrative privileges
function Test-Admin {
    $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($currentUser)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

if (-not (Test-Admin)) {
    Write-Warning "`n`n| --> You do not have Administrator rights to run this script!`n`n| --> Please re-run this script as an Administrator."
    Start-Sleep -Seconds 3
	Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# Tag
Write-Host " _______________________________________ 
|                                       |
|    _    _  _ _  ____      ____ ___    |
|   | |  / || \ |<__ / ___ <__ /|_  |   |
|   | |_ | ||   | <_ \|___| <_ \ / /    |
|   |___||_||_\_|<___/     <___//_/     |
|                                       |
|_______________________________________|
|                                       |
|     https://github.com/L1N3-37        |
|_______________________________________|"

# Instruction
Write-Host "`n| --> Enabling Xbox Services..."
Start-Sleep -Seconds 1

# List of services to enable and start
$services = @(
    "XboxGipSvc",              # Xbox Accessory Management Service
    "XboxNetApiSvc",           # Xbox Live Networking Service
    "GamingServices",          # Gaming Services
    "GamingServicesNet"        # Gaming Services Network
)

foreach ($service in $services) {
    # Get the service object
    $svc = Get-Service -Name $service -ErrorAction SilentlyContinue
    
    if ($svc) {
        # Enable and start the service
        try {
            Set-Service -Name $svc.Name -StartupType Automatic -ErrorAction Stop
            Start-Service -Name $svc.Name -ErrorAction Stop
            Write-Host "`n| --> Service $($svc.Name) is now enabled and running." -ForegroundColor Green
        } catch {
            Write-Host "`n| --> $($svc.Name). `n`n     [$_]" -ForegroundColor Red
        }
    } else {
        Write-Host "`n| --> Service $service not found." -ForegroundColor Yellow
    }
}

Write-Host "`n`n| --> All specified services have been processed."

# Instruction
Write-Host "`n`n`n| --> Opening the Xbox App page in Microsoft Store..."
Start-Sleep -Seconds 1

# Instruction
Write-Host "`n| --> Click the -[ Install ]- button when prompted"
Start-Sleep -Seconds 2

# Open Microsoft Store
$storeApp = "ms-windows-store://pdp/?productid=9MV0B5HZVK9Z"
Start-Process $storeApp

# Separation line
Write-Host "`n---------------------------------------------------"

# Instruction
Read-Host "`n Completed! Press any key to close the Terminal"