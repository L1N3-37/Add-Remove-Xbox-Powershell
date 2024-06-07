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
Write-Host "`n| --> Removing Xbox App..." -ForegroundColor Green

# Remove Xbox App
Get-AppxPackage Microsoft.GamingApp | Remove-AppxPackage

# Instruction
Write-Host "`n| --> Removing Xbox Identity Provider..." -ForegroundColor Green

# Remove Xbox Identity Provider
Get-AppxPackage Microsoft.XboxIdentityProvider | Remove-AppxPackage

# Instruction
Write-Host "`n| --> Removing Xbox Speech to Text Overlay..." -ForegroundColor Green

# Remove Xbox Speech to Text Overlay
Get-AppxPackage Microsoft.XboxSpeechToTextOverlay | Remove-AppxPackage

# Instruction
Write-Host "`n| --> Removing Xbox Game Overlay..." -ForegroundColor Green

# Remove Xbox Game Overlay
Get-AppxPackage Microsoft.XboxGameOverlay | Remove-AppxPackage

# Instruction
Write-Host "`n| --> Removing Xbox Game Callable UI..." -ForegroundColor Green

# Remove Xbox Game Callable UI
Get-AppxPackage Microsoft.Xbox.TCUI | Remove-AppxPackage

# Instruction
Write-Host "`n| --> Removing Xbox Gaming Overlay (another possible package name)..." -ForegroundColor Green

# Remove Xbox Gaming Overlay (another possible package name)
Get-AppxPackage Microsoft.XboxGamingOverlay | Remove-AppxPackage

# Instruction
Write-Host "`n| --> Removing Xbox Game Bar Plugin (another possible package name)..." -ForegroundColor Green

# Remove Xbox Game Bar Plugin
Get-AppxPackage Microsoft.XboxGameOverlay | Remove-AppxPackage

# Instruction
Write-Host "`n| --> Disabling Xbox Services..." -ForegroundColor Green

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
            Set-Service -Name $svc.Name -StartupType Disabled -ErrorAction SilentlyContinue
            Stop-Service -Name $svc.Name -Force -ErrorAction SilentlyContinue
            Write-Host "`n| --> Service $($svc.Name) is now disabled." -ForegroundColor Green
        } catch {
            Write-Host "`n| --> $($svc.Name). `n`n     [$_]" -ForegroundColor Red
        }
    } else {
        Write-Host "`n| --> Service $service not found." -ForegroundColor Yellow
    }
}

# Separation line
Write-Host "`n----------------------------------------"

# Instruction
Read-Host "`nCompleted! Press any key to close the Terminal"