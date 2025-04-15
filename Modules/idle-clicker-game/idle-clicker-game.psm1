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
		})

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
	)
}

Export-ModuleMember @exportModuleMemberParams
