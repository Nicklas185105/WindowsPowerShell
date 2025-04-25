using namespace IdleClicker

$global:BuildingData.AlchemyLab = [BuildingDefinition]::new("Alchemy Lab", [Number]::new("75000000000.0"), [Number]::new("1600000.0"), $global:Keys.D0)
$global:BuildingData.AlchemyLab.Upgrades = [UpgradeData]::new()

# — Alchemy Lab efficiency upgrades (×2) —

$global:BuildingData.AlchemyLab.Upgrades.Plain = [UpgradeDefinition]::new(
    "Antimony",
    1,  # Own 1 alchemy lab
    [Number]::new("750000000000"),  # Base price: 750 billion
    "Alchemy labs are twice as efficient.",
    22, # ID
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.AlchemyLab.Upgrades.Berrylium = [UpgradeDefinition]::new(
    "Essence of dough",
    5,  # Own 5 alchemy labs
    [Number]::new("3750000000000"),  # Base price: 3.75 trillion
    "Alchemy labs are twice as efficient.",
    23,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.AlchemyLab.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
    "True chocolate",
    25, # Own 25 alchemy labs
    [Number]::new("37500000000000"), # Base price: 37.5 trillion
    "Alchemy labs are twice as efficient.",
    24,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.AlchemyLab.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
    "Ambrosia",
    50, # Own 50 alchemy labs
    [Number]::new("3750000000000000"), # Base price: 3.75 quadrillion
    "Alchemy labs are twice as efficient.",
    49,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.AlchemyLab.Upgrades.Buttergold = [UpgradeDefinition]::new(
    "Aqua crustulae",
    100, # Own 100 alchemy labs
    [Number]::new("375000000000000000"), # Base price: 375 quadrillion
    "Alchemy labs are twice as efficient.",
    115,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.AlchemyLab.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
    "Origin crucible",
    150, # Own 150 alchemy labs
    [Number]::new("37500000000000000000"), # Base price: 37.5 quintillion
    "Alchemy labs are twice as efficient.",
    197,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.AlchemyLab.Upgrades.Jetmint = [UpgradeDefinition]::new(
    "Theory of atomic fluidity",
    200, # Own 200 alchemy labs
    [Number]::new("37500000000000000000000"), # Base price: 37.5 sextillion
    "Alchemy labs are twice as efficient.",
    302,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.AlchemyLab.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
    "Beige goo",
    250, # Own 250 alchemy labs
    [Number]::new("37500000000000000000000000"), # Base price: 37.5 septillion
    "Alchemy labs are twice as efficient.",
    315,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.AlchemyLab.Upgrades.Hazelrald = [UpgradeDefinition]::new(
    "The advent of chemistry",
    300, # Own 300 alchemy labs
    [Number]::new("37500000000000000000000000000"), # Base price: 37.5 octillion
    "Alchemy labs are twice as efficient.",
    436,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.AlchemyLab.Upgrades.Mooncandy = [UpgradeDefinition]::new(
    "On second thought",
    350, # Own 350 alchemy labs
    [Number]::new("37500000000000000000000000000000"), # Base price: 37.5 nonillion
    "Alchemy labs are twice as efficient.",
    488,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.AlchemyLab.Upgrades.Astrofudge = [UpgradeDefinition]::new(
    "Public betterment",
    400, # Own 400 alchemy labs
    [Number]::new("375000000000000000000000000000000000"), # Base price: 375 decillion
    "Alchemy labs are twice as efficient.",
    514,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.AlchemyLab.Upgrades.Alabascream = [UpgradeDefinition]::new(
    "Hermetic reconciliation",
    450, # Own 450 alchemy labs
    [Number]::new("3750000000000000000000000000000000000000"), # Base price: 3.75 duodecillion
    "Alchemy labs are twice as efficient.",
    670,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.AlchemyLab.Upgrades.Iridyum = [UpgradeDefinition]::new(
    "Chromatic cycling",
    500, # Own 500 alchemy labs
    [Number]::new("37500000000000000000000000000000000000000000"), # Base price: 37.5 tredecillion
    "Alchemy labs are twice as efficient.",
    708,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.AlchemyLab.Upgrades.Glucosmium = [UpgradeDefinition]::new(
    "Arcanized glassware",
    550, # Own 550 alchemy labs
    [Number]::new("375000000000000000000000000000000000000000000000"), # Base price: 375 quattuordecillion
    "Alchemy labs are twice as efficient.",
    751,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.AlchemyLab.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
    "The dose makes the poison",
    600, # Own 600 alchemy labs
    [Number]::new("3750000000000000000000000000000000000000000000000000"), # Base price: 3.75 sexdecillion
    "Alchemy labs are twice as efficient.",
    848,
    { param($building) $building.Income *= [Number]::new("2") }
)