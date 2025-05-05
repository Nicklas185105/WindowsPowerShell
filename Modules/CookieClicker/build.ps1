Write-Host "Building CookieClicker.dll..." -ForegroundColor Cyan

# Clean up old build artifacts
$filesToDelete = @(
    '.\\CookieClicker.dll',
    '.\\CookieClicker.pdb',
    '.\\CookieClicker.deps.json'
)

foreach ($file in $filesToDelete) {
    if (Test-Path $file) {
        Remove-Item $file -Force
    }
}

# Find csc.exe (default .NET Framework 4.x)
# $cscPaths = @(
#     "$env:WINDIR\\Microsoft.NET\\Framework\\v4.0.30319\\csc.exe",
#     "$env:WINDIR\\Microsoft.NET\\Framework64\\v4.0.30319\\csc.exe"
# )

# $csc = $cscPaths | Where-Object { Test-Path $_ } | Select-Object -First 1



# if (-not $csc) {
#     Write-Host "❌ Could not find csc.exe (you may need to install .NET Framework Developer Pack)." -ForegroundColor Red
#     exit 1
# }

# Build project
dotnet build --nologo

# $files = Get-ChildItem -Path $scriptDir -Filter '*.cs' | ForEach-Object { $_.FullName }
# & $csc /target:library /out:CookieClicker.dll $files /reference:System.Windows.Forms.dll,System.Drawing.dll


# Post-build cleanup
$extraFiles = @(
    '.\\CookieClicker.pdb',
    '.\\CookieClicker.deps.json'
)

foreach ($file in $extraFiles) {
    if (Test-Path $file) {
        Remove-Item $file -Force
        Write-Host "Deleted unwanted file: $file" -ForegroundColor DarkYellow
    }
}

$pathTest = Test-Path ".\\CookieClicker.dll"
# Check if build succeeded
if ($pathTest -eq $false) {
    Write-Host "Build failed. Check errors." -ForegroundColor Red
    return
}

Write-Host "Build succeeded!" -ForegroundColor Green

Write-Host "Importing module..." -ForegroundColor Yellow
Import-Module "CookieClicker" -Force
Write-Host "Module imported. Run Start-CookieClicker!" -ForegroundColor Green