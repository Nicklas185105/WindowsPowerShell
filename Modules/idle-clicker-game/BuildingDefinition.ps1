# The static definition for a building.
class BuildingDefinition {
    [string]$Name
    [decimal]$BaseCost
    [decimal]$Income
    [int]$Owned

    BuildingDefinition([string]$name, [decimal]$baseCost, [decimal]$income, [int]$owned) {
        $this.Name = $name
        $this.BaseCost = $baseCost
        $this.Income = $income
        $this.Owned = $owned
    }

    BuildingDefinition([string]$name, [decimal]$baseCost, [decimal]$income) {
        $this.Name = $name
        $this.BaseCost = $baseCost
        $this.Income = $income
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
        if ($global:Data.Clicks -ge $price){
            $global:Data.Clicks -= $price
            $this.Owned += 1
            $global:Data.UpdateIdleIncomeValue()
        }
    }
}

# All buildings
class BuildingData {
    [BuildingDefinition]$Cursor              = [BuildingDefinition]::new("Cursor",               15,                          0.1)
    [BuildingDefinition]$Grandma             = [BuildingDefinition]::new("Grandma",              100,                         1)
    [BuildingDefinition]$Farm                = [BuildingDefinition]::new("Farm",                 1100,                        8)
    [BuildingDefinition]$Mine                = [BuildingDefinition]::new("Mine",                 12000,                       47)
    [BuildingDefinition]$Factory             = [BuildingDefinition]::new("Factory",              130000,                      260)
    [BuildingDefinition]$Bank                = [BuildingDefinition]::new("Bank",                 1400000,                     1400)
    [BuildingDefinition]$Temple              = [BuildingDefinition]::new("Temple",               20000000,                    7800)
    [BuildingDefinition]$WizardTower         = [BuildingDefinition]::new("Wizard Tower",         330000000,                   44000)
    [BuildingDefinition]$Shipment            = [BuildingDefinition]::new("Shipment",             5100000000,                  260000)
    [BuildingDefinition]$AlchemyLab          = [BuildingDefinition]::new("Alchemy Lab",          75000000000,                 1600000)
    # [BuildingDefinition]$Portal              = [BuildingDefinition]::new("Portal",               1000000000000,               10000000)
    # [BuildingDefinition]$TimeMachine         = [BuildingDefinition]::new("Time Machine",         14000000000000,              65000000)
    # [BuildingDefinition]$AntimatterCondenser = [BuildingDefinition]::new("Antimatter Condenser", 170000000000000,             430000000)
    # [BuildingDefinition]$Prism               = [BuildingDefinition]::new("Prism",                2100000000000000,            2900000000)
    # [BuildingDefinition]$Chancemaker         = [BuildingDefinition]::new("Chancemaker",          26000000000000000,           21000000000)
    # [BuildingDefinition]$FractalEngine       = [BuildingDefinition]::new("Fractal Engine",       310000000000000000,          150000000000)
    # [BuildingDefinition]$JavascriptConsole   = [BuildingDefinition]::new("Javascript Console",   71000000000000000000,        1100000000000)
    # [BuildingDefinition]$Idleverse           = [BuildingDefinition]::new("Idleverse",            12000000000000000000000,     8300000000000)
    # [BuildingDefinition]$CortexBaker         = [BuildingDefinition]::new("Cortex Baker",         1900000000000000000000000,   64000000000000)
    # [BuildingDefinition]$You                 = [BuildingDefinition]::new("You",                  540000000000000000000000000, 510000000000000)

    BuildingData(){
        $this.Cursor              = [BuildingDefinition]::new("Cursor",               15,                          0.1)
        $this.Grandma             = [BuildingDefinition]::new("Grandma",              100,                         1)
        $this.Farm                = [BuildingDefinition]::new("Farm",                 1100,                        8)
        $this.Mine                = [BuildingDefinition]::new("Mine",                 12000,                       47)
        $this.Factory             = [BuildingDefinition]::new("Factory",              130000,                      260)
        $this.Bank                = [BuildingDefinition]::new("Bank",                 1400000,                     1400)
        $this.Temple              = [BuildingDefinition]::new("Temple",               20000000,                    7800)
        $this.WizardTower         = [BuildingDefinition]::new("Wizard Tower",         330000000,                   44000)
        $this.Shipment            = [BuildingDefinition]::new("Shipment",             5100000000,                  260000)
        $this.AlchemyLab          = [BuildingDefinition]::new("Alchemy Lab",          75000000000,                 1600000)
    }
    BuildingData([object]$owned){
        $this.Cursor              = [BuildingDefinition]::new("Cursor",               15,                          0.1, $owned.Cursor)
        $this.Grandma             = [BuildingDefinition]::new("Grandma",              100,                         1, $owned.Grandma)
        $this.Farm                = [BuildingDefinition]::new("Farm",                 1100,                        8, $owned.Farm)
        $this.Mine                = [BuildingDefinition]::new("Mine",                 12000,                       47, $owned.Mine)
        $this.Factory             = [BuildingDefinition]::new("Factory",              130000,                      260, $owned.Factory)
        $this.Bank                = [BuildingDefinition]::new("Bank",                 1400000,                     1400, $owned.Bank)
        $this.Temple              = [BuildingDefinition]::new("Temple",               20000000,                    7800, $owned.Temple)
        $this.WizardTower         = [BuildingDefinition]::new("Wizard Tower",         330000000,                   44000, $owned.WizardTower)
        $this.Shipment            = [BuildingDefinition]::new("Shipment",             5100000000,                  260000, $owned.Shipment)
        $this.AlchemyLab          = [BuildingDefinition]::new("Alchemy Lab",          75000000000,                 1600000, $owned.AlchemyLab)
    }
    
    [object] GetOwnedBuildings() {
        return @{
            Cursor = $this.Cursor.Owned
            Grandma = $this.Grandma.Owned
            Farm = $this.Farm.Owned
            Mine = $this.Mine.Owned
            Factory = $this.Factory.Owned
            Bank = $this.Bank.Owned
            Temple = $this.Temple.Owned
            WizardTower = $this.WizardTower.Owned
            Shipment = $this.Shipment.Owned
            AlchemyLab = $this.AlchemyLab.Owned
        }
    }
}
