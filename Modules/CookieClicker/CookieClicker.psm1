# Load the compiled C# DLL
# Find DLL dynamically
$moduleRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$dllPath = Join-Path $moduleRoot 'CookieClicker.dll'
Write-Host "Loading DLL from $dllPath" -ForegroundColor Cyan
if (!(Test-Path $dllPath)) {
    throw \"Could not find CookieClicker.dll at $dllPath\"
}

# Load the compiled C# DLL
# Add-Type -Path $dllPath
# [Reflection.Assembly]::LoadFrom($dllPath) | Out-Null

$assemblyBytes = [System.IO.File]::ReadAllBytes($dllPath)
[Reflection.Assembly]::Load($assemblyBytes)

# Write-Host "Test: $([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GetName().Name -eq 'CookieClicker' } | ForEach-Object { $_.GetTypes() })"
# [AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GetName().Name -eq 'CookieClicker' } |
# ForEach-Object { $_.GetTypes() | Select-Object FullName }
# [AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.FullName -like '*CookieClicker*' } | ForEach-Object {
#         $_.GetTypes() | Select-Object FullName
#     }

# if (-not [System.Management.Automation.PSTypeName]'CookieClicker.MainForm'.Type) {
#     throw "CookieClicker.MainForm not found even after loading DLL!"
# }


function Start-CookieClicker {
    Write-Host "Starting CookieClicker..." -ForegroundColor Green
    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Numerics
    $form = [CookieClicker.CookieClicker]::new()
    $form.ShowForm()
}