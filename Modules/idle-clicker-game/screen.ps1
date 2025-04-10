# Helper: Center text in a field of a given width.
function Center-Text {
    param (
        [string]$Text,
        [int]$Width
    )
    $pad = $Width - $Text.Length
    if ($pad -le 0) { return $Text }
    $leftPad = [math]::Floor($pad / 2)
    $rightPad = [math]::Ceiling($pad / 2)
    return (" " * $leftPad) + $Text + (" " * $rightPad)
}

function Show-GameScreen {
    # Define column widths.
    $leftWidth = 24
    $rightWidth = 26

    # Define border strings for each column.
    $leftBorder  = "*" * ($leftWidth)
    $rightBorder = "*" * ($rightWidth)

    # --- Left Column ---
    # Build left column lines using persistent data from $global:Data.
    $leftLines = @()
    $leftLines += $leftBorder                               # Top border
    $leftLines += Center-Text "Factory" $leftWidth         # Title (for example)
    $leftLines += Center-Text "Name" $leftWidth            # Subtitle (your chosen name)
    $leftLines += $leftBorder                              # Separator
    $leftLines += Center-Text ("{0:F0} p" -f $global:Data.Clicks) $leftWidth  # Points
    $leftLines += " " * $leftWidth                         # Blank line
    $leftLines += Center-Text ("{0:F1} p/s" -f $global:Data.IdleIncome) $leftWidth # Production rate
    $leftLines += " " * $leftWidth                         # Blank line
    $leftLines += " " * $leftWidth                         # Blank line
    $leftLines += " " * $leftWidth                         # Blank line
    $leftLines += "Since last save".PadRight($leftWidth)   # Label for last save time
    
    if ($global:Data.LastSaveTime) {
        # Parse the saved ISO string and calculate elapsed time.
        $elapsed = (Get-Date).Subtract([DateTime]::ParseExact($global:Data.LastSaveTime, "o", [System.Globalization.CultureInfo]::InvariantCulture))
        $timeStr = $elapsed.ToString("hh\:mm\:ss")
    }
    else {
        $timeStr = "Not saved yet".PadRight($leftWidth)
    }
    $leftLines += $timeStr.PadRight($leftWidth)            # Elapsed time line
    $leftLines += $leftBorder                              # Bottom border

    # --- Right Column (Shop) ---
    # Define a helper to format each shop item.
    function Format-ShopItem($name, $owned, $price) {
        # First line: item name (left-aligned in 18 characters) and owned count (right-aligned in 6 characters)
        $line1 = "{0,-18}{1,6}" -f $name, $owned
        # Second line: cost right-aligned in the full field, appended with " p"
        $line2 = "{0,${rightWidth}}" -f ("{0} p" -f $price)
        return @($line1, $line2)
    }
    
    # Prepare shop item lines using dynamic prices computed with Get-BuildingPrice.
    $rightLines = @()
    $rightLines += $rightBorder  # Top border
    # Cursor shop item
    $cursorPrice = Get-BuildingPrice "Cursor"
    $cursorLines = Format-ShopItem "Cursor (1)" $global:Data.Buildings.Cursor $cursorPrice
    $rightLines += $cursorLines[0]
    $rightLines += $cursorLines[1]
    $rightLines += $rightBorder  # Separator
    # Grandma shop item
    $grandmaPrice = Get-BuildingPrice "Grandma"
    $grandmaLines = Format-ShopItem "Grandma (2)" $global:Data.Buildings.Grandma $grandmaPrice
    $rightLines += $grandmaLines[0]
    $rightLines += $grandmaLines[1]
    $rightLines += $rightBorder  # Separator
    # Farm shop item
    $farmPrice = Get-BuildingPrice "Farm"
    $farmLines = Format-ShopItem "Farm (3)" $global:Data.Buildings.Farm $farmPrice
    $rightLines += $farmLines[0]
    $rightLines += $farmLines[1]
    $rightLines += $rightBorder  # Separator
    # Mine shop item
    $minePrice = Get-BuildingPrice "Mine"
    $mineLines = Format-ShopItem "Mine (4)" $global:Data.Buildings.Mine $minePrice
    $rightLines += $mineLines[0]
    $rightLines += $mineLines[1]
    $rightLines += $rightBorder  # Bottom border
    # Factory shop item
    $factoryPrice = Get-BuildingPrice "Factory"
    $factoryLines = Format-ShopItem "Factory (5)" $global:Data.Buildings.Factory $factoryPrice
    $rightLines += $factoryLines[0]
    $rightLines += $factoryLines[1]
    $rightLines += $rightBorder  # Bottom border
    # Bank shop item
    $bankPrice = Get-BuildingPrice "Bank"
    $bankLines = Format-ShopItem "Bank (6)" $global:Data.Buildings.Bank $bankPrice
    $rightLines += $bankLines[0]
    $rightLines += $bankLines[1]
    $rightLines += $rightBorder  # Bottom border
    # Temple shop item
    $templePrice = Get-BuildingPrice "Temple"
    $templeLines = Format-ShopItem "Temple (7)" $global:Data.Buildings.Temple $templePrice
    $rightLines += $templeLines[0]
    $rightLines += $templeLines[1]
    $rightLines += $rightBorder  # Bottom border
    # Wizard Tower shop item
    $wizardTowerPrice = Get-BuildingPrice "WizardTower"
    $wizardTowerLines = Format-ShopItem "Wizard Tower (8)" $global:Data.Buildings.WizardTower $wizardTowerPrice
    $rightLines += $wizardTowerLines[0]
    $rightLines += $wizardTowerLines[1]
    $rightLines += $rightBorder  # Bottom border

    # --- Print the Two Columns ---
    $maxLines = [Math]::Max($leftLines.Count, $rightLines.Count)
    Clear-Host
    for ($i = 0; $i -lt $maxLines; $i++) {
        $leftText = if ($i -lt $leftLines.Count) { $leftLines[$i] } else { " " * $leftWidth }
        $rightText = if ($i -lt $rightLines.Count) { $rightLines[$i] } else { " " * $rightWidth }
        Write-Host ("| {0,-$leftWidth} | {1,-$rightWidth} |" -f $leftText, $rightText)
    }
}

