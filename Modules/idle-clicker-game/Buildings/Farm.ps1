using namespace IdleClicker

$global:BuildingData.Farm = [BuildingDefinition]::new("Farm", [Number]::new("$([bigint]::Pow(10,3) + [bigint]::Pow(10,2))"), [Number]::new("8"), $global:Keys.D3)
$global:BuildingData.Farm.Upgrades = [UpgradeData]::new()

# — Farm efficiency upgrades (×2) —

$global:BuildingData.Farm.Upgrades.Plain = [UpgradeDefinition]::new(
    "Cheap hoes",
    1, # Own 1 farm
    [Number]::new("$([bigint]::Pow(10,4) + [bigint]::Pow(10,3))"), # Base price
    "Farms are twice as efficient.",
    10, # ID
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Farm.Upgrades.Berrylium = [UpgradeDefinition]::new(
    "Fertilizer",
    5,
    [Number]::new("$([bigint]::Pow(10,4) * 5 + [bigint]::Pow(10,3) * 5)"),
    "Farms are twice as efficient.",
    11,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Farm.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
    "Cookie trees",
    25,
    [Number]::new("$([bigint]::Pow(10,5) * 5 + [bigint]::Pow(10,4) * 5)"),
    "Farms are twice as efficient.",
    12,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Farm.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
    "Genetically-modified cookies",
    50,
    [Number]::new("$([bigint]::Pow(10,7) * 5 + [bigint]::Pow(10,6) * 5)"), # 55 million
    "Farms are twice as efficient.",
    45,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Farm.Upgrades.Buttergold = [UpgradeDefinition]::new(
    "Gingerbread scarecrows",
    100,
    [Number]::new("$([bigint]::Pow(10,9) * 5 + [bigint]::Pow(10,8) * 5)"), # 5.5 billion
    "Farms are twice as efficient.",
    111,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Farm.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
    "Pulsar sprinklers",
    150,
    [Number]::new("$([bigint]::Pow(10,11) * 5 + [bigint]::Pow(10,10) * 5)"), # 550 billion
    "Farms are twice as efficient.",
    193,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Farm.Upgrades.Jetmint = [UpgradeDefinition]::new(
    "Fudge fungus",
    200,
    [Number]::new("$([bigint]::Pow(10,14) * 5 + [bigint]::Pow(10,13) * 5)"), # 550 trillion
    "Farms are twice as efficient.",
    295,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Farm.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
    "Wheat triffids",
    250,
    [Number]::new("$([bigint]::Pow(10,17) * 5 + [bigint]::Pow(10,16) * 5)"), # 550 quadrillion
    "Farms are twice as efficient.",
    308,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Farm.Upgrades.Hazelrald = [UpgradeDefinition]::new(
    "Humane pesticides",
    300,
    [Number]::new("$([bigint]::Pow(10,20) * 5 + [bigint]::Pow(10,19) * 5)"), # 550 quintillion
    "Farms are twice as efficient.",
    429,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Farm.Upgrades.Mooncandy = [UpgradeDefinition]::new(
    "Barnstars",
    350,
    [Number]::new("$([bigint]::Pow(10,23) * 5 + [bigint]::Pow(10,22) * 5)"), # 550 sextillion
    "Farms are twice as efficient.",
    481,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Farm.Upgrades.Astrofudge = [UpgradeDefinition]::new(
    "Lindworms",
    400,
    [Number]::new("$([bigint]::Pow(10,27) * 5 + [bigint]::Pow(10,26) * 5)"), # 5.5 octillion
    "Farms are twice as efficient.",
    507,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Farm.Upgrades.Alabascream = [UpgradeDefinition]::new(
    "Global seed vault",
    450,
    [Number]::new("$([bigint]::Pow(10,31) * 5 + [bigint]::Pow(10,30) * 5)"), # 55 nonillion
    "Farms are twice as efficient.",
    663,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Farm.Upgrades.Iridyum = [UpgradeDefinition]::new(
    "Reverse-veganism",
    500,
    [Number]::new("$([bigint]::Pow(10,35) * 5 + [bigint]::Pow(10,34) * 5)"), # 550 decillion
    "Farms are twice as efficient.",
    701,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Farm.Upgrades.Glucosmium = [UpgradeDefinition]::new(
    "Cookie mulch",
    550,
    [Number]::new("$([bigint]::Pow(10,39) * 5 + [bigint]::Pow(10,38) * 5)"), # 5.5 duodecillion
    "Farms are twice as efficient.",
    744,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Farm.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
    "Self-driving tractors",
    600,
    [Number]::new("$([bigint]::Pow(10,43) * 5 + [bigint]::Pow(10,42) * 5)"), # 55 tredecillion
    "Farms are twice as efficient.",
    841,
    { param($building) $building.Income *= [Number]::new("2") }
)