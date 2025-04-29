using namespace IdleClicker

$global:BuildingData.Mine = [BuildingDefinition]::new("Mine", [Number]::new("$([bigint]::Pow(10,4) + [bigint]::Pow(10,3) * 2)"), [Number]::new("47.0"), $global:Keys.D4)
$global:BuildingData.Mine.Upgrades = [UpgradeData]::new()

# — Mine efficiency upgrades (×2) —

$global:BuildingData.Mine.Upgrades.Plain = [UpgradeDefinition]::new(
    "Sugar gas",
    1, # Own 1 mine
    [Number]::new("$([bigint]::Pow(10,5) + [bigint]::Pow(10,4) * 2)"), # Base price
    "Mines are twice as efficient.",
    16, # ID
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Mine.Upgrades.Berrylium = [UpgradeDefinition]::new(
    "Megadrill",
    5,
    [Number]::new("$([bigint]::Pow(10,5)  * 6)"),
    "Mines are twice as efficient.",
    17,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Mine.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
    "Ultradrill",
    25,
    [Number]::new("$([bigint]::Pow(10,6)  * 6)"),
    "Mines are twice as efficient.",
    18,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Mine.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
    "Ultimadrill",
    50,
    [Number]::new("$([bigint]::Pow(10,8)  * 6)"),
    "Mines are twice as efficient.",
    47,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Mine.Upgrades.Buttergold = [UpgradeDefinition]::new(
    "H-bomb mining",
    100,
    [Number]::new("$([bigint]::Pow(10,10)  * 6)"),
    "Mines are twice as efficient.",
    113,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Mine.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
    "Coreforge",
    150,
    [Number]::new("$([bigint]::Pow(10,12)  * 6)"),
    "Mines are twice as efficient.",
    195,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Mine.Upgrades.Jetmint = [UpgradeDefinition]::new(
    "Planetsplitters",
    200,
    [Number]::new("$([bigint]::Pow(10,15)  * 6)"),
    "Mines are twice as efficient.",
    296,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Mine.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
    "Canola oil wells",
    250,
    [Number]::new("$([bigint]::Pow(10,18)  * 6)"),
    "Mines are twice as efficient.",
    309,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Mine.Upgrades.Hazelrald = [UpgradeDefinition]::new(
    "Mole people",
    300,
    [Number]::new("$([bigint]::Pow(10,21)  * 6)"),
    "Mines are twice as efficient.",
    430,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Mine.Upgrades.Mooncandy = [UpgradeDefinition]::new(
    "Mine canaries",
    350,
    [Number]::new("$([bigint]::Pow(10,24)  * 6)"),
    "Mines are twice as efficient.",
    482,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Mine.Upgrades.Astrofudge = [UpgradeDefinition]::new(
    "Bore again",
    400,
    [Number]::new("$([bigint]::Pow(10,28)  * 6)"),
    "Mines are twice as efficient.",
    508,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Mine.Upgrades.Alabascream = [UpgradeDefinition]::new(
    "Air mining",
    450,
    [Number]::new("$([bigint]::Pow(10,32)  * 6)"),
    "Mines are twice as efficient.",
    664,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Mine.Upgrades.Iridyum = [UpgradeDefinition]::new(
    "Caramel alloys",
    500,
    [Number]::new("$([bigint]::Pow(10,36)  * 6)"),
    "Mines are twice as efficient.",
    702,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Mine.Upgrades.Glucosmium = [UpgradeDefinition]::new(
    "Delicious mineralogy",
    550,
    [Number]::new("$([bigint]::Pow(10,40)  * 6)"),
    "Mines are twice as efficient.",
    745,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Mine.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
    "Mineshaft supports",
    600,
    [Number]::new("$([bigint]::Pow(10,44)  * 6)"),
    "Mines are twice as efficient.",
    842,
    { param($building) $building.Income *= [Number]::new("2") }
)