# Load Terminal.Gui assembly (adjust the path accordingly)

class GameScreen {
	[int]$LeftWidth = 32
	[int]$RightWidth = 34
	[string]$LeftBorder
	[string]$RightBorder

	[Terminal.Gui.Window]$MainWindow

	# Keep references to UI Elements so we can update them later:
	[Terminal.Gui.Button]$ClickButton
	[Terminal.Gui.Button]$SaveButton
	[Terminal.Gui.Button]$LoadButton
	[Terminal.Gui.Button]$ResetButton
	[Terminal.Gui.Button]$ExitButton
	[Terminal.Gui.Label]$PointsLabel
	[Terminal.Gui.Label]$IdleLabel
	[Terminal.Gui.Label]$LastSaveLabel

	[Terminal.Gui.Label]$InfoLabel

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
		$this.MainWindow = New-Object Terminal.Gui.Window "Idle Game"
		$this.MainWindow.X = 0
		$this.MainWindow.Y = 0
		$this.MainWindow.Width = [Terminal.Gui.Dim]::Fill()
		$this.MainWindow.Height = [Terminal.Gui.Dim]::Fill()

		##########################################################
		# Left Panel – Game Stats
		##########################################################
		Write-Host "Creating stats panel..."

		$statsPanel = New-Object Terminal.Gui.FrameView "Stats"
		$statsPanel.X = 0
		$statsPanel.Y = 0
		$statsPanel.Width = $this.LeftWidth
		$statsPanel.Height = [Terminal.Gui.Dim]::Fill()

		# Title and Name labels.
		$titleLabel = New-Object Terminal.Gui.Label ($this.CenterText("Factory", $this.LeftWidth))
		$titleLabel.X = [Terminal.Gui.Pos]::Center()
		$titleLabel.Y = [Terminal.Gui.Pos]::At(1)
		$statsPanel.Add($titleLabel)

		$nameLabel = New-Object Terminal.Gui.Label ($this.CenterText("Name", $this.LeftWidth))
		$nameLabel.X = [Terminal.Gui.Pos]::Center()
		$nameLabel.Y = [Terminal.Gui.Pos]::At(2)
		$statsPanel.Add($nameLabel)

		# Separator line.
		$sepLabel = New-Object Terminal.Gui.Label ($this.LeftBorder)
		$sepLabel.X = [Terminal.Gui.Pos]::Center()
		$sepLabel.Y = [Terminal.Gui.Pos]::At(3)
		$statsPanel.Add($sepLabel)

		# Points
		$pointsStr = $gameData.Clicks.FormatCompact() + " p"
		$this.PointsLabel = New-Object Terminal.Gui.Label ($this.CenterText($pointsStr, $this.LeftWidth))
		$this.PointsLabel.X = [Terminal.Gui.Pos]::Center()
		$this.PointsLabel.Y = [Terminal.Gui.Pos]::At(5)
		$statsPanel.Add($this.PointsLabel)

		# Production rate
		$idleStr = $gameData.IdleIncome.FormatCompact() + " p/s"
		$this.IdleLabel = New-Object Terminal.Gui.Label ($this.CenterText($idleStr, $this.LeftWidth))
		$this.IdleLabel.X = [Terminal.Gui.Pos]::Center()
		$this.IdleLabel.Y = [Terminal.Gui.Pos]::At(7)
		$statsPanel.Add($this.IdleLabel)

		# Click button
		$this.ClickButton = New-Object Terminal.Gui.Button "Click Me"
		$this.ClickButton.X = [Terminal.Gui.Pos]::Center()
		$this.ClickButton.Y = [Terminal.Gui.Pos]::At(10)
		$statsPanel.Add($this.ClickButton)

		# Save button
		$this.SaveButton = New-Object Terminal.Gui.Button "Save Game"
		$this.SaveButton.X = [Terminal.Gui.Pos]::At(1)
		$this.SaveButton.Y = [Terminal.Gui.Pos]::At(13)
		$statsPanel.Add($this.SaveButton)

		# Load button
		$this.LoadButton = New-Object Terminal.Gui.Button "Load Game"
		$this.LoadButton.X = [Terminal.Gui.Pos]::At(16)
		$this.LoadButton.Y = [Terminal.Gui.Pos]::At(13)
		$statsPanel.Add($this.LoadButton)

		# Reset button
		$this.ResetButton = New-Object Terminal.Gui.Button "Reset Game"
		$this.ResetButton.X = [Terminal.Gui.Pos]::At(1)
		$this.ResetButton.Y = [Terminal.Gui.Pos]::At(14)
		$statsPanel.Add($this.ResetButton)

		# Quit button
		$this.ExitButton = New-Object Terminal.Gui.Button "Quit Game"
		$this.ExitButton.X = [Terminal.Gui.Pos]::At(16)
		$this.ExitButton.Y = [Terminal.Gui.Pos]::At(14)
		$statsPanel.Add($this.ExitButton)

		# Last save info.
		$labelLastSave = New-Object Terminal.Gui.Label ($this.CenterText("Since last save", $this.LeftWidth))
		$labelLastSave.X = [Terminal.Gui.Pos]::Center()
		$labelLastSave.Y = [Terminal.Gui.Pos]::At(15)
		$statsPanel.Add($labelLastSave)

		if ($gameData.LastSaveTime) {
			$elapsed = (Get-Date).Subtract([DateTime]::ParseExact($gameData.LastSaveTime, "HH:mm:ss", [System.Globalization.CultureInfo]::InvariantCulture))
			$timeStr = $elapsed.ToString("hh\:mm\:ss")
		}
		else {
			$timeStr = "Not saved yet"
		}
		$this.LastSaveLabel = New-Object Terminal.Gui.Label ($this.CenterText(("{0,15}" -f $timeStr), $this.LeftWidth))
		$this.LastSaveLabel.X = [Terminal.Gui.Pos]::At(11)
		$this.LastSaveLabel.Y = [Terminal.Gui.Pos]::At(16)
		$statsPanel.Add($this.LastSaveLabel)

		# Info label
		$this.InfoLabel = New-Object Terminal.Gui.Label([Terminal.Gui.Rect]::new(0, 0, $this.LeftWidth, 1), '')
		$this.InfoLabel.ColorScheme = [Terminal.Gui.ColorScheme]::Focus
		$this.InfoLabel.X = [Terminal.Gui.Pos]::At(0)
		$this.InfoLabel.Y = [Terminal.Gui.Pos]::At(18)
		$this.InfoLabel.Text = "Click '?' button for more info asd"
		$this.InfoLabel.Width = [Terminal.Gui.Dim]::Fill()
		$this.InfoLabel.Height = 10
		$statsPanel.Add($this.InfoLabel)

		##########################################################
		# Buildings Panel
		##########################################################
		Write-Host "Creating buildings panel..."

		$buildingsPanel = New-Object Terminal.Gui.FrameView "Buildings"
		$buildingsPanel.X = [Terminal.Gui.Pos]::At($this.LeftWidth + 1); $buildingsPanel.Y = [Terminal.Gui.Pos]::At(0)
		$buildingsPanel.Width = $this.RightWidth; $buildingsPanel.Height = [Terminal.Gui.Dim]::Fill()

		# Get the building definitions.
		$buildingProperties = $buildings.PSObject.Properties | Where-Object { $_.Value -is [BuildingDefinition] }
		$totalBuildingCount = $buildingProperties.Count

		# Create a scrollable view for the buildings.
		$scrollView = New-Object Terminal.Gui.ScrollView
		$scrollView.AutoHideScrollBars = $true
		$scrollView.ShowVerticalScrollIndicator = $true
		$scrollView.ContentSize = [Terminal.Gui.Size]::new($this.RightWidth - 3, $totalBuildingCount * 4 - 1)
		$scrollView.Width = [Terminal.Gui.Dim]::Fill(); $scrollView.Height = [Terminal.Gui.Dim]::Fill()
		$yPos = 0
		for ($i = 0; $i -lt $totalBuildingCount; $i++) {
			$bd = $buildingProperties[$i].Value
			$panel = New-Object Terminal.Gui.FrameView; $panel.Height = 4; $panel.Width = [Terminal.Gui.Dim]::Fill()
			$panel.X = [Terminal.Gui.Pos]::At(1); $panel.Y = [Terminal.Gui.Pos]::At($yPos)
			$yPos += 4
			$shopInfo = (FormatShopItem $bd.Name $bd.Owned $bd.GetCurrentPrice().FormatCompact())#.GetCurrentPrice()
			$building = $bd.Setup($shopInfo)
			$panel.Add($building.OwnedLabel, $building.BuyButton, $building.InfoButton, $building.PriceLabel)
			$scrollView.Add($panel)
		}
		$buildingsPanel.Add($scrollView)

		##########################################################
		# Upgrades Panel
		##########################################################
		Write-Host "Creating upgrades panel..."

		$upgradesPanel = New-Object Terminal.Gui.FrameView "Upgrades"
		$upgradesPanel.X = [Terminal.Gui.Pos]::At($this.LeftWidth + $this.RightWidth + 2)
		$upgradesPanel.Y = [Terminal.Gui.Pos]::At(0)
		$upgradesPanel.Width = $this.RightWidth * 2
		$upgradesPanel.Height = [Terminal.Gui.Dim]::Fill()

		# Create a scrollable view for the upgrades.
		$scrollView = New-Object Terminal.Gui.ScrollView
		$scrollView.AutoHideScrollBars = $true
		$scrollView.ShowVerticalScrollIndicator = $true
		$scrollView.ContentSize = [Terminal.Gui.Size]::new($this.RightWidth * 2 - 3, ($totalBuildingCount * 14 * 4 + 19))
		$scrollView.Width = [Terminal.Gui.Dim]::Fill()
		$scrollView.Height = [Terminal.Gui.Dim]::Fill()
		$yPos = 0
		for ($i = 0; $i -lt $totalBuildingCount; $i++) {
			$bd = $buildingProperties[$i].Value
			# Get the building definitions.
			$upgradeProperties = $bd.Upgrades.PSObject.Properties | Where-Object { $_.Value -is [UpgradeDefinition] }
			$totalUpgradeCount = $upgradeProperties.Count
			for ($k = 0; $k -lt $totalUpgradeCount; $k++) {
				$upgrade = $upgradeProperties[$k].Value
				$upgrade.Panel = New-Object Terminal.Gui.FrameView
				$upgrade.Panel.Height = 4
				$upgrade.Panel.Width = [Terminal.Gui.Dim]::Fill()
				$upgrade.Panel.X = [Terminal.Gui.Pos]::At(1)
				$upgrade.Panel.Y = [Terminal.Gui.Pos]::At($yPos)
				$yPos += 4
				$label = New-Object Terminal.Gui.Label ("{0,-25}{1,6}" -f $upgrade.Name, $upgrade.RequiredCount)
				$label.X = [Terminal.Gui.Pos]::At(1)
				$label.Y = [Terminal.Gui.Pos]::At(0)
				Write-Host "Building: $($bd.Name) - Upgrade: $($upgrade.Name) ($k) - Cost: $($upgrade.BaseCost.FormatCompact())"
				$priceLabel = New-Object Terminal.Gui.Label ("{0,10} p" -f $upgrade.BaseCost.FormatCompact())
        		$priceLabel.X = 15; $priceLabel.Y = 1
				# $upgrade.Panel.Add($label)
				$upgrade.BuyButton = New-Object Terminal.Gui.Button "Buy"
				$upgrade.BuyButton.X = 1
				$upgrade.BuyButton.Y = 1
				$upgrade.InfoButton = New-Object Terminal.Gui.Button "?"
				$upgrade.InfoButton.X = 8
				$upgrade.InfoButton.Y = 1
				$upgrade.Panel.Add($label, $upgrade.BuyButton, $upgrade.InfoButton, $priceLabel)
				$scrollView.Add($upgrade.Panel)

				# Write-Host "Building: $($bd.Name) - Upgrade: $($upgrade.Name) ($k)"
				# if (-not $upgrade.IsPurchased -and $upgrade.UnlockCondition.Invoke($bd)) {
				# 	# Display the upgrade as available, or allow purchase.
				# 	Write-Host "Upgrade available: $($upgrade.Name) for $($upgrade.BaseCost) clicks."

				# 	# When purchasing (after verifying the player has enough clicks):
				# 	# e.g. if ($global:Data.Clicks -ge $upgrade.BaseCost) {
				# 	#          $global:Data.Clicks -= $upgrade.BaseCost
				# 	#          $upgrade.Effect.Invoke($global:BuildingData.Cursor)
				# 	#          $upgrade.IsPurchased = $true
				# 	#      }
				# }
			}
		}
		$upgradesPanel.Add($scrollView)

		# Add all panels to the main window.
		$this.MainWindow.Add($statsPanel)
		$this.MainWindow.Add($buildingsPanel)
		$this.MainWindow.Add($upgradesPanel)
	}
}
