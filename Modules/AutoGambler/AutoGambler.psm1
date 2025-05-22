# Load the compiled C# DLL
# Find DLL dynamically
$moduleRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$dllPath = Join-Path $moduleRoot 'AutoGambler.dll'
Write-Host "Loading DLL from $dllPath" -ForegroundColor Cyan
if (!(Test-Path $dllPath)) {
    throw \"Could not find AutoGambler.dll at $dllPath\"
}

Add-Type -Path $dllPath
$assemblyBytes = [System.IO.File]::ReadAllBytes($dllPath)
[Reflection.Assembly]::Load($assemblyBytes)

function Start-AutoGambler {
    param(
        [Parameter(Position=0)]
        [string]$StartingBalance,
        [Parameter(Position=1)]
        [string]$Strategy,
        [Parameter(Position=2)]
        [string]$BaseBet
    )
    Write-Host "Starting AutoGambler..." -ForegroundColor Green
    [AutoGambler.AutoGambler]::new($StartingBalance, $BaseBet).Start($Strategy)
}

function Get-Strategies {
    [AutoGambler.AutoGambler]::ListStrategies()
}

function Start-Simulation {
    param(
        [Parameter(Position=0)]
        [string]$simulations,
        [Parameter(Position=1)]
        [string]$StartingBalance,
        [Parameter(Position=2)]
        [string]$BaseBet
    )
    Write-Host "Starting AutoGambler Simulation..." -ForegroundColor Green
    [AutoGambler.AutoGambler]::new($StartingBalance, $BaseBet).Simulate($simulations)
}

function Start-Trainer{
    param(
        [Parameter(Position=0)]
        [string]$StartingBalance,
        [Parameter(Position=1)]
        [string]$BaseBet
    )
    Write-Host "Starting AutoGambler Trainer..." -ForegroundColor Green
    [AutoGambler.AutoGambler]::new($StartingBalance, $BaseBet).Trainer()
}