using namespace Terminal.Gui
using namespace IdleClicker

class UpgradeDefinition {
	[string]$Name
	[int]$RequiredCount    # Minimum buildings owned to unlock the upgrade
	[Number]$BaseCost
	[string]$Description
	[int]$ID
	[ScriptBlock]$Effect   # Code to apply the upgrade effect
	[ScriptBlock]$UnlockCondition  # Optionally, a dynamic check; default can use RequiredCount
	[bool]$IsPurchased = $false

	[FrameView]$Panel
	[Button]$BuyButton
	[Button]$InfoButton

	UpgradeDefinition([string]$name, [int]$requiredCount, [Number]$baseCost, [string]$description, [int]$id, [ScriptBlock]$effect) {
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

class UpgradeData {
	[UpgradeDefinition] $Plain
	[UpgradeDefinition] $Berrylium
	[UpgradeDefinition] $Blueberrylium
	[UpgradeDefinition] $Chalcedhoney
	[UpgradeDefinition] $Buttergold
	[UpgradeDefinition] $Sugarmuck
	[UpgradeDefinition] $Jetmint
	[UpgradeDefinition] $Cherrysilver
	[UpgradeDefinition] $Hazelrald
	[UpgradeDefinition] $Mooncandy
	[UpgradeDefinition] $Astrofudge
	[UpgradeDefinition] $Alabascream
	[UpgradeDefinition] $Iridyum
	[UpgradeDefinition] $Glucosmium
	[UpgradeDefinition] $Glimmeringue
}