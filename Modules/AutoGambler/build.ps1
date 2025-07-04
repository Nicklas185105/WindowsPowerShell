Write-Host "Building AutoGambler.dll..." -ForegroundColor Cyan

# Clean up old build artifacts
$filesToDelete = @(
    '.\\AutoGambler.dll',
    '.\\AutoGambler.pdb',
    '.\\AutoGambler.deps.json'
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

# $files = Get-ChildItem -Path $scriptDir -Filter '*.cs' | ForEach-Object { $_.FullName }
Write-Host "Compiling files: $($files -join ', ')" -ForegroundColor Yellow

# Build project
dotnet build --nologo
# & $csc /target:library /out:CookieClicker.dll $files /reference:System.Windows.Forms.dll,System.Drawing.dll



# Post-build cleanup
$extraFiles = @(
    '.\\AutoGambler.pdb',
    '.\\AutoGambler.deps.json'
)

foreach ($file in $extraFiles) {
    if (Test-Path $file) {
        Remove-Item $file -Force
        Write-Host "Deleted unwanted file: $file" -ForegroundColor DarkYellow
    }
}

$pathTest = Test-Path ".\\AutoGambler.dll"
# Check if build succeeded
if ($pathTest -eq $false) {
    Write-Host "Build failed. Check errors." -ForegroundColor Red
    return
}

Write-Host "Build succeeded!" -ForegroundColor Green