# A simple idle/clicker game module for PowerShell with save/load and shop functionality

. $PSScriptRoot\init.ps1
. $PSScriptRoot\utils.ps1
. $PSScriptRoot\saving-loading.ps1
. $PSScriptRoot\screen.ps1

function Start-IdleClickerGame {
    param(
        [int]$IdleInterval = 1  # Interval in seconds for idle income
    )

    if ($global:GameState.Running) {
        Write-Host "The game is already running."
        return
    }

    # Optionally load state on start
    Load-IdleClickerGame

    $global:GameState.Running = $true

    # Create a timer to add idle income at the specified interval
    $global:Timer = New-Object System.Timers.Timer
    $global:Timer.Interval = $IdleInterval * 1000
    $global:Timer.AutoReset = $true

    # Register the timer event so that the callback runs in PowerShell's event queue
    Register-ObjectEvent -InputObject $global:Timer -EventName Elapsed -Action {
        if ($global:GameState.Running) {
            $global:GameState.UpdateScreen = $true
            $global:Data.Clicks += $global:Data.IdleIncome
        }
    } | Out-Null    

    $global:Timer.Start()

    Write-Host "Idle/Clicker Game started!"
    Write-Host "Press Spacebar to click, S to save, L to load, P for shop, or Escape to stop the game."

    # Main game loop using non-blocking key detection
    while ($global:GameState.Running) {
        # Update the display if flagged
        if ($global:GameState.UpdateScreen) {
            Show-GameScreen
            $global:GameState.UpdateScreen = $false
        }

        # Check for key press without blocking
        if ([console]::KeyAvailable) {
            $global:GameState.UpdateScreen = $true
            $key = [console]::ReadKey($true)
            switch ($key.Key) {
                'Spacebar' {
                    $global:Data.Clicks += $global:Data.ClickValue
                }
                'S' {
                    Save-IdleClickerGame
                }
                'L' {
                    Load-IdleClickerGame
                }
                'P' {
                    # Open the shop
                    Open-IdleClickerShop
                }
                'R' {
                    Reset-IdleClickerGame
                }
                'D1' {
                    Buy-Building -Building 1
                }
                'D2' {
                    Buy-Building -Building 2
                }
                'D3' {
                    Buy-Building -Building 3
                }
                'D4' {
                    Buy-Building -Building 4
                }
                'D5' {
                    Buy-Building -Building 5
                }
                'D6' {
                    Buy-Building -Building 6
                }
                'D7' {
                    Buy-Building -Building 7
                }
                'D8' {
                    Buy-Building -Building 8
                }
                'Escape' {
                    $global:GameState.Running = $false
                }
                default {
                    Write-host $key.Key
                }
            }
        }
        Start-Sleep -Milliseconds 50  # Adjust refresh rate/CPU usage as needed
    }
    Stop-IdleClickerGame
}

function Stop-IdleClickerGame {
    if (-not $global:GameState.Running) {
        Write-Host "The game is not running."
        return
    }
    
    if ($global:Timer) {
        $global:Timer.Stop()
        $global:Timer.Dispose()
    }
    
    Write-Host "Game stopped. Final score: $($global:Data.Clicks)"
    $global:GameState.Running = $false
}

function Reset-IdleClickerGame {
    # Reset the game state to its defaults
    $global:Data = @{
        Clicks          = 0      # Total number of clicks/points
        IdleIncome      = 0      # Points gained automatically every interval
        ClickValue      = 1      # Points per click
        LastSaveTime    = $null  # Holds the DateTime of the last save
        Buildings       = @{
            Cursor      = 0
            Grandma     = 0
            Farm        = 0
            Mine        = 0
            Factory     = 0
            Bank        = 0
            Temple      = 0
            WizardTower = 0
        }
    }
    Write-Host "Game has been reset."
}

Export-ModuleMember -Function Start-IdleClickerGame, Stop-IdleClickerGame, Reset-IdleClickerGame, Save-IdleClickerGame, Load-IdleClickerGame, Open-IdleClickerShop, Buy-Building, Get-IdleIncomeValue, Get-BuildingPrice
