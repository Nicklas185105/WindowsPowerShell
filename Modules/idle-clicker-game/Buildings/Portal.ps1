using namespace IdleClicker

$global:BuildingData.Portal = [BuildingDefinition]::new("Portal", [Number]::new("1000000000000.0"), [Number]::new("10000000.0"), $global:Keys.N1)
$global:BuildingData.Portal.Upgrades = [UpgradeData]::new()

# — Portal efficiency upgrades (×2) —

$global:BuildingData.Portal.Upgrades.Plain = [UpgradeDefinition]::new(
    "Ancient tablet",
    1, # Own 1 portal
    [Number]::new("10000000000000"), # Base price: 10 trillion
    "Portals are twice as efficient.",
    25, # ID
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Portal.Upgrades.Berrylium = [UpgradeDefinition]::new(
    "Insane oatling workers",
    5, # Own 5 portals
    [Number]::new("50000000000000"), # Base price: 50 trillion
    "Portals are twice as efficient.",
    26,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Portal.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
    "Soul bond",
    25, # Own 25 portals
    [Number]::new("500000000000000"), # Base price: 500 trillion
    "Portals are twice as efficient.",
    27,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Portal.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
    "Sanity dance",
    50, # Own 50 portals
    [Number]::new("50000000000000000"), # Base price: 50 quadrillion
    "Portals are twice as efficient.",
    50,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Portal.Upgrades.Buttergold = [UpgradeDefinition]::new(
    "Brane transplant",
    100, # Own 100 portals
    [Number]::new("5000000000000000000"), # Base price: 5 quintillion
    "Portals are twice as efficient.",
    116,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Portal.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
    "Deity-sized portals",
    150, # Own 150 portals
    [Number]::new("500000000000000000000"), # Base price: 500 quintillion
    "Portals are twice as efficient.",
    198,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Portal.Upgrades.Jetmint = [UpgradeDefinition]::new(
    "End of times back-up plan",
    200, # Own 200 portals
    [Number]::new("500000000000000000000000"), # Base price: 500 sextillion
    "Portals are twice as efficient.",
    303,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Portal.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
    "Maddening chants",
    250, # Own 250 portals
    [Number]::new("500000000000000000000000000"), # Base price: 500 septillion
    "Portals are twice as efficient.",
    316,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Portal.Upgrades.Hazelrald = [UpgradeDefinition]::new(
    "The real world",
    300, # Own 300 portals
    [Number]::new("500000000000000000000000000000"), # Base price: 500 octillion
    "Portals are twice as efficient.",
    437,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Portal.Upgrades.Mooncandy = [UpgradeDefinition]::new(
    "Dimensional garbage gulper",
    350, # Own 350 portals
    [Number]::new("500000000000000000000000000000000"), # Base price: 500 nonillion
    "Portals are twice as efficient.",
    489,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Portal.Upgrades.Astrofudge = [UpgradeDefinition]::new(
    "Embedded microportals",
    400, # Own 400 portals
    [Number]::new("5000000000000000000000000000000000000000000"), # Base price: 5 undecillion
    "Portals are twice as efficient.",
    515,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Portal.Upgrades.Alabascream = [UpgradeDefinition]::new(
    "His advent",
    450, # Own 450 portals
    [Number]::new("5000000000000000000000000000000000000000000000000"), # Base price: 50 duodecillion
    "Portals are twice as efficient.",
    671,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Portal.Upgrades.Iridyum = [UpgradeDefinition]::new(
    "Domestic rifts",
    500, # Own 500 portals
    [Number]::new("500000000000000000000000000000000000000000000000000000"), # Base price: 500 tredecillion
    "Portals are twice as efficient.",
    709,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Portal.Upgrades.Glucosmium = [UpgradeDefinition]::new(
    "Portal guns",
    550, # Own 550 portals
    [Number]::new("50000000000000000000000000000000000000000000000000000000"), # Base price: 5 quindecillion
    "Portals are twice as efficient.",
    752,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Portal.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
    "A way home",
    600, # Own 600 portals
    [Number]::new("5000000000000000000000000000000000000000000000000000000000"), # Base price: 50 sexdecillion
    "Portals are twice as efficient.",
    849,
    { param($building) $building.Income *= [Number]::new("2") }
)
