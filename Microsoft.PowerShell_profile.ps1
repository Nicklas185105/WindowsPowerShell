# ================================
# PowerShell Profile Script Example
# ================================

# Check for administrative privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
	Write-Host "Warning: Running without Administrator privileges." -ForegroundColor Yellow
}

# -------------------------------
# Module Imports
# -------------------------------
# List of modules to import if available. You may install missing ones.
$modules = @('posh-git', 'PSReadLine', 'idle-clicker-game', 'Microsoft.PowerShell.ConsoleGuiTools', 'CookieClicker')
foreach ($module in $modules) {
	if (Get-Module -ListAvailable -Name $module) {
		Import-Module $module -ErrorAction SilentlyContinue
	}
	else {
		Write-Host "Module '$module' is not installed. Consider installing it for enhanced features." -ForegroundColor DarkYellow
	}
}

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/clean-detailed.omp.json" | Invoke-Expression

# -------------------------------
# Script Imports
# -------------------------------
# Set the path to your Scripts folder
$scriptFolder = "$HOME\Documents\WindowsPowerShell\Scripts"

# Dot source each PowerShell script in the folder
Get-ChildItem -Path $scriptFolder -Filter *.ps1 | ForEach-Object {
	. $_.FullName
}

# -------------------------------
# Custom Prompt Function
# -------------------------------
#function prompt {
# Get the current user and computer name
#$user = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
#$computer = $env:COMPUTERNAME
#$location = (Get-Location).Path

# Build a custom prompt: user@computer currentDirectory
#Write-Host "$user@" -NoNewline -ForegroundColor Green
#Write-Host "$computer" -NoNewline -ForegroundColor Cyan
#Write-Host " $location" -NoNewline -ForegroundColor White
#return "`n> "
#}

# -------------------------------
# Alias Definitions
# -------------------------------
# Define your custom alias names in a global variable.
# Update this list with any additional custom aliases you create.
$Global:MyCustomAliases = $Global:MyCustomAliases + @("ll", "la", "grep", "cls", "showall", "keeponline", "clickergame", "cc")

Set-Alias ll Get-ChildItem
Set-Alias la "Get-ChildItem -Force"
Set-Alias grep Select-String

Set-Alias -Name showall -Value Show-CustomAliases

# Create alias for the Keep Online function
Set-Alias -Name keeponline -Value Keep-Alive

Set-Alias -Name clickergame -Value Start-IdleClickerGame

Set-Alias -Name cc -Value Start-CookieClicker

# -------------------------------
# Environment Variables
# -------------------------------
# Set your preferred editor (for example, VS Code)
$env:EDITOR = "code"

# -------------------------------
# Custom Functions
# -------------------------------
# Example function: Get Git status if in a Git repository
function Get-GitStatus {
	if (Test-Path .git) {
		git status
	}
	else {
		Write-Host "This directory is not a Git repository." -ForegroundColor Red
	}
}

# function Load-DLL {
#     # Define variables for the package
#     $p# Define variables for the package
#     $packageName = "NStack.Core"
#     $version = "1.1.1"  # Adjust as needed
#     $nugetUrl = "https://www.nuget.org/api/v2/package/$packageName/$version"
#     $downloadPath = "$env:TEMP\$packageName.$version.nupkg"
#     $downloadZipPath = "$env:TEMP\$packageName.$version.zip"
#     $extractPath = "$env:TEMP\$packageName"

#     # Download the package
#     Write-Host "Downloading $packageName version $version..."
#     Invoke-WebRequest -Uri $nugetUrl -OutFile $downloadPath

#     # Rename the file to .zip to allow extraction
#     Rename-Item -Path $downloadPath -NewName ([System.IO.Path]::GetFileNameWithoutExtension($downloadPath) + ".zip")
#     $downloadZipPath = "$env:TEMP\$packageName.$version.zip"

#     # Remove any old extraction folder and extract the package
#     if (Test-Path $extractPath) { Remove-Item $extractPath -Recurse -Force }
#     Write-Host "Extracting package..."
#     Expand-Archive -Path $downloadZipPath -DestinationPath $extractPath

#     # Search for Terminal.Gui.dll – prefer the netstandard2.0 version if available.
#     $dllFile = Get-ChildItem -Path $extractPath -Recurse -Filter "$($packageName).dll" |
#         Where-Object { $_.FullName -match "netstandard2.0" } |
#         Select-Object -First 1

#     if ($dllFile -eq $null) {
#         Write-Host "netstandard2.0 DLL not found, falling back to first $($packageName).dll found."
#         $dllFile = Get-ChildItem -Path $extractPath -Recurse -Filter "$($packageName).dll" | Select-Object -First 1
#     }

#     if ($dllFile -eq $null) {
#         Write-Error "$($packageName).dll not found in extracted package at $extractPath. Check the package structure."
#     } else {
#         Write-Host "Loading $($packageName).dll from $($dllFile.FullName)..."
#         try {
#             Add-Type -Path $dllFile.FullName -ErrorAction Stop
#             Write-Host "$($packageName) loaded successfully."
#         }
#         catch {
#             Write-Error "Failed to load $($packageName).dll. Error details: $($_.Exception.Message)"
#             # Optionally, if you want more detailed loader exceptions, you can check LoaderExceptions here.
#         }
#     }
# }

# More custom functions can be added here...

# -------------------------------
# PSReadLine History Settings
# -------------------------------
Set-PSReadLineOption -HistorySavePath "$env:USERPROFILE\Documents\PowerShell_history.txt"
Set-PSReadLineOption -MaximumHistoryCount 4096

# -------------------------------
# Additional Customizations
# -------------------------------
# Optionally load an additional custom profile script if it exists.
$customProfile = "$env:USERPROFILE\Documents\PowerShell\profile_custom.ps1"
if (Test-Path $customProfile) {
	. $customProfile
}

Write-Host "PowerShell profile loaded successfully!" -ForegroundColor Green
