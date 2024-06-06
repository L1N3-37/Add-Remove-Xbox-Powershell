 _______________________________________ 
|				        |    PowerShell scripts designed 
|    _    _  _ _  ____      ____ ___ 	|    to help users manage Xbox services along with the
|   | |  / || \ |<__ / ___ <__ /|_  |   |    Xbox app on their Windows machines.
|   | |_ | ||   | <_ \|___| <_ \ / / 	|
|   |___||_||_\_|<___/     <___//_/   	|    
| 					|
|_______________________________________|

![image](https://github.com/L1N3-37/Add-Remove-Xbox-Powershell/assets/44227327/ff06c2eb-9554-4adb-88ba-c71fc4ce2e95)
![image](https://github.com/L1N3-37/Add-Remove-Xbox-Powershell/assets/44227327/7fbc655b-a5ab-4964-8fd4-be8380bfef4e)

-->  Install-XboxApp-And-Enable-Services.ps1
  
This PowerShell script is designed to enable Xbox-related services on a Windows machine and open the Xbox app's Microsoft Store page, allowing users to easily install the app. Key actions performed by this script include:
Clearing the terminal before execution to ensure a clean interface.
Enabling Xbox-related services (Xbox Accessory Management Service, Xbox Live Networking Service, Gaming Services, and Gaming Services Network) by setting their startup type to "Automatic" and starting them if they're not already running.
Informing users about the script's actions through clear and concise instructions.
Opening the Microsoft Store page for the Xbox app, allowing users to quickly access and install the app.
This script simplifies the process of preparing a Windows machine for the installation of the Xbox app by managing the necessary services and guiding users through the installation process.

-->  Remove-XboxApp-And-Disable-Services.ps1
  
This PowerShell script is designed to disable Xbox-related services on a Windows machine and remove the Xbox app and its related components. Key actions performed by this script include:
Clearing the terminal before execution to ensure a clean interface.
Stopping Xbox-related services (Xbox Accessory Management Service, Xbox Live Networking Service, Gaming Services, and Gaming Services Network) by setting their startup type to "Disabled."
Informing users about the script's actions through clear and concise instructions.
Removing various Xbox app components such as Xbox Identity Provider, Xbox Speech to Text Overlay, Xbox Game Overlay, Xbox Game Callable UI, and other related packages.
Guiding users through the removal process and confirming the completion of the script.
This script simplifies the process of disabling Xbox services and uninstalling the Xbox app and its components from a Windows machine.

--> !! Disclaimer !! 
I'm not responsible for any issues that could be caused. Run at your own risk!
That said, I have tested in my machine multiple times while creating the script and has worked everytime.

Made by - L1N3-37
Github - https://github.com/L1N3-37
