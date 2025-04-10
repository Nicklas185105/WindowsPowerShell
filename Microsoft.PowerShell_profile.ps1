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
$modules = @('posh-git', 'PSReadLine', 'idle-clicker-game')
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
$Global:MyCustomAliases = $Global:MyCustomAliases + @("ll", "la", "grep", "cls", "showall", "keeponline", "clickergame")

Set-Alias ll Get-ChildItem
Set-Alias la "Get-ChildItem -Force"
Set-Alias grep Select-String

Set-Alias -Name showall -Value Show-CustomAliases

# Create alias for the Keep Online function
Set-Alias -Name keeponline -Value Keep-Alive

Set-Alias -Name clickergame -Value Start-IdleClickerGame

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
