using namespace IdleClicker

$global:BuildingData.Cursor = [BuildingDefinition]::new("Cursor", [Number]::new("15"), [Number]::new("0.1"), $global:Keys.D1)
$global:BuildingData.Cursor.Upgrades = [UpgradeData]::new()

$global:BuildingData.Cursor.Upgrades.Plain = [UpgradeDefinition]::new(
    "Reinforced index finger",
    1,
    [Number]::new("$([bigint]::Pow(10,2))"),
    "The mouse and cursors are twice as efficient.",
    0,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Cursor.Upgrades.Berrylium = [UpgradeDefinition]::new(
    "Carpal tunnel prevention cream",
    1,
    [Number]::new("$(5 * [bigint]::Pow(10,2))"),
    "The mouse and cursors are twice as efficient.",
    1,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Cursor.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
    "Ambidextrous",
    10,
    [Number]::new("$([bigint]::Pow(10,4))"),
    "The mouse and cursors are twice as efficient.",
    2,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Cursor.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
    "Thousand fingers",
    25,
    [Number]::new("$([bigint]::Pow(10,5))"),
    "The mouse and cursors gain +0.1 cookies for each non-cursor object owned.",
    3,
    {
        param($building)
        # TODO: implement non-cursor count
    }
)

$global:BuildingData.Cursor.Upgrades.Buttergold = [UpgradeDefinition]::new(
    "Million fingers",
    50,
    [Number]::new("$([bigint]::Pow(10,7))"),
    "Multiplies the gain from Thousand fingers by 5.",
    4,
    { param($building) $building.Income *= [Number]::new("5") }
)

$global:BuildingData.Cursor.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
    "Billion fingers",
    100,
    [Number]::new("$([bigint]::Pow(10,8))"),
    "Multiplies the gain from Thousand fingers by 10.",
    5,
    { param($building) $building.Income *= [Number]::new("10") }
)

$global:BuildingData.Cursor.Upgrades.Jetmint = [UpgradeDefinition]::new(
    "Trillion fingers",
    150,
    [Number]::new("$([bigint]::Pow(10,9))"),
    "Multiplies the gain from Thousand fingers by 20.",
    6,
    { param($building) $building.Income *= [Number]::new("20") }
)

$global:BuildingData.Cursor.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
    "Quadrillion fingers",
    200,
    [Number]::new("$([bigint]::Pow(10,10))"),
    "Multiplies the gain from Thousand fingers by 20.",
    43,
    { param($building) $building.Income *= [Number]::new("20") }
)

$global:BuildingData.Cursor.Upgrades.Hazelrald = [UpgradeDefinition]::new(
    "Quintillion fingers",
    250,
    [Number]::new("$([bigint]::Pow(10,13))"),
    "Multiplies the gain from Thousand fingers by 20.",
    82,
    { param($building) $building.Income *= [Number]::new("20") }
)

$global:BuildingData.Cursor.Upgrades.Mooncandy = [UpgradeDefinition]::new(
    "Sextillion fingers",
    300,
    [Number]::new("$([bigint]::Pow(10,16))"),
    "Multiplies the gain from Thousand fingers by 20.",
    109,
    { param($building) $building.Income *= [Number]::new("20") }
)

$global:BuildingData.Cursor.Upgrades.Astrofudge = [UpgradeDefinition]::new(
    "Septillion fingers",
    350,
    [Number]::new("$([bigint]::Pow(10,19))"),
    "Multiplies the gain from Thousand fingers by 20.",
    188,
    { param($building) $building.Income *= [Number]::new("20") }
)

$global:BuildingData.Cursor.Upgrades.Alabascream = [UpgradeDefinition]::new(
    "Octillion fingers",
    400,
    [Number]::new("$([bigint]::Pow(10,22))"),
    "Multiplies the gain from Thousand fingers by 20.",
    189,
    { param($building) $building.Income *= [Number]::new("20") }
)

$global:BuildingData.Cursor.Upgrades.Iridyum = [UpgradeDefinition]::new(
    "Nonillion fingers",
    450,
    [Number]::new("$([bigint]::Pow(10,25))"),
    "Multiplies the gain from Thousand fingers by 20.",
    660,
    { param($building) $building.Income *= [Number]::new("20") }
)

$global:BuildingData.Cursor.Upgrades.Glucosmium = [UpgradeDefinition]::new(
    "Decillion fingers",
    500,
    [Number]::new("$([bigint]::Pow(10,28))"),
    "Multiplies the gain from Thousand fingers by 20.",
    764,
    { param($building) $building.Income *= [Number]::new("20") }
)

$global:BuildingData.Cursor.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
    "Undecillion fingers",
    550,
    [Number]::new("$([bigint]::Pow(10,31))"),
    "Multiplies the gain from Thousand fingers by 20.",
    873,
    { param($building) $building.Income *= [Number]::new("20") }
)
