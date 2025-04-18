using namespace Terminal.Gui

class BuildingDefinition {
	[string]$Name
	[decimal]$BaseCost
	[decimal]$Income
	[int]$Owned
	[KeyDefinition]$Key
	[UpgradeDefinition[]]$Upgrades

	[Label]$PriceLabel
	[Label]$OwnedLabel
	[Button]$BuyButton
	[Button]$InfoButton

	BuildingDefinition([string]$name, [decimal]$baseCost, [decimal]$income, [KeyDefinition]$key, [int]$owned) {
		$this.Name = $name
		$this.BaseCost = $baseCost
		$this.Income = $income
		$this.Key = $key
		$this.Owned = $owned
	}

	BuildingDefinition([string]$name, [decimal]$baseCost, [decimal]$income, [KeyDefinition]$key) {
		$this.Name = $name
		$this.BaseCost = $baseCost
		$this.Income = $income
		$this.Key = $key
		$this.Owned = 0
	}

	[decimal] GetCurrentPrice() {
		return $this.GetCurrentPrice(0)
	}

	[decimal] GetCurrentPrice([int]$free) {
		# Formula: Price = BaseCost × 1.15^(M - free), rounded up.
		$price = $this.BaseCost * [math]::Pow(1.15, ($this.Owned - $free))
		return [math]::Ceiling($price)
	}

	[decimal] GetCurrentIncome() {
		return $this.Owned * $this.Income;
	}

	[void] BuyBuilding() {
		$price = $this.GetCurrentPrice()
		if ($global:Data.Clicks -ge $price) {
			$global:Data.Clicks -= $price
			$this.Owned += 1
			$global:Data.UpdateIdleIncomeValue()
			$shopInfo = (FormatShopItem $this.Name $this.Owned (FormatLargeNumber $this.GetCurrentPrice()))
			$this.OwnedLabel.Text = ($shopInfo[0])
			$this.PriceLabel.Text = ($shopInfo[1])
		}
	}

	[string] GetPrintName() {
		return "$($this.Name)"
	}

	[BuildingDefinition] Setup([string[]]$shopInfo) {
		$this.OwnedLabel = New-Object Label ($shopInfo[0])
		$this.OwnedLabel.X = 1; $this.OwnedLabel.Y = 0
		$this.PriceLabel = New-Object Label ($shopInfo[1])
		$this.PriceLabel.X = 15; $this.PriceLabel.Y = 1
		$this.BuyButton = New-Object Button "Buy"
		$this.BuyButton.X = 1
		$this.BuyButton.Y = 1
		$this.InfoButton = New-Object Button "?"
		$this.InfoButton.X = 8
		$this.InfoButton.Y = 1
		return $this
	}

	[string] GetInfo() {
		$info = @()
		$info += "Name: {0,-26}" -f $this.Name
		$info += "Base Income: {0,-19}" -f (FormatLargeNumber $this.Income)
		$info += "Total Income: {0,-18}" -f (FormatLargeNumber $this.GetCurrentIncome())
		if ($global:Data.IdleIncome -gt 0) {
			$percentage = [math]::Round(($this.GetCurrentIncome() / $global:Data.IdleIncome) * 100, 2)
			$info += "Percentage of Total Income: $($percentage)%"
		}

		return $info
	}
}

# All buildings
class BuildingData {
	[BuildingDefinition]$Cursor              #= [BuildingDefinition]::new("Cursor",               15,                          0.1, $global:Keys.D1)
	[BuildingDefinition]$Grandma             #= [BuildingDefinition]::new("Grandma",              100,                         1, $global:Keys.D2)
	[BuildingDefinition]$Farm                #= [BuildingDefinition]::new("Farm",                 1100,                        8, $global:Keys.D3)
	[BuildingDefinition]$Mine                #= [BuildingDefinition]::new("Mine",                 12000,                       47, $global:Keys.D4)
	[BuildingDefinition]$Factory             #= [BuildingDefinition]::new("Factory",              130000,                      260, $global:Keys.D5)
	[BuildingDefinition]$Bank                #= [BuildingDefinition]::new("Bank",                 1400000,                     1400, $global:Keys.D6)
	[BuildingDefinition]$Temple              #= [BuildingDefinition]::new("Temple",               20000000,                    7800, $global:Keys.D7)
	[BuildingDefinition]$WizardTower         #= [BuildingDefinition]::new("Wizard Tower",         330000000,                   44000, $global:Keys.D8)
	[BuildingDefinition]$Shipment            #= [BuildingDefinition]::new("Shipment",             5100000000,                  260000, $global:Keys.D9)
	[BuildingDefinition]$AlchemyLab          #= [BuildingDefinition]::new("Alchemy Lab",          75000000000,                 1600000, $global:Keys.D0)
	[BuildingDefinition]$Portal              #= [BuildingDefinition]::new("Portal",               1000000000000,               10000000, $global:Keys.N1)
	[BuildingDefinition]$TimeMachine         #= [BuildingDefinition]::new("Time Machine",         14000000000000,              65000000, $global:Keys.N2)
	[BuildingDefinition]$AntimatterCondenser #= [BuildingDefinition]::new("Antimatter Condenser", 170000000000000,             430000000, $global:Keys.N3)
	[BuildingDefinition]$Prism               #= [BuildingDefinition]::new("Prism",                2100000000000000,            2900000000, $global:Keys.N4)
	[BuildingDefinition]$Chancemaker         #= [BuildingDefinition]::new("Chancemaker",          26000000000000000,           21000000000, $global:Keys.N5)
	[BuildingDefinition]$FractalEngine       #= [BuildingDefinition]::new("Fractal Engine",       310000000000000000,          150000000000, $global:Keys.N6)
	[BuildingDefinition]$JavascriptConsole   #= [BuildingDefinition]::new("Javascript Console",   71000000000000000000,        1100000000000, $global:Keys.N7)
	[BuildingDefinition]$Idleverse           #= [BuildingDefinition]::new("Idleverse",            12000000000000000000000,     8300000000000, $global:Keys.N8)
	[BuildingDefinition]$CortexBaker         #= [BuildingDefinition]::new("Cortex Baker",         1900000000000000000000000,   64000000000000, $global:Keys.N9)
	[BuildingDefinition]$You                 #= [BuildingDefinition]::new("You",                  540000000000000000000000000, 510000000000000, $global:Keys.N0)

	# BuildingData(){}

	# BuildingData([object]$owned){
	#     $this.Cursor              = [BuildingDefinition]::new("Cursor",               15,                          0.1, $global:Keys.D1, $owned.Cursor)
	#     $this.Grandma             = [BuildingDefinition]::new("Grandma",              100,                         1, $global:Keys.D2, $owned.Grandma)
	#     $this.Farm                = [BuildingDefinition]::new("Farm",                 1100,                        8, $global:Keys.D3, $owned.Farm)
	#     $this.Mine                = [BuildingDefinition]::new("Mine",                 12000,                       47, $global:Keys.D4, $owned.Mine)
	#     $this.Factory             = [BuildingDefinition]::new("Factory",              130000,                      260, $global:Keys.D5, $owned.Factory)
	#     $this.Bank                = [BuildingDefinition]::new("Bank",                 1400000,                     1400, $global:Keys.D6, $owned.Bank)
	#     $this.Temple              = [BuildingDefinition]::new("Temple",               20000000,                    7800, $global:Keys.D7, $owned.Temple)
	#     $this.WizardTower         = [BuildingDefinition]::new("Wizard Tower",         330000000,                   44000, $global:Keys.D8, $owned.WizardTower)
	#     $this.Shipment            = [BuildingDefinition]::new("Shipment",             5100000000,                  260000, $global:Keys.D9, $owned.Shipment)
	#     $this.AlchemyLab          = [BuildingDefinition]::new("Alchemy Lab",          75000000000,                 1600000, $global:Keys.D0, $owned.AlchemyLab)
	#     $this.Portal              = [BuildingDefinition]::new("Portal",               1000000000000,               10000000, $global:Keys.N1, $owned.Portal)
	#     $this.TimeMachine         = [BuildingDefinition]::new("Time Machine",         14000000000000,              65000000, $global:Keys.N2, $owned.TimeMachine)
	#     $this.AntimatterCondenser = [BuildingDefinition]::new("Antimatter Condenser", 170000000000000,             430000000, $global:Keys.N3, $owned.AntimatterCondenser)
	#     $this.Prism               = [BuildingDefinition]::new("Prism",                2100000000000000,            2900000000, $global:Keys.N4, $owned.Prism)
	#     $this.Chancemaker         = [BuildingDefinition]::new("Chancemaker",          26000000000000000,           21000000000, $global:Keys.N5, $owned.Chancemaker)
	#     $this.FractalEngine       = [BuildingDefinition]::new("Fractal Engine",       310000000000000000,          150000000000, $global:Keys.N6, $owned.FractalEngine)
	#     $this.JavascriptConsole   = [BuildingDefinition]::new("Javascript Console",   71000000000000000000,        1100000000000, $global:Keys.N7, $owned.JavascriptConsole)
	#     $this.Idleverse           = [BuildingDefinition]::new("Idleverse",            12000000000000000000000,     8300000000000, $global:Keys.N8, $owned.Idleverse)
	#     $this.CortexBaker         = [BuildingDefinition]::new("Cortex Baker",         1900000000000000000000000,   64000000000000, $global:Keys.N9, $owned.CortexBaker)
	#     $this.You                 = [BuildingDefinition]::new("You",                  540000000000000000000000000, 510000000000000, $global:Keys.N0, $owned.You)
	# }

	[object] GetOwnedBuildings() {
		return @{
			Cursor              = $this.Cursor.Owned
			Grandma             = $this.Grandma.Owned
			Farm                = $this.Farm.Owned
			Mine                = $this.Mine.Owned
			Factory             = $this.Factory.Owned
			Bank                = $this.Bank.Owned
			Temple              = $this.Temple.Owned
			WizardTower         = $this.WizardTower.Owned
			Shipment            = $this.Shipment.Owned
			AlchemyLab          = $this.AlchemyLab.Owned
			Portal              = $this.Portal.Owned
			TimeMachine         = $this.TimeMachine.Owned
			AntimatterCondenser = $this.AntimatterCondenser.Owned
			Prism               = $this.Prism.Owned
			Chancemaker         = $this.Chancemaker.Owned
			FractalEngine       = $this.FractalEngine.Owned
			JavascriptConsole   = $this.JavascriptConsole.Owned
			Idleverse           = $this.Idleverse.Owned
			CortexBaker         = $this.CortexBaker.Owned
			You                 = $this.You.Owned
		}
	}

	[void] LoadOwnedBuildings([object]$owned) {
		$this.Cursor.Owned = $owned.Cursor
		$this.Grandma.Owned = $owned.Grandma
		$this.Farm.Owned = $owned.Farm
		$this.Mine.Owned = $owned.Mine
		$this.Factory.Owned = $owned.Factory
		$this.Bank.Owned = $owned.Bank
		$this.Temple.Owned = $owned.Temple
		$this.WizardTower.Owned = $owned.WizardTower
		$this.Shipment.Owned = $owned.Shipment
		$this.AlchemyLab.Owned = $owned.AlchemyLab
		$this.Portal.Owned = $owned.Portal
		$this.TimeMachine.Owned = $owned.TimeMachine
		$this.AntimatterCondenser.Owned = $owned.AntimatterCondenser
		$this.Prism.Owned = $owned.Prism
		$this.Chancemaker.Owned = $owned.Chancemaker
		$this.FractalEngine.Owned = $owned.FractalEngine
		$this.JavascriptConsole.Owned = $owned.JavascriptConsole
		$this.Idleverse.Owned = $owned.Idleverse
		$this.CortexBaker.Owned = $owned.CortexBaker
		$this.You.Owned = $owned.You
	}
}