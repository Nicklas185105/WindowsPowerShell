using namespace IdleClicker

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

	[object] GetSaveableData() {
		return [PSCustomObject]@{
			Clicks = $this.Clicks.ToString()
			LastSaveTime = $this.LastSaveTime
		}
	}

	[void] SetSaveableData([PSCustomObject]$data) {
		$this.Clicks = [Number]::new($data.Clicks.ToString())
		if ($data.LastSaveTime) {
			$this.LastSaveTime = $data.LastSaveTime.ToString()
		}
	}
}