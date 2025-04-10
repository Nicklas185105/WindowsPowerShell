function Keep-Alive {
    <#
    .SYNOPSIS
    Keep the screen alive.
    .DESCRIPTION
    Keeps the screen alive by using Windows power management API.
    Allows pausing and resuming with P.
    #>

    Write-Host "Starting keep-alive"
    Write-Host "Press Ctrl+C to stop. Press P to pause/resume."

    $wsh = New-Object -ComObject WScript.Shell
    $count = 0
    $paused = $false

    while ($true) {
        if (-not $paused) {
            $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
            $count++
            Write-Host "[$timestamp] - $count - Keeping screen alive..."
            $wsh.SendKeys('+{F15}')
        }

        # Instead of sleeping for 60 seconds in one go, do 60 iterations of 1 second each,
        # so we can check for the hotkey more frequently.
        for ($i = 0; $i -lt 60; $i++) {
            Start-Sleep -Seconds 1
            if ([console]::KeyAvailable) {
                $key = [console]::ReadKey($true)
                # Check if Control and Alt modifiers are pressed along with the P key.
                if ($key.Key -eq 'P') {
                    $paused = -not $paused
                    if ($paused) {
                        Write-Host "Paused..."
                    }
                    else {
                        Write-Host "Resumed..."
                    }
                }
            }
        }
    }
}
