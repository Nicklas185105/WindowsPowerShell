using namespace IdleClicker

$global:BuildingData.Idleverse = [BuildingDefinition]::new("Idleverse", [Number]::new("12000000000000000000000.0"), [Number]::new("8300000000000.0"), $global:Keys.N8)
$global:BuildingData.Idleverse.Upgrades = [UpgradeData]::new()

# — Idleverse efficiency upgrades (×2) —

$global:BuildingData.Idleverse.Upgrades.Plain = [UpgradeDefinition]::new(
    "Manifest destiny",
    1, # Own 1 idleverse
    [Number]::new("120000000000000000000000"), # Base price: 120 sextillion
    "Idleverses are twice as efficient.",
    684, # ID
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Idleverse.Upgrades.Berrylium = [UpgradeDefinition]::new(
    "The multiverse in a nutshell",
    5, # Own 5 idleverses
    [Number]::new("600000000000000000000000"), # Base price: 600 sextillion
    "Idleverses are twice as efficient.",
    685,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Idleverse.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
    "All-conversion",
    25, # Own 25 idleverses
    [Number]::new("6000000000000000000000000"), # Base price: 6 septillion
    "Idleverses are twice as efficient.",
    686,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Idleverse.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
    "Multiverse agents",
    50, # Own 50 idleverses
    [Number]::new("600000000000000000000000000"), # Base price: 600 septillion
    "Idleverses are twice as efficient.",
    687,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Idleverse.Upgrades.Buttergold = [UpgradeDefinition]::new(
    "Escape plan",
    100, # Own 100 idleverses
    [Number]::new("60000000000000000000000000000"), # Base price: 60 octillion
    "Idleverses are twice as efficient.",
    688,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Idleverse.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
    "Game design",
    150, # Own 150 idleverses
    [Number]::new("6000000000000000000000000000000"), # Base price: 6 nonillion
    "Idleverses are twice as efficient.",
    689,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Idleverse.Upgrades.Jetmint = [UpgradeDefinition]::new(
    "Sandbox universes",
    200, # Own 200 idleverses
    [Number]::new("6000000000000000000000000000000000"), # Base price: 6 decillion
    "Idleverses are twice as efficient.",
    690,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Idleverse.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
    "Multiverse wars",
    250, # Own 250 idleverses
    [Number]::new("6000000000000000000000000000000000000"), # Base price: 6 undecillion
    "Idleverses are twice as efficient.",
    691,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Idleverse.Upgrades.Hazelrald = [UpgradeDefinition]::new(
    "Mobile ports",
    300, # Own 300 idleverses
    [Number]::new("6000000000000000000000000000000000000000"), # Base price: 6 duodecillion
    "Idleverses are twice as efficient.",
    692,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Idleverse.Upgrades.Mooncandy = [UpgradeDefinition]::new(
    "Encapsulated realities",
    350, # Own 350 idleverses
    [Number]::new("6000000000000000000000000000000000000000000"), # Base price: 6 tredecillion
    "Idleverses are twice as efficient.",
    693,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Idleverse.Upgrades.Astrofudge = [UpgradeDefinition]::new(
    "Extrinsic clicking",
    400, # Own 400 idleverses
    [Number]::new("60000000000000000000000000000000000000000000000"), # Base price: 60 quattuordecillion
    "Idleverses are twice as efficient.",
    694,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Idleverse.Upgrades.Alabascream = [UpgradeDefinition]::new(
    "Universal idling",
    450, # Own 450 idleverses
    [Number]::new("600000000000000000000000000000000000000000000000000"), # Base price: 600 quindecillion
    "Idleverses are twice as efficient.",
    695,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Idleverse.Upgrades.Iridyum = [UpgradeDefinition]::new(
    "Break the fifth wall",
    500, # Own 500 idleverses
    [Number]::new("6000000000000000000000000000000000000000000000000000000"), # Base price: 6 septendecillion
    "Idleverses are twice as efficient.",
    716,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Idleverse.Upgrades.Glucosmium = [UpgradeDefinition]::new(
    "Opposite universe",
    550, # Own 550 idleverses
    [Number]::new("60000000000000000000000000000000000000000000000000000000000"), # Base price: 60 octodecillion
    "Idleverses are twice as efficient.",
    759,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Idleverse.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
    "The other routes to Rome",
    600, # Own 600 idleverses
    [Number]::new("600000000000000000000000000000000000000000000000000000000000000"), # Base price: 600 novemdecillion
    "Idleverses are twice as efficient.",
    856,
    { param($building) $building.Income *= [Number]::new("2") }
)