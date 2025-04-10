class GameScreen {
    [int]$LeftWidth = 24
    [int]$RightWidth = 26
    [string]$LeftBorder
    [string]$RightBorder

    GameScreen() {
        $this.LeftBorder  = "*" * $this.LeftWidth
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
        # First line: name left-aligned in 18 characters, owned count right-aligned in 6 characters.
        $line1 = "{0,-18}{1,6}" -f $name, $owned
        # Second line: the cost, right-aligned in the full right column, with " p" appended.
        $line2 = "{0,$($this.RightWidth)}" -f ("{0} p" -f $price)
        return @($line1, $line2)
    }

    [string] GetDecimal([decimal]$number) {
        if ($number -lt 10){
            return 1
        }
        else {
            return 0
        }
    }

    [string] FormatLargeNumber([decimal]$number) {
        if ($number -lt 1e3) {
            # No scaling needed. Here, we choose 1 decimal for numbers less than 10, else none.
            $decimals = $this.GetDecimal($number)
            return $number.ToString("F$decimals")
        }
        elseif ($number -lt 1e6) {
            # Scale to Thousands
            $val = $number / 1e3
            $decimals = $this.GetDecimal($val)
            return ("{0:F$decimals}K" -f $val)
        }
        elseif ($number -lt 1e9) {
            # Scale to Millions
            $val = $number / 1e6
            $decimals = $this.GetDecimal($val)
            return ("{0:F$decimals}M" -f $val)
        }
        elseif ($number -lt 1e12) {
            # Scale to Billions
            $val = $number / 1e9
            $decimals = $this.GetDecimal($val)
            return ("{0:F$decimals}B" -f $val)
        }
        elseif ($number -lt 1e15) {
            # Scale to Trillions
            $val = $number / 1e12
            $decimals = $this.GetDecimal($val)
            return ("{0:F$decimals}T" -f $val)
        }
        elseif ($number -lt 1e18) {
            # Scale to Quadrillions
            $val = $number / 1e15
            $decimals = $this.GetDecimal($val)
            return ("{0:F$decimals}Qa" -f $val)
        }
        elseif ($number -lt 1e21) {
            # Scale to Quintillions
            $val = $number / 1e18
            $decimals = $this.GetDecimal($val)
            return ("{0:F$decimals}Qi" -f $val)
        }
        elseif ($number -lt 1e24) {
            # Scale to Sextillions
            $val = $number / 1e21
            $decimals = $this.GetDecimal($val)
            return ("{0:F$decimals}Sx" -f $val)
        }
        elseif ($number -lt 1e27) {
            # Scale to Septillions
            $val = $number / 1e24
            $decimals = $this.GetDecimal($val)
            return ("{0:F$decimals}Sp" -f $val)
        }
        else {
            # For extremely high numbers, use scientific notation.
            return $number.ToString("E1")
        }
    }

    [void] Show([object]$gameData, [object]$buildings) {
        # $gameData should be an instance (or equivalent hashtable) of your Idle game data (e.g. $global:Data).
        # Build the left column lines.
        $leftLines = New-Object System.Collections.Generic.List[string]
        $leftLines.Add($this.LeftBorder)                                               # Top border
        $leftLines.Add($this.CenterText("Factory", $this.LeftWidth))                   # Title (example)
        $leftLines.Add($this.CenterText("Name", $this.LeftWidth))                      # Subtitle (your chosen name)
        $leftLines.Add($this.LeftBorder)                                                # Separator
        $pointsStr = $this.FormatLargeNumber($gameData.Clicks) + " p"
        $leftLines.Add($this.CenterText($pointsStr, $this.LeftWidth))                  # Points
        $leftLines.Add(" " * $this.LeftWidth)                                           # Blank line
        $idleStr = $this.FormatLargeNumber($gameData.IdleIncome) + " p/s"
        $leftLines.Add($this.CenterText($idleStr, $this.LeftWidth))                    # Production rate
        $leftLines.Add(" " * $this.LeftWidth)                                           # Blank line
        $leftLines.Add(" " * $this.LeftWidth)                                           # Blank line
        $leftLines.Add(" " * $this.LeftWidth)                                           # Blank line
        $leftLines.Add("Keys".PadRight($this.LeftWidth))
        $leftLines.Add("Space: Click".PadRight($this.LeftWidth))
        $leftLines.Add("R: Reset game".PadRight($this.LeftWidth))
        $leftLines.Add("S: Save game".PadRight($this.LeftWidth))
        $leftLines.Add("L: Load game".PadRight($this.LeftWidth))
        $leftLines.Add("Escape: Quit game".PadRight($this.LeftWidth))
        $leftLines.Add("(don't do ctrl+C)".PadRight($this.LeftWidth))
        $leftLines.Add(" " * $this.LeftWidth)
        $leftLines.Add(" " * $this.LeftWidth)
        $leftLines.Add("Since last save".PadRight($this.LeftWidth))
        if ($gameData.LastSaveTime) {
            $elapsed = (Get-Date).Subtract([DateTime]::ParseExact($gameData.LastSaveTime, "o", [System.Globalization.CultureInfo]::InvariantCulture))
            $timeStr = $elapsed.ToString("hh\:mm\:ss")
        }
        else {
            $timeStr = "Not saved yet".PadRight($this.LeftWidth)
        }
        $leftLines.Add($timeStr.PadRight($this.LeftWidth))
        $leftLines.Add($this.LeftBorder)

        # Build the right column (shop) lines.
        $rightLines = New-Object System.Collections.Generic.List[string]
        $rightLines.Add($this.RightBorder)  # Top border

        foreach ($property in $buildings.PSObject.Properties){
            $bd = $property.Value
            $lines = $this.FormatShopItem($bd.Name, $bd.Owned, $this.FormatLargeNumber($bd.GetCurrentPrice()))
            $rightLines.Add($lines[0])
            $rightLines.Add($lines[1])
            $rightLines.Add($this.RightBorder)
        }

        # Determine the maximum number of lines for proper alignment.
        $maxLines = [Math]::Max($leftLines.Count, $rightLines.Count)
        Clear-Host
        for ($i = 0; $i -lt $maxLines; $i++) {
            $leftText = if ($i -lt $leftLines.Count) { $leftLines[$i] } else { " " * $this.LeftWidth }
            $rightText = if ($i -lt $rightLines.Count) { $rightLines[$i] } else { " " * $this.RightWidth }
            Write-Host ("| {0,-$($this.LeftWidth)} | {1,-$($this.RightWidth)} |" -f $leftText, $rightText)
        }
    }
}