# Save the current game state to a JSON file.
function Save-IdleClickerGame {
    param(
        [string]$FilePath = "$env:USERPROFILE\IdleClickerGame.json"
    )
    # Record the current time as the last save time and convert it to an ISO 8601 string.
    $global:Data.LastSaveTime = (Get-Date).ToString("o")
    # Convert the state to JSON and write to the file
    $global:Data | ConvertTo-Json | Out-File -FilePath $FilePath -Encoding UTF8
    Write-Host "Game saved to $FilePath at $($global:Data.LastSaveTime)"
}

# Load the game state from a JSON file.
function Load-IdleClickerGame {
    param(
        [string]$FilePath = "$env:USERPROFILE\IdleClickerGame.json"
    )
    if (-not (Test-Path $FilePath)) {
        Write-Host "Save file not found: $FilePath"
        return
    }

    # Read the file and convert the JSON back to an object (ensure proper encoding)
    $loadedState = Get-Content -Path $FilePath -Raw -Encoding UTF8 | ConvertFrom-Json
    $global:Data.Clicks     = $loadedState.Clicks
    $global:Data.ClickValue = $loadedState.ClickValue
    if ($loadedState.LastSaveTime) {
        $global:Data.LastSaveTime = $loadedState.LastSaveTime.ToString()
    }
    # Convert the Buildings property from a PSCustomObject back to a hashtable
    $global:Data.Buildings = ConvertTo-Hashtable $loadedState.Buildings
    # Update IdleIncome using your calculation function (assuming it uses current building counts)
    $global:Data.IdleIncome = Get-IdleIncomeValue
    Write-Host "Game loaded from $FilePath. Total points: $($global:Data.Clicks)"
}

function ConvertTo-Hashtable {
    param (
        [Parameter(Mandatory=$true)]
        [psobject]$PSObject
    )
    $hash = @{}
    foreach ($property in $PSObject.PSObject.Properties) {
        $hash[$property.Name] = $property.Value
    }
    return $hash
}