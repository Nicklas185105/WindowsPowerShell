using namespace IdleClicker

# Save the current game state to a JSON file.
function Save-IdleClickerGame {
    param(
        [string]$FilePath = "$env:USERPROFILE\IdleClickerGame.json"
    )
    # Record the current time as the last save time and convert it to an ISO 8601 string.
    $global:Data.LastSaveTime = (Get-Date).ToString("HH:mm:ss")
    # Convert the state to JSON and write to the file
    $data = @{
        Data = $global:Data.GetSaveableData()
        Owned = $global:BuildingData.GetOwnedBuildings()
    }
    $data | ConvertTo-Json | Out-File -FilePath $FilePath -Encoding UTF8
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

    Reset-IdleClickerGame

    # Read the file and convert the JSON back to an object (ensure proper encoding)
    $loadedState = Get-Content -Path $FilePath -Raw -Encoding UTF8 | ConvertFrom-Json
    $global:Data.SetSaveableData($loadedState.Data)
    if ($loadedState.Data.LastSaveTime) {
        $global:Data.LastSaveTime = $loadedState.Data.LastSaveTime.ToString()
    }
    # Convert the Buildings property from a PSCustomObject back to a hashtable
    # $global:BuildingData = [BuildingData]::new((ConvertTo-Hashtable $loadedState.Owned))
    $global:BuildingData.LoadOwnedBuildings((ConvertTo-Hashtable $loadedState.Owned))
    # Update IdleIncome using your calculation function (assuming it uses current building counts)
    $global:Data.UpdateIdleIncomeValue()
    Write-Host "Game loaded from $FilePath."
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