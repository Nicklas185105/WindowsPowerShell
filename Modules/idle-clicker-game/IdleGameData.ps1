class IdleGameData {
	[Number]$Clicks = [Number]::new("0")
	[Number]$IdleIncome = [Number]::new("0")
	[Number]$ClickValue = [Number]::new("1")
	[string]$LastSaveTime = $null

	IdleGameData() {}

	[void] UpdateIdleIncomeValue() {
		$totalIncome = [Number]::new("0")
		foreach ($property in $global:BuildingData.PSObject.Properties) {
			$totalIncome += $property.Value.GetCurrentIncome()
		}
		$this.IdleIncome = $totalIncome
	}
}