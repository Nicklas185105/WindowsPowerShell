# Load Terminal.Gui assembly (adjust the path accordingly)

using namespace Terminal.Gui

class GameScreen {
	[int]$LeftWidth = 32
	[int]$RightWidth = 34
	[string]$LeftBorder
	[string]$RightBorder

	[Window]$MainWindow

	# Keep references to UI Elements so we can update them later:
	[Button]$ClickButton
	[Button]$SaveButton
	[Button]$LoadButton
	[Button]$ResetButton
	[Button]$ExitButton
	[Label]$PointsLabel
	[Label]$IdleLabel
	[Label]$LastSaveLabel

	[Label]$InfoLabel

	GameScreen() {
		$this.LeftBorder = "*" * $this.LeftWidth
		$this.RightBorder = "*" * $this.RightWidth
	}

	[string] CenterText([string]$Text, [int]$Width) {
		$pad = $Width - $Text.Length
		if ($pad -le 0) { return $Text }
		$leftPad = [math]::Floor($pad / 2)
		$rightPad = [math]::Ceiling($pad / 2)
		return (" " * $leftPad) + $Text + (" " * $rightPad)
	}

	[void] Update([object]$gameData, [object]$buildings) {
		# Update the labels with the new gameData values
		$pointsStr = $gameData.Clicks.FormatCompact() + " p"
		$this.PointsLabel.Text = $this.CenterText($pointsStr, $this.LeftWidth)

		$idleStr = $gameData.IdleIncome.FormatCompact() + " p/s"
		$this.IdleLabel.Text = $this.CenterText($idleStr, $this.LeftWidth)

		if ($gameData.LastSaveTime) {
			$elapsed = (Get-Date).Subtract([DateTime]::ParseExact($gameData.LastSaveTime, "HH:mm:ss", [System.Globalization.CultureInfo]::InvariantCulture))
			$timeStr = $elapsed.ToString("hh\:mm\:ss")
		}
		else {
			$timeStr = "Not saved yet"
		}
		$this.LastSaveLabel.Text = $timeStr.PadRight($this.LeftWidth)
	}

	[void] Show([object]$gameData, [object]$buildings) {
		# Create the main window filling the terminal.
		$this.MainWindow = New-Object Window "Idle Game"
		$this.MainWindow.X = 0
		$this.MainWindow.Y = 0
		$this.MainWindow.Width = [Dim]::Fill()
		$this.MainWindow.Height = [Dim]::Fill()

		##########################################################
		# Left Panel – Game Stats
		##########################################################
		Write-Host "Creating stats panel..."

		$statsPanel = New-Object FrameView "Stats"
		$statsPanel.X = 0
		$statsPanel.Y = 0
		$statsPanel.Width = $this.LeftWidth
		$statsPanel.Height = [Dim]::Fill()

		# Title and Name labels.
		$titleLabel = New-Object Label ($this.CenterText("Factory", $this.LeftWidth))
		$titleLabel.X = [Pos]::Center()
		$titleLabel.Y = [Pos]::At(1)
		$statsPanel.Add($titleLabel)

		$nameLabel = New-Object Label ($this.CenterText("Name", $this.LeftWidth))
		$nameLabel.X = [Pos]::Center()
		$nameLabel.Y = [Pos]::At(2)
		$statsPanel.Add($nameLabel)

		# Separator line.
		$sepLabel = New-Object Label ($this.LeftBorder)
		$sepLabel.X = [Pos]::Center()
		$sepLabel.Y = [Pos]::At(3)
		$statsPanel.Add($sepLabel)

		# Points
		$pointsStr = $gameData.Clicks.FormatCompact() + " p"
		$this.PointsLabel = New-Object Label ($this.CenterText($pointsStr, $this.LeftWidth))
		$this.PointsLabel.X = [Pos]::Center()
		$this.PointsLabel.Y = [Pos]::At(5)
		$statsPanel.Add($this.PointsLabel)

		# Production rate
		$idleStr = $gameData.IdleIncome.FormatCompact() + " p/s"
		$this.IdleLabel = New-Object Label ($this.CenterText($idleStr, $this.LeftWidth))
		$this.IdleLabel.X = [Pos]::Center()
		$this.IdleLabel.Y = [Pos]::At(7)
		$statsPanel.Add($this.IdleLabel)

		# Click button
		$this.ClickButton = New-Object Button "Click Me"
		$this.ClickButton.X = [Pos]::Center()
		$this.ClickButton.Y = [Pos]::At(10)
		$statsPanel.Add($this.ClickButton)

		# Save button
		$this.SaveButton = New-Object Button "Save Game"
		$this.SaveButton.X = [Pos]::At(1)
		$this.SaveButton.Y = [Pos]::At(13)
		$statsPanel.Add($this.SaveButton)

		# Load button
		$this.LoadButton = New-Object Button "Load Game"
		$this.LoadButton.X = [Pos]::At(16)
		$this.LoadButton.Y = [Pos]::At(13)
		$statsPanel.Add($this.LoadButton)

		# Reset button
		$this.ResetButton = New-Object Button "Reset Game"
		$this.ResetButton.X = [Pos]::At(1)
		$this.ResetButton.Y = [Pos]::At(14)
		$statsPanel.Add($this.ResetButton)

		# Quit button
		$this.ExitButton = New-Object Button "Quit Game"
		$this.ExitButton.X = [Pos]::At(16)
		$this.ExitButton.Y = [Pos]::At(14)
		$statsPanel.Add($this.ExitButton)

		# Last save info.
		$labelLastSave = New-Object Label ($this.CenterText("Since last save", $this.LeftWidth))
		$labelLastSave.X = [Pos]::Center()
		$labelLastSave.Y = [Pos]::At(15)
		$statsPanel.Add($labelLastSave)

		if ($gameData.LastSaveTime) {
			$elapsed = (Get-Date).Subtract([DateTime]::ParseExact($gameData.LastSaveTime, "HH:mm:ss", [System.Globalization.CultureInfo]::InvariantCulture))
			$timeStr = $elapsed.ToString("hh\:mm\:ss")
		}
		else {
			$timeStr = "Not saved yet"
		}
		$this.LastSaveLabel = New-Object Label ($this.CenterText(("{0,15}" -f $timeStr), $this.LeftWidth))
		$this.LastSaveLabel.X = [Pos]::At(11)
		$this.LastSaveLabel.Y = [Pos]::At(16)
		$statsPanel.Add($this.LastSaveLabel)

		# Info label
		$this.InfoLabel = New-Object Label([Rect]::new(0, 0, $this.LeftWidth, 1), '')
		$this.InfoLabel.ColorScheme = [ColorScheme]::Focus
		$this.InfoLabel.X = [Pos]::At(0)
		$this.InfoLabel.Y = [Pos]::At(18)
		$this.InfoLabel.Text = "Click '?' button for more info asd"
		$this.InfoLabel.Width = [Dim]::Fill()
		$this.InfoLabel.Height = 10
		$statsPanel.Add($this.InfoLabel)

		##########################################################
		# Buildings Panel
		##########################################################
		# Write-Host "Creating buildings panel..."

		# $buildingsPanel = New-Object FrameView "Buildings"
		# $buildingsPanel.X = [Pos]::At($this.LeftWidth + 1); $buildingsPanel.Y = [Pos]::At(0)
		# $buildingsPanel.Width = $this.RightWidth; $buildingsPanel.Height = [Dim]::Fill()

		# # Get the building definitions.
		# $buildingProperties = $buildings.PSObject.Properties | Where-Object { $_.Value -is [BuildingDefinition] }
		# $totalBuildingCount = $buildingProperties.Count

		# # Create a scrollable view for the buildings.
		# $scrollView = New-Object ScrollView
		# $scrollView.AutoHideScrollBars = $true
		# $scrollView.ShowVerticalScrollIndicator = $true
		# $scrollView.ContentSize = [Size]::new($this.RightWidth - 3, $totalBuildingCount * 4 - 1)
		# $scrollView.Width = [Dim]::Fill(); $scrollView.Height = [Dim]::Fill()
		# $yPos = 0
		# for ($i = 0; $i -lt $totalBuildingCount; $i++) {
		# 	$bd = $buildingProperties[$i].Value
		# 	$panel = New-Object FrameView; $panel.Height = 4; $panel.Width = [Dim]::Fill()
		# 	$panel.X = [Pos]::At(1); $panel.Y = [Pos]::At($yPos)
		# 	$yPos += 4
		# 	$shopInfo = (FormatShopItem $bd.Name $bd.Owned (FormatLargeNumber $bd.GetCurrentPrice()))
		# 	$building = $bd.Setup($shopInfo)
		# 	$panel.Add($building.OwnedLabel, $building.BuyButton, $building.InfoButton, $building.PriceLabel)
		# 	$scrollView.Add($panel)
		# }
		# $buildingsPanel.Add($scrollView)

		##########################################################
		# Upgrades Panel
		##########################################################
		# Write-Host "Creating upgrades panel..."

		# $upgradesPanel = New-Object FrameView "Upgrades"
		# $upgradesPanel.X = [Pos]::At($this.LeftWidth + $this.RightWidth + 2)
		# $upgradesPanel.Y = [Pos]::At(0)
		# $upgradesPanel.Width = $this.RightWidth * 2
		# $upgradesPanel.Height = [Dim]::Fill()

		# # Create a scrollable view for the upgrades.
		# $scrollView = New-Object ScrollView
		# $scrollView.AutoHideScrollBars = $true
		# $scrollView.ShowVerticalScrollIndicator = $true
		# $scrollView.ContentSize = [Size]::new($this.RightWidth * 2 - 3, ($totalBuildingCount * 15 * 4 - 1))
		# $scrollView.Width = [Dim]::Fill()
		# $scrollView.Height = [Dim]::Fill()
		# $yPos = 0
		# for ($i = 0; $i -lt $totalBuildingCount; $i++) {
		# 	$bd = $buildingProperties[$i].Value
		# 	# Get the building definitions.
		# 	$upgradeProperties = $bd.Upgrades.PSObject.Properties | Where-Object { $_.Value -is [UpgradeDefinition] }
		# 	$totalUpgradeCount = $upgradeProperties.Count
		# 	for ($k = 0; $k -lt $totalUpgradeCount; $k++) {
		# 		$upgrade = $upgradeProperties[$k].Value
		# 		$upgrade.Panel = New-Object FrameView
		# 		$upgrade.Panel.Height = 4
		# 		$upgrade.Panel.Width = [Dim]::Fill()
		# 		$upgrade.Panel.X = [Pos]::At(1)
		# 		$upgrade.Panel.Y = [Pos]::At($yPos)
		# 		$yPos += 4
		# 		$label = New-Object Label ("{0,-25}{1,6}" -f $upgrade.Name, $upgrade.RequiredCount)
		# 		$label.X = [Pos]::At(1)
		# 		$label.Y = [Pos]::At(0)
		# 		$upgrade.Panel.Add($label)
		# 		$upgrade.BuyButton = New-Object Button "Buy"
		# 		$upgrade.BuyButton.X = 1
		# 		$upgrade.BuyButton.Y = 1
		# 		$upgrade.InfoButton = New-Object Button "?"
		# 		$upgrade.InfoButton.X = 8
		# 		$upgrade.InfoButton.Y = 1
		# 		$upgrade.Panel.Add($upgrade.BuyButton)
		# 		$upgrade.Panel.Add($upgrade.InfoButton)
		# 		$scrollView.Add($upgrade.Panel)


		# 		# if (-not $upgrade.IsPurchased -and $upgrade.UnlockCondition.Invoke($bd)) {
		# 		# 	# Display the upgrade as available, or allow purchase.
		# 		# 	Write-Host "Upgrade available: $($upgrade.Name) for $($upgrade.BaseCost) clicks."

		# 		# 	# When purchasing (after verifying the player has enough clicks):
		# 		# 	# e.g. if ($global:Data.Clicks -ge $upgrade.BaseCost) {
		# 		# 	#          $global:Data.Clicks -= $upgrade.BaseCost
		# 		# 	#          $upgrade.Effect.Invoke($global:BuildingData.Cursor)
		# 		# 	#          $upgrade.IsPurchased = $true
		# 		# 	#      }
		# 		# }
		# 	}
		# }
		# $upgradesPanel.Add($scrollView)

		# Add all panels to the main window.
		$this.MainWindow.Add($statsPanel)
		# $this.MainWindow.Add($buildingsPanel)
		# $this.MainWindow.Add($upgradesPanel)
	}
}
