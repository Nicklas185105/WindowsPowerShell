function Get-IdleIncomeValue {
    $curserIncome = $global:Data.Buildings.Cursor * $global:Buildings.Cursor.Income
    $grandmaIncome = $global:Data.Buildings.Grandma * $global:Buildings.Grandma.Income
    $farmIncome = $global:Data.Buildings.Farm * $global:Buildings.Farm.Income
    $mineIncome = $global:Data.Buildings.Mine * $global:Buildings.Mine.Income
    $factoryIncome = $global:Data.Buildings.Factory * $global:Buildings.Factory.Income
    $bankIncome = $global:Data.Buildings.Bank * $global:Buildings.Bank.Income
    $templeIncome = $global:Data.Buildings.Temple * $global:Buildings.Temple.Income
    $wizardTowerIncome = $global:Data.Buildings.WizardTower * $global:Buildings.WizardTower.Income

    return ($curserIncome + $grandmaIncome + $farmIncome + $mineIncome + $factoryIncome + $bankIncome + $templeIncome + $wizardTowerIncome)
}

function Get-BuildingPrice {
    param(
        [string]$buildingName
    )
    # Retrieve the base cost from the building definitions.
    $baseCost = $global:Buildings[$buildingName].Cost
    # Get the current number of buildings owned.
    $owned = $global:Data.Buildings[$buildingName]

    # For now, assume the free count is zero.
    $free = 0
    # Calculate the price using the provided formula.
    $price = $baseCost * [math]::Pow(1.15, ($owned - $free))
    return [math]::Ceiling($price)
}

function Buy-Building {
    param(
        [int] $Building
    )

    Write-Host "Buying a Building" + $Building

    switch ($Building) {
        1 { 
            if ($global:Data.Clicks -ge (Get-BuildingPrice "Cursor")) {
                $global:Data.Clicks -= Get-BuildingPrice "Cursor"
                $global:Data.Buildings.Cursor += 1
            }
        }
        2 {
            if ($global:Data.Clicks -ge (Get-BuildingPrice "Grandma")) {
                $global:Data.Clicks -= Get-BuildingPrice "Grandma"
                $global:Data.Buildings.Grandma += 1
            }
        }
        3 {
            if ($global:Data.Clicks -ge (Get-BuildingPrice "Farm")) {
                $global:Data.Clicks -= Get-BuildingPrice "Farm"
                $global:Data.Buildings.Farm += 1
            }
        }
        4 {
            if ($global:Data.Clicks -ge (Get-BuildingPrice "Mine")) {
                $global:Data.Clicks -= Get-BuildingPrice "Mine"
                $global:Data.Buildings.Mine += 1
            }
        }
        5 {
            if ($global:Data.Clicks -ge (Get-BuildingPrice "Factory")) {
                $global:Data.Clicks -= Get-BuildingPrice "Factory"
                $global:Data.Buildings.Factory += 1
            }
        }
        6 {
            if ($global:Data.Clicks -ge (Get-BuildingPrice "Bank")) {
                $global:Data.Clicks -= Get-BuildingPrice "Bank"
                $global:Data.Buildings.Bank += 1
            }
        }
        7 {
            if ($global:Data.Clicks -ge (Get-BuildingPrice "Temple")) {
                $global:Data.Clicks -= Get-BuildingPrice "Temple"
                $global:Data.Buildings.Temple += 1
            }
        }
        8 {
            if ($global:Data.Clicks -ge (Get-BuildingPrice "WizardTower")) {
                $global:Data.Clicks -= Get-BuildingPrice "WizardTower"
                $global:Data.Buildings.WizardTower += 1
            }
        }
    }

    $global:Data.IdleIncome = Get-IdleIncomeValue
}