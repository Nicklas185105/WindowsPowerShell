# A simple idle/clicker game module for PowerShell with save/load and shop functionality

. $PSScriptRoot\BuildingDefinition.ps1
. $PSScriptRoot\IdleGameData.ps1
. $PSScriptRoot\SavingLoading.ps1
. $PSScriptRoot\GameScreen.ps1

$global:GameState = @{
    Running      = $false
    UpdateScreen = $true
}

$global:Data = [IdleGameData]::new()

$global:BuildingData = [BuildingData]::new()

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

    $screen = [GameScreen]::new()

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
            $screen.Show($global:Data, $global:BuildingData)
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
                    $global:BuildingData.Cursor.BuyBuilding()
                }
                'D2' {
                    $global:BuildingData.Grandma.BuyBuilding()
                }
                'D3' {
                    $global:BuildingData.Farm.BuyBuilding()
                }
                'D4' {
                    $global:BuildingData.Mine.BuyBuilding()
                }
                'D5' {
                    $global:BuildingData.Factory.BuyBuilding()
                }
                'D6' {
                    $global:BuildingData.Bank.BuyBuilding()
                }
                'D7' {
                    $global:BuildingData.Temple.BuyBuilding()
                }
                'D8' {
                    $global:BuildingData.WizardTower.BuyBuilding()
                }
                'D9' {
                    $global:BuildingData.Shipment.BuyBuilding()
                }
                'D0' {
                    $global:BuildingData.AlchemyLab.BuyBuilding()
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
    $global:Data = [IdleGameData]::new()
    $global:BuildingData = [BuildingData]::new()
    Write-Host "Game has been reset."
}

Export-ModuleMember -Function Start-IdleClickerGame, Stop-IdleClickerGame, Reset-IdleClickerGame, Save-IdleClickerGame, Load-IdleClickerGame
