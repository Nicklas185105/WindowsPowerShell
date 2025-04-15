# Load Terminal.Gui assembly (adjust the path accordingly)

using namespace Terminal.Gui

class GameScreen {
	[int]$LeftWidth = 32
	[int]$RightWidth = 35
	[string]$LeftBorder
	[string]$RightBorder

	[Window]$MainWindow

	# Keep references to UI Elements so we can update them later:
	[Button]$ClickButton
	[Label]$PointsLabel
	[Label]$IdleLabel
	[Label]$LastSaveLabel

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

	[string[]] FormatShopItem([string]$name, $owned, [string]$price) {
		# First line: name left-aligned in 25 characters, owned count right-aligned in 6 characters.
		$line1 = "{0,-25}{1,6}" -f $name, $owned
		# Second line: the cost, right-aligned in the full right column, with " p" appended.
		$line2 = "{0,$($this.RightWidth-1)}" -f ("{0} p" -f $price)
		return @($line1, $line2)
	}

	[string] GetDecimal([decimal]$number) {
		if ($number -lt 10) {
			return 1
		}
		else {
			return 0
		}
	}

	[string] FormatLargeNumber([decimal]$number) {
		if ($number -lt 1e3) {
			$decimals = $this.GetDecimal($number)
			return $number.ToString("F$decimals")
		}
		elseif ($number -lt 1e6) {
			$val = $number / 1e3
			$decimals = $this.GetDecimal($val)
			return ("{0:F$decimals}K" -f $val)
		}
		elseif ($number -lt 1e9) {
			$val = $number / 1e6
			$decimals = $this.GetDecimal($val)
			return ("{0:F$decimals}M" -f $val)
		}
		elseif ($number -lt 1e12) {
			$val = $number / 1e9
			$decimals = $this.GetDecimal($val)
			return ("{0:F$decimals}B" -f $val)
		}
		elseif ($number -lt 1e15) {
			$val = $number / 1e12
			$decimals = $this.GetDecimal($val)
			return ("{0:F$decimals}T" -f $val)
		}
		elseif ($number -lt 1e18) {
			$val = $number / 1e15
			$decimals = $this.GetDecimal($val)
			return ("{0:F$decimals}Qa" -f $val)
		}
		elseif ($number -lt 1e21) {
			$val = $number / 1e18
			$decimals = $this.GetDecimal($val)
			return ("{0:F$decimals}Qi" -f $val)
		}
		elseif ($number -lt 1e24) {
			$val = $number / 1e21
			$decimals = $this.GetDecimal($val)
			return ("{0:F$decimals}Sx" -f $val)
		}
		elseif ($number -lt 1e27) {
			$val = $number / 1e24
			$decimals = $this.GetDecimal($val)
			return ("{0:F$decimals}Sp" -f $val)
		}
		else {
			return $number.ToString("E1")
		}
	}

	[void] Update([object]$gameData, [object]$buildings) {
		# Update the labels with the new gameData values
		$pointsStr = $this.FormatLargeNumber($gameData.Clicks) + " p"
		$this.PointsLabel.Text = $this.CenterText($pointsStr, $this.LeftWidth)

		$idleStr = $this.FormatLargeNumber($gameData.IdleIncome) + " p/s"
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
		$leftPanel = New-Object FrameView "Stats"
		$leftPanel.X = 0
		$leftPanel.Y = 0
		$leftPanel.Width = $this.LeftWidth
		$leftPanel.Height = [Dim]::Fill()

		# Title and Name labels.
		$titleLabel = New-Object Label ($this.CenterText("Factory", $this.LeftWidth))
		$titleLabel.X = [Pos]::Center()
		$titleLabel.Y = 1
		$leftPanel.Add($titleLabel)

		$nameLabel = New-Object Label ($this.CenterText("Name", $this.LeftWidth))
		$nameLabel.X = [Pos]::Center()
		$nameLabel.Y = 2
		$leftPanel.Add($nameLabel)

		# Separator line.
		$sepLabel = New-Object Label ($this.LeftBorder)
		$sepLabel.X = [Pos]::Center()
		$sepLabel.Y = 3
		$leftPanel.Add($sepLabel)

		# Points
		$pointsStr = $this.FormatLargeNumber($gameData.Clicks) + " p"
		$this.PointsLabel = New-Object Label ($this.CenterText($pointsStr, $this.LeftWidth))
		$this.PointsLabel.X = [Pos]::Center()
		$this.PointsLabel.Y = 4
		$leftPanel.Add($this.PointsLabel)

		# Production rate
		$idleStr = $this.FormatLargeNumber($gameData.IdleIncome) + " p/s"
		$this.IdleLabel = New-Object Label ($this.CenterText($idleStr, $this.LeftWidth))
		$this.IdleLabel.X = [Pos]::Center()
		$this.IdleLabel.Y = 6
		$leftPanel.Add($this.IdleLabel)

		# Click button
		$this.ClickButton = New-Object Button "Click Me"
		$this.ClickButton.X = [Pos]::Center()
		$this.ClickButton.Y = 10
		$leftPanel.Add($this.ClickButton)

		# Keys and other text.
		$keysY = 15

		$labelKeys = New-Object Label ("Keys".PadRight($this.LeftWidth))
		$labelKeys.X = 0; $labelKeys.Y = $keysY
		$leftPanel.Add($labelKeys)
		$keysY++

		$labelSpace = New-Object Label ("$($global:Keys.Space.Name): Click".PadRight($this.LeftWidth))
		$labelSpace.X = 0; $labelSpace.Y = $keysY
		$leftPanel.Add($labelSpace)
		$keysY++

		$labelReset = New-Object Label ("$($global:Keys.R.Name): Reset game".PadRight($this.LeftWidth))
		$labelReset.X = 0; $labelReset.Y = $keysY
		$leftPanel.Add($labelReset)
		$keysY++

		$labelSave = New-Object Label ("$($global:Keys.S.Name): Save game".PadRight($this.LeftWidth))
		$labelSave.X = 0; $labelSave.Y = $keysY
		$leftPanel.Add($labelSave)
		$keysY++

		$labelLoad = New-Object Label ("$($global:Keys.L.Name): Load game".PadRight($this.LeftWidth))
		$labelLoad.X = 0; $labelLoad.Y = $keysY
		$leftPanel.Add($labelLoad)
		$keysY++

		$labelQuit = New-Object Label ("$($global:Keys.Escape.Name): Quit game".PadRight($this.LeftWidth))
		$labelQuit.X = 0; $labelQuit.Y = $keysY
		$leftPanel.Add($labelQuit)
		$keysY++

		$labelCtrlC = New-Object Label ("(don't do ctrl+C)".PadRight($this.LeftWidth))
		$labelCtrlC.X = 0; $labelCtrlC.Y = $keysY
		$leftPanel.Add($labelCtrlC)
		$keysY += 5

		# Last save info.
		$labelLastSave = New-Object Label ("Since last save".PadRight($this.LeftWidth))
		$labelLastSave.X = 0; $labelLastSave.Y = $keysY
		$leftPanel.Add($labelLastSave)
		$keysY++

		if ($gameData.LastSaveTime) {
			$elapsed = (Get-Date).Subtract([DateTime]::ParseExact($gameData.LastSaveTime, "HH:mm:ss", [System.Globalization.CultureInfo]::InvariantCulture))
			$timeStr = $elapsed.ToString("hh\:mm\:ss")
		}
		else {
			$timeStr = "Not saved yet"
		}
		$this.LastSaveLabel = New-Object Label ($timeStr.PadRight($this.LeftWidth))
		$this.LastSaveLabel.X = 0; $this.LastSaveLabel.Y = $keysY
		$leftPanel.Add($this.LastSaveLabel)

		##########################################################
		# Right Panels – Shop/Buildings (Two Columns)
		##########################################################
		# First right column panel
		$shopPanelLeft = New-Object FrameView "Shop Column 1"
		$shopPanelLeft.X = [Pos]::At($this.LeftWidth + 1)
		$shopPanelLeft.Y = 0
		$shopPanelLeft.Width = $this.RightWidth
		$shopPanelLeft.Height = [Dim]::Fill()

		# Second right column panel
		$shopPanelRight = New-Object FrameView "Shop Column 2"
		$shopPanelRight.X = [Pos]::At($this.LeftWidth + $this.RightWidth + 2)
		$shopPanelRight.Y = 0
		$shopPanelRight.Width = $this.RightWidth
		$shopPanelRight.Height = [Dim]::Fill()

		# Get the building definitions.
		$properties = $buildings.PSObject.Properties | Where-Object { $_.Value -is [BuildingDefinition] }
		$totalCount = $properties.Count
		$midpoint = [math]::Ceiling($totalCount / 2)

		# Fill the first shop column.
		$yPos = 1
		for ($i = 0; $i -lt $midpoint; $i++) {
			$bd = $properties[$i].Value
			$shopInfo = $this.FormatShopItem($bd.GetPrintName(), $bd.Owned, $this.FormatLargeNumber($bd.GetCurrentPrice()))
			$label1 = New-Object Label ($shopInfo[0])
			$label1.X = 1; $label1.Y = $yPos
			$shopPanelLeft.Add($label1)
			$yPos++
			$label2 = New-Object Label ($shopInfo[1])
			$label2.X = 1; $label2.Y = $yPos
			$shopPanelLeft.Add($label2)
			$yPos += 2
		}

		# Fill the second shop column.
		$yPos = 1
		for ($i = $midpoint; $i -lt $totalCount; $i++) {
			$bd = $properties[$i].Value
			$shopInfo = $this.FormatShopItem($bd.GetPrintName(), $bd.Owned, $this.FormatLargeNumber($bd.GetCurrentPrice()))
			$label1 = New-Object Label ($shopInfo[0])
			$label1.X = 1; $label1.Y = $yPos
			$shopPanelRight.Add($label1)
			$yPos++
			$label2 = New-Object Label ($shopInfo[1])
			$label2.X = 1; $label2.Y = $yPos
			$shopPanelRight.Add($label2)
			$yPos += 2
		}

		# Add all panels to the main window.
		$this.MainWindow.Add($leftPanel)
		$this.MainWindow.Add($shopPanelLeft)
		$this.MainWindow.Add($shopPanelRight)
		# $this.Top.Add($mainWin)

		# # --- Add a repeating timer to update dynamic UI elements ---
		# # This uses Terminal.Gui's MainLoop.AddTimer.
		# $updateInterval = [TimeSpan]::FromSeconds(1)  # Update every second.
		# $updateTimer = [Terminal.Gui.Application]::MainLoop.AddTimeout($updateInterval, {
		#     param($timer)
		#     # Use MainLoop.Invoke to schedule updates on the UI thread.
		#     $this.Update($global:Data, $global:BuildingData)
		#     return $true  # Return true to keep the timer active.
		# })

		# # Run the Terminal.Gui event loop.
		# [Terminal.Gui.Application]::Run($top)
		# [Terminal.Gui.Application]::Shutdown()
	}
}
