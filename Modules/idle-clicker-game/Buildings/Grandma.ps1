using namespace IdleClicker

$global:BuildingData.Grandma = [BuildingDefinition]::new("Grandma", [Number]::new("$([bigint]::Pow(10,2))"), [Number]::new("1"), $global:Keys.D2)
$global:BuildingData.Grandma.Upgrades = [UpgradeData]::new()

# — Grandma efficiency upgrades (×2) —

$global:BuildingData.Grandma.Upgrades.Plain = [UpgradeDefinition]::new(
    "Forwards from grandma",
    1, # Own 1 grandma
    [Number]::new("$([bigint]::Pow(10,3))"), # Base price
    "Grandmas are twice as efficient.",
    7, # ID
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Grandma.Upgrades.Berrylium = [UpgradeDefinition]::new(
    "Steel-plated rolling pins",
    5, # Own 5 grandmas
    [Number]::new("$([bigint]::Pow(10,3) * 5)"), # Base price
    "Grandmas are twice as efficient.",
    8,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Grandma.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
    "Lubricated dentures",
    25, # Own 25 grandmas
    [Number]::new("$([bigint]::Pow(10,4) * 5)"), # Base price
    "Grandmas are twice as efficient.",
    9,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Grandma.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
    "Prune juice",
    50, # Own 50 grandmas
    [Number]::new("$([bigint]::Pow(10,6) * 5)"), # Base price
    "Grandmas are twice as efficient.",
    44,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Grandma.Upgrades.Buttergold = [UpgradeDefinition]::new(
    "Double-thick glasses",
    100, # Own 100 grandmas
    [Number]::new("$([bigint]::Pow(10,8) * 5)"), # Base price
    "Grandmas are twice as efficient.",
    110,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Grandma.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
    "Aging agents",
    150, # Own 150 grandmas
    [Number]::new("$([bigint]::Pow(10,10) * 5)"), # Base price
    "Grandmas are twice as efficient.",
    192,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Grandma.Upgrades.Jetmint = [UpgradeDefinition]::new(
    "Xtreme walkers",
    200, # Own 200 grandmas
    [Number]::new("$([bigint]::Pow(10,13) * 5)"), # Base price
    "Grandmas are twice as efficient.",
    294,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Grandma.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
    "The Unbridling",
    250, # Own 250 grandmas
    [Number]::new("$([bigint]::Pow(10,16) * 5)"), # Base price
    "Grandmas are twice as efficient.",
    307,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Grandma.Upgrades.Hazelrald = [UpgradeDefinition]::new(
    "Reverse dementia",
    300, # Own 300 grandmas
    [Number]::new("$([bigint]::Pow(10,19) * 5)"), # Base price
    "Grandmas are twice as efficient.",
    428,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Grandma.Upgrades.Mooncandy = [UpgradeDefinition]::new(
    "Timeproof hair dyes",
    350, # Own 350 grandmas
    [Number]::new("$([bigint]::Pow(10,22) * 5)"), # Base price
    "Grandmas are twice as efficient.",
    480,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Grandma.Upgrades.Astrofudge = [UpgradeDefinition]::new(
    "Good manners",
    400, # Own 400 grandmas
    [Number]::new("$([bigint]::Pow(10,25) * 5)"), # Base price
    "Grandmas are twice as efficient.",
    506,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Grandma.Upgrades.Alabascream = [UpgradeDefinition]::new(
    "Generation degeneration",
    450, # Own 450 grandmas
    [Number]::new("$([bigint]::Pow(10,30) * 5)"), # Base price
    "Grandmas are twice as efficient.",
    662,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Grandma.Upgrades.Iridyum = [UpgradeDefinition]::new(
    "Visits",
    500, # Own 500 grandmas
    [Number]::new("$([bigint]::Pow(10,34) * 5)"), # Base price
    "Grandmas are twice as efficient.",
    700,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Grandma.Upgrades.Glucosmium = [UpgradeDefinition]::new(
    "Kitchen cabinets",
    550, # Own 550 grandmas
    [Number]::new("$([bigint]::Pow(10,38) * 5)"), # Base price
    "Grandmas are twice as efficient.",
    743,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Grandma.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
    "Foam-tipped canes",
    600, # Own 600 grandmas
    [Number]::new("$([bigint]::Pow(10,42) * 5)"), # Base price
    "Grandmas are twice as efficient.",
    840,
    { param($building) $building.Income *= [Number]::new("2") }
)