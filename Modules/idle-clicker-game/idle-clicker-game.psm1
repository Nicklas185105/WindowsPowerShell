# A simple idle/clicker game module for PowerShell with save/load and shop functionality

$module = (Get-Module Microsoft.PowerShell.ConsoleGuiTools -List).ModuleBase
if (-Not $module) {
	$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
	$dllPath = Join-Path $scriptPath "/Imports/Terminal.Gui.dll"
	Write-Host "DLL Path: $($dllPath)"
	if (-Not (Test-Path $dllPath)) {
		Throw "Terminal.Gui.dll not found at $dllPath"
	}
}
else {
	$dllPath = (Join-Path $module "Terminal.Gui.dll")
	Write-Host "DLL Path: $($dllPath)"
	if (-Not (Test-Path $dllPath)) {
		Throw "Terminal.Gui.dll not found at $dllPath"
	}
}
Add-Type -Path $dllPath
[Reflection.Assembly]::LoadFrom($dllPath) | Out-Null

. $PSScriptRoot\Number.ps1
. $PSScriptRoot\Utils.ps1
. $PSScriptRoot\UpgradeDefinition.ps1
. $PSScriptRoot\Keys.ps1
. $PSScriptRoot\BuildingDefinition.ps1
. $PSScriptRoot\IdleGameData.ps1
. $PSScriptRoot\SavingLoading.ps1
. $PSScriptRoot\GameScreenV2.ps1

$global:Keys = [Keys]::new()

$global:GameState = @{
	Running      = $false
	UpdateScreen = $true
}

$global:Data = [IdleGameData]::new()

$global:BuildingData = [BuildingData]::new()

# Load in all buildings
. $PSScriptRoot\Buildings\Cursor.ps1
. $PSScriptRoot\Buildings\Grandma.ps1
. $PSScriptRoot\Buildings\Farm.ps1
. $PSScriptRoot\Buildings\Mine.ps1
. $PSScriptRoot\Buildings\Factory.ps1
. $PSScriptRoot\Buildings\Bank.ps1
. $PSScriptRoot\Buildings\Temple.ps1
. $PSScriptRoot\Buildings\WizardTower.ps1
. $PSScriptRoot\Buildings\Shipment.ps1
. $PSScriptRoot\Buildings\AlchemyLab.ps1
. $PSScriptRoot\Buildings\Portal.ps1
. $PSScriptRoot\Buildings\TimeMachine.ps1
. $PSScriptRoot\Buildings\AntimatterCondenser.ps1
. $PSScriptRoot\Buildings\Prism.ps1
. $PSScriptRoot\Buildings\Chancemaker.ps1
. $PSScriptRoot\Buildings\FractalEngine.ps1
. $PSScriptRoot\Buildings\JavascriptConsole.ps1
. $PSScriptRoot\Buildings\Idleverse.ps1
. $PSScriptRoot\Buildings\CortexBaker.ps1
. $PSScriptRoot\Buildings\You.ps1

# Have a reset state for buildings
$resetBuildingsState = $global:BuildingData

function Start-IdleClickerGame-form {
	Add-Type -AssemblyName System.Windows.Forms

	$form = New-Object System.Windows.Forms.Form
	$form.Text = 'Hello PowerShell GUI'
	$form.Size = New-Object System.Drawing.Size(300, 200)

	$counter = 0

	$label = New-Object System.Windows.Forms.Label
	$label.Text = "Counter: $counter"
	$label.Location = New-Object System.Drawing.Point(100, 30)
	$label.AutoSize = $true
	$form.Controls.Add($label)

	$button = New-Object System.Windows.Forms.Button
	$button.Text = 'Click Me!'
	$button.Location = New-Object System.Drawing.Point(100, 70)
	$button.Add_Click({
			$counter++
			$label.Text = "Counter: $counter"
		})
	$form.Controls.Add($button)

	$form.ShowDialog()
}

function Start-IdleClickerGame-Debug {
	Load-IdleClickerGame

	Write-Host "Debugging IdleClickerGame..."
	$percentNum = $global:BuildingData.Shipment.GetCurrentIncome() / $global:Data.IdleIncome * [Number]::new('100')
	# $percentage = [math]::Round( $percentNum.ToDecimal(), 2 )
	Write-Host "Clicks: $($global:Data.Clicks)"
	Write-Host "Base Income: $($global:BuildingData.Shipment.Income.ToString())"
	Write-Host "Total Income: $($global:BuildingData.Shipment.GetCurrentIncome())"
	Write-Host "$($percentNum.ToDecimal())"
	Write-Host "Info: $($global:BuildingData.Shipment.GetInfo())"
}

function Start-IdleClickerGame {
	Load-IdleClickerGame

	[Terminal.Gui.Application]::Init()
	$top = [Terminal.Gui.Application]::Top

	# Create an instance of GameScreen and display it.
	$screen = [GameScreen]::new()
	$screen.Show($global:Data, $global:BuildingData)
	$top.Add($screen.MainWindow)

	$screen.ClickButton.Add_Clicked({
			$global:Data.Clicks += $global:Data.ClickValue
			$global:GameState.UpdateScreen = $true
			[Terminal.Gui.Application]::MainLoop.Invoke({})
		})
	$screen.SaveButton.Add_Clicked({
			Save-IdleClickerGame
			$global:GameState.UpdateScreen = $true
			[Terminal.Gui.Application]::MainLoop.Invoke({})
		})
	$screen.LoadButton.Add_Clicked({
			Load-IdleClickerGame
			$global:GameState.UpdateScreen = $true
			[Terminal.Gui.Application]::MainLoop.Invoke({})
		})
	$screen.ExitButton.Add_Clicked({
			Stop-IdleClickerGame
			[Terminal.Gui.Application]::MainLoop.Invoke({})
		})

	# Setup buildings click function
	$global:BuildingData.Cursor.BuyButton.Add_Clicked({ $global:BuildingData.Cursor.BuyBuilding(); $screen.Update($global:Data, $global:BuildingData); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.Grandma.BuyButton.Add_Clicked({ $global:BuildingData.Grandma.BuyBuilding(); $screen.Update($global:Data, $global:BuildingData); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.Farm.BuyButton.Add_Clicked({ $global:BuildingData.Farm.BuyBuilding(); $screen.Update($global:Data, $global:BuildingData); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.Mine.BuyButton.Add_Clicked({ $global:BuildingData.Mine.BuyBuilding(); $screen.Update($global:Data, $global:BuildingData); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.Factory.BuyButton.Add_Clicked({ $global:BuildingData.Factory.BuyBuilding(); $screen.Update($global:Data, $global:BuildingData); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.Bank.BuyButton.Add_Clicked({ $global:BuildingData.Bank.BuyBuilding(); $screen.Update($global:Data, $global:BuildingData); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.Temple.BuyButton.Add_Clicked({ $global:BuildingData.Temple.BuyBuilding(); $screen.Update($global:Data, $global:BuildingData); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.WizardTower.BuyButton.Add_Clicked({ $global:BuildingData.WizardTower.BuyBuilding(); $screen.Update($global:Data, $global:BuildingData); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.Shipment.BuyButton.Add_Clicked({ $global:BuildingData.Shipment.BuyBuilding(); $screen.Update($global:Data, $global:BuildingData); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.AlchemyLab.BuyButton.Add_Clicked({ $global:BuildingData.AlchemyLab.BuyBuilding(); $screen.Update($global:Data, $global:BuildingData); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.Portal.BuyButton.Add_Clicked({ $global:BuildingData.Portal.BuyBuilding(); $screen.Update($global:Data, $global:BuildingData); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.TimeMachine.BuyButton.Add_Clicked({ $global:BuildingData.TimeMachine.BuyBuilding(); $screen.Update($global:Data, $global:BuildingData); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.AntimatterCondenser.BuyButton.Add_Clicked({ $global:BuildingData.AntimatterCondenser.BuyBuilding(); $screen.Update($global:Data, $global:BuildingData); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.Prism.BuyButton.Add_Clicked({ $global:BuildingData.Prism.BuyBuilding(); $screen.Update($global:Data, $global:BuildingData); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.Chancemaker.BuyButton.Add_Clicked({ $global:BuildingData.Chancemaker.BuyBuilding(); $screen.Update($global:Data, $global:BuildingData); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.FractalEngine.BuyButton.Add_Clicked({ $global:BuildingData.FractalEngine.BuyBuilding(); $screen.Update($global:Data, $global:BuildingData); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.JavascriptConsole.BuyButton.Add_Clicked({ $global:BuildingData.JavascriptConsole.BuyBuilding(); $screen.Update($global:Data, $global:BuildingData); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.CortexBaker.BuyButton.Add_Clicked({ $global:BuildingData.CortexBaker.BuyBuilding(); $screen.Update($global:Data, $global:BuildingData); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.You.BuyButton.Add_Clicked({ $global:BuildingData.You.BuyBuilding(); $screen.Update($global:Data, $global:BuildingData); [Terminal.Gui.Application]::MainLoop.Invoke({}); })

	# Setup buildings info function
	$global:BuildingData.Cursor.InfoButton.Add_Clicked({ $screen.InfoLabel.Text = $global:BuildingData.Cursor.GetInfo(); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.Grandma.InfoButton.Add_Clicked({ $screen.InfoLabel.Text = $global:BuildingData.Grandma.GetInfo(); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.Farm.InfoButton.Add_Clicked({ $screen.InfoLabel.Text = $global:BuildingData.Farm.GetInfo(); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.Mine.InfoButton.Add_Clicked({ $screen.InfoLabel.Text = $global:BuildingData.Mine.GetInfo(); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.Factory.InfoButton.Add_Clicked({ $screen.InfoLabel.Text = $global:BuildingData.Factory.GetInfo(); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.Bank.InfoButton.Add_Clicked({ $screen.InfoLabel.Text = $global:BuildingData.Bank.GetInfo(); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.Temple.InfoButton.Add_Clicked({ $screen.InfoLabel.Text = $global:BuildingData.Temple.GetInfo(); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.WizardTower.InfoButton.Add_Clicked({ $screen.InfoLabel.Text = $global:BuildingData.WizardTower.GetInfo(); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.Shipment.InfoButton.Add_Clicked({ $screen.InfoLabel.Text = $global:BuildingData.Shipment.GetInfo(); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.AlchemyLab.InfoButton.Add_Clicked({ $screen.InfoLabel.Text = $global:BuildingData.AlchemyLab.GetInfo(); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.Portal.InfoButton.Add_Clicked({ $screen.InfoLabel.Text = $global:BuildingData.Portal.GetInfo(); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.TimeMachine.InfoButton.Add_Clicked({ $screen.InfoLabel.Text = $global:BuildingData.TimeMachine.GetInfo(); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.AntimatterCondenser.InfoButton.Add_Clicked({ $screen.InfoLabel.Text = $global:BuildingData.AntimatterCondenser.GetInfo(); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.Prism.InfoButton.Add_Clicked({ $screen.InfoLabel.Text = $global:BuildingData.Prism.GetInfo(); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.Chancemaker.InfoButton.Add_Clicked({ $screen.InfoLabel.Text = $global:BuildingData.Chancemaker.GetInfo(); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.FractalEngine.InfoButton.Add_Clicked({ $screen.InfoLabel.Text = $global:BuildingData.FractalEngine.GetInfo(); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.JavascriptConsole.InfoButton.Add_Clicked({ $screen.InfoLabel.Text = $global:BuildingData.JavascriptConsole.GetInfo(); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.CortexBaker.InfoButton.Add_Clicked({ $screen.InfoLabel.Text = $global:BuildingData.CortexBaker.GetInfo(); [Terminal.Gui.Application]::MainLoop.Invoke({}); })
	$global:BuildingData.You.InfoButton.Add_Clicked({ $screen.InfoLabel.Text = $global:BuildingData.You.GetInfo(); [Terminal.Gui.Application]::MainLoop.Invoke({}); })

	# --- Add a repeating timer to update dynamic UI elements ---
	# This uses Terminal.Gui's MainLoop.AddTimer.
	[Terminal.Gui.Application]::MainLoop.AddTimeout([TimeSpan]::FromMilliseconds(1), {
			if (-not $global:GameState.UpdateScreen) {
				return $true # Return true to keep the timer running.
			}
			# Use MainLoop.Invoke to schedule updates on the UI thread.
			[Terminal.Gui.Application]::MainLoop.Invoke({
					$screen.Update($global:Data, $global:BuildingData)
				})
			$global:GameState.UpdateScreen = $false
			return $true # Return true to keep the timer running.
		})
	[Terminal.Gui.Application]::MainLoop.AddTimeout([TimeSpan]::FromSeconds(1), {
			# Use MainLoop.Invoke to schedule updates on the UI thread.
			[Terminal.Gui.Application]::MainLoop.Invoke({
					$global:Data.Clicks += $global:Data.IdleIncome
					$global:GameState.UpdateScreen = $true
				})
			return $true # Return true to keep the timer running.
		})

	# Run the Terminal.Gui event loop.
	[Terminal.Gui.Application]::Run($top)
	[Terminal.Gui.Application]::Shutdown()
}

function Start-IdleClickerGame-Legacy {
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
			$screen.Update($global:Data, $global:BuildingData)
		}
	} | Out-Null

	$global:Timer.Start()

	$buildings = $global:BuildingData.PSObject.Properties |
	Where-Object { $_.Value -is [BuildingDefinition] } |
	ForEach-Object { $_.Value }

	Write-Host "Idle/Clicker Game started!"
	Write-Host "Press Spacebar to click, S to save, L to load, P for shop, or Escape to stop the game."

	$screen.Show($global:Data, $global:BuildingData)

	# Main game loop using non-blocking key detection
	while ($global:GameState.Running) {
		# Update the display if flagged
		if ($global:GameState.UpdateScreen) {
			#$screen.Show($global:Data, $global:BuildingData)
			$screen.Update($global:Data, $global:BuildingData)
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
				$global:Keys.Escape.Key {
					$global:GameState.Running = $false
				}
				default {
					$buildingMatch = $buildings | Where-Object { $_.Key.Key -eq $key.Key }
					if ($buildingMatch) {
						$buildingMatch.BuyBuilding()
					}
					else {
						Write-host $key.Key
					}
				}
			}
		}
		Start-Sleep -Milliseconds 50  # Adjust refresh rate/CPU usage as needed
	}
	Stop-IdleClickerGame
}

function Stop-IdleClickerGame {
	[Terminal.Gui.Application]::Shutdown()

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
	$global:BuildingData = $resetBuildingsState
	Write-Host "Game has been reset."
}

$exportModuleMemberParams = @{
	Function = @(
		'Start-IdleClickerGame'
		'Start-IdleClickerGame-Legacy'
		'Start-IdleClickerGame-form'
		'Stop-IdleClickerGame'
		'Reset-IdleClickerGame'
		'Save-IdleClickerGame'
		'Load-IdleClickerGame'
		'FormatLargeNumber'
		'FormatShopItem'
		'Start-IdleClickerGame-Debug'
	)
}

Export-ModuleMember @exportModuleMemberParams
