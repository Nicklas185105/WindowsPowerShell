using namespace IdleClicker

$global:BuildingData.Factory = [BuildingDefinition]::new("Factory", [Number]::new("$([bigint]::Pow(10,5) + [bigint]::Pow(10,4) * 3)"), [Number]::new("260"), $global:Keys.D5)
$global:BuildingData.Factory.Upgrades = [UpgradeData]::new()

# — Factory efficiency upgrades (×2) —

$global:BuildingData.Factory.Upgrades.Plain = [UpgradeDefinition]::new(
    "Sturdier conveyor belts",
    1, # Own 1 factory
    [Number]::new("$([bigint]::Pow(10,6) + [bigint]::Pow(10,5) * 3)"), # Base price
    "Factories are twice as efficient.",
    13, # ID
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Factory.Upgrades.Berrylium = [UpgradeDefinition]::new(
    "Child labor",
    5, # Own 5 factories
    [Number]::new("$([bigint]::Pow(10,5) * 6 + [bigint]::Pow(10,4) * 5)"), # Base price
    "Factories are twice as efficient.",
    14,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Factory.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
    "Sweatshop",
    25, # Own 25 factories
    [Number]::new("$([bigint]::Pow(10,6) * 6 + [bigint]::Pow(10,5) * 5)"), # Base price
    "Factories are twice as efficient.",
    15,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Factory.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
    "Radium reactors",
    50, # Own 50 factories
    [Number]::new("$([bigint]::Pow(10,9) * 6 + [bigint]::Pow(10,8) * 5)"), # Base price
    "Factories are twice as efficient.",
    46,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Factory.Upgrades.Buttergold = [UpgradeDefinition]::new(
    "Recombobulators",
    100, # Own 100 factories
    [Number]::new("$([bigint]::Pow(10,11) * 6 + [bigint]::Pow(10,10) * 5)"), # Base price
    "Factories are twice as efficient.",
    112,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Factory.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
    "Deep-bake process",
    150, # Own 150 factories
    [Number]::new("$([bigint]::Pow(10,13) * 6 + [bigint]::Pow(10,12) * 5)"), # Base price
    "Factories are twice as efficient.",
    194,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Factory.Upgrades.Jetmint = [UpgradeDefinition]::new(
    "Cyborg workforce",
    200, # Own 200 factories
    [Number]::new("$([bigint]::Pow(10,16) * 6 + [bigint]::Pow(10,15) * 5)"), # Base price
    "Factories are twice as efficient.",
    297,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Factory.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
    "78-hour days",
    250, # Own 250 factories
    [Number]::new("$([bigint]::Pow(10,19) * 6 + [bigint]::Pow(10,18) * 5)"), # Base price
    "Factories are twice as efficient.",
    310,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Factory.Upgrades.Hazelrald = [UpgradeDefinition]::new(
    "Machine learning",
    300, # Own 300 factories
    [Number]::new("$([bigint]::Pow(10,22) * 6 + [bigint]::Pow(10,21) * 5)"), # Base price
    "Factories are twice as efficient.",
    431,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Factory.Upgrades.Mooncandy = [UpgradeDefinition]::new(
    "Brownie point system",
    350, # Own 350 factories
    [Number]::new("$([bigint]::Pow(10,25) * 6 + [bigint]::Pow(10,24) * 5)"), # Base price
    "Factories are twice as efficient.",
    483,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Factory.Upgrades.Astrofudge = [UpgradeDefinition]::new(
    "'Volunteer' interns",
    400, # Own 400 factories
    [Number]::new("$([bigint]::Pow(10,29) * 6 + [bigint]::Pow(10,28) * 5)"), # Base price
    "Factories are twice as efficient.",
    509,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Factory.Upgrades.Alabascream = [UpgradeDefinition]::new(
    "Behavioral reframing",
    450, # Own 450 factories
    [Number]::new("$([bigint]::Pow(10,33) * 6 + [bigint]::Pow(10,32) * 5)"), # Base price
    "Factories are twice as efficient.",
    665,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Factory.Upgrades.Iridyum = [UpgradeDefinition]::new(
    "The infinity engine",
    500, # Own 500 factories
    [Number]::new("$([bigint]::Pow(10,37) * 6 + [bigint]::Pow(10,36) * 5)"), # Base price
    "Factories are twice as efficient.",
    703,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Factory.Upgrades.Glucosmium = [UpgradeDefinition]::new(
    "N-dimensional assembly lines",
    550, # Own 550 factories
    [Number]::new("$([bigint]::Pow(10,41) * 6 + [bigint]::Pow(10,40) * 5)"), # Base price
    "Factories are twice as efficient.",
    746,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Factory.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
    "Universal automation",
    600, # Own 600 factories
    [Number]::new("$([bigint]::Pow(10,45) * 6 + [bigint]::Pow(10,44) * 5)"), # Base price
    "Factories are twice as efficient.",
    843,
    { param($building) $building.Income *= [Number]::new("2") }
)