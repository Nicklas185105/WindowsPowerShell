using namespace Terminal.Gui

class UpgradeDefinition {
	[string]$Name
	[int]$RequiredCount    # Minimum buildings owned to unlock the upgrade
	[decimal]$BaseCost
	[string]$Description
	[int]$ID
	[ScriptBlock]$Effect   # Code to apply the upgrade effect
	[ScriptBlock]$UnlockCondition  # Optionally, a dynamic check; default can use RequiredCount
	[bool]$IsPurchased = $false

	[FrameView]$Panel
	[Button]$BuyButton
	[Button]$InfoButton

	UpgradeDefinition([string]$name, [int]$requiredCount, [decimal]$baseCost, [string]$description, [int]$id, [ScriptBlock]$effect) {
		$this.Name = $name
		$this.RequiredCount = $requiredCount
		$this.BaseCost = $baseCost
		$this.Description = $description
		$this.ID = $id
		$this.Effect = $effect
		# Default unlock condition: building.Owned is at least the required count.
		$this.UnlockCondition = { param($building) return $building.Owned -ge $this.RequiredCount }
	}

	[void] Buy([object]$building) {
		if ($global:Data.Clicks -ge $this.BaseCost) {
			$global:Data.Clicks -= $this.BaseCost
			$this.Effect.Invoke($building)
			$this.IsPurchased = $true
		}
	}
}