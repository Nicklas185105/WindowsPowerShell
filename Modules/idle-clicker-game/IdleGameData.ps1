class IdleGameData {
    [decimal]$Clicks = 0
    [decimal]$IdleIncome = 0
    [decimal]$ClickValue = 1
    [string]$LastSaveTime = $null

    IdleGameData() {}

    [void] UpdateIdleIncomeValue() {
        $totalIncome = [decimal]0
        foreach ($property in $global:BuildingData.PSObject.Properties) {
            $totalIncome += $property.Value.GetCurrentIncome()
        }
        $this.IdleIncome = $totalIncome
    }
}