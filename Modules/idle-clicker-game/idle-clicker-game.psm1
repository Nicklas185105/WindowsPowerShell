# A simple idle/clicker game module for PowerShell with save/load and shop functionality

. $PSScriptRoot\Keys.ps1
. $PSScriptRoot\BuildingDefinition.ps1
. $PSScriptRoot\IdleGameData.ps1
. $PSScriptRoot\SavingLoading.ps1
. $PSScriptRoot\GameScreen.ps1

$global:Keys = [Keys]::new()

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
                $global:Keys.Space.Key {
                    $global:Data.Clicks += $global:Data.ClickValue
                }
                $global:Keys.S.Key {
                    Save-IdleClickerGame
                }
                $global:Keys.L.Key {
                    Load-IdleClickerGame
                }
                $global:Keys.P.Key {
                    # Open the shop
                    Open-IdleClickerShop
                }
                $global:Keys.R.Key {
                    Reset-IdleClickerGame
                }
                $global:Keys.D1.Key {
                    $global:BuildingData.Cursor.BuyBuilding()
                }
                $global:Keys.D2.Key {
                    $global:BuildingData.Grandma.BuyBuilding()
                }
                $global:Keys.D3.Key {
                    $global:BuildingData.Farm.BuyBuilding()
                }
                $global:Keys.D4.Key {
                    $global:BuildingData.Mine.BuyBuilding()
                }
                $global:Keys.D5.Key {
                    $global:BuildingData.Factory.BuyBuilding()
                }
                $global:Keys.D6.Key {
                    $global:BuildingData.Bank.BuyBuilding()
                }
                $global:Keys.D7.Key {
                    $global:BuildingData.Temple.BuyBuilding()
                }
                $global:Keys.D8.Key {
                    $global:BuildingData.WizardTower.BuyBuilding()
                }
                $global:Keys.D9.Key {
                    $global:BuildingData.Shipment.BuyBuilding()
                }
                $global:Keys.D0.Key {
                    $global:BuildingData.AlchemyLab.BuyBuilding()
                }
                $global:Keys.N1.Key {
                    $global:BuildingData.Portal.BuyBuilding()
                }
                $global:Keys.N2.Key {
                    $global:BuildingData.TimeMachine.BuyBuilding()
                }
                $global:Keys.N3.Key {
                    $global:BuildingData.AntimatterCondenser.BuyBuilding()
                }
                $global:Keys.N4.Key {
                    $global:BuildingData.Prism.BuyBuilding()
                }
                $global:Keys.N5.Key {
                    $global:BuildingData.Chancemaker.BuyBuilding()
                }
                $global:Keys.N6.Key {
                    $global:BuildingData.FractalEngine.BuyBuilding()
                }
                $global:Keys.N7.Key {
                    $global:BuildingData.JavascriptConsole.BuyBuilding()
                }
                $global:Keys.N8.Key {
                    $global:BuildingData.Idleverse.BuyBuilding()
                }
                $global:Keys.N9.Key {
                    $global:BuildingData.CortexBaker.BuyBuilding()
                }
                $global:Keys.N0.Key {
                    $global:BuildingData.You.BuyBuilding()
                }
                $global:Keys.Escape.Key {
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
