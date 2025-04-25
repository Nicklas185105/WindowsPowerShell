using namespace IdleClicker

$global:BuildingData.Temple = [BuildingDefinition]::new("Temple", [Number]::new("20000000.0"), [Number]::new("7800.0"), $global:Keys.D7)
$global:BuildingData.Temple.Upgrades = [UpgradeData]::new()

# — Temple efficiency upgrades (×2) —

$global:BuildingData.Temple.Upgrades.Plain = [UpgradeDefinition]::new(
    "Golden idols",
    1, # Own 1 temple
    [Number]::new("200000000"), # Base price
    "Temples are twice as efficient.",
    238, # ID
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Temple.Upgrades.Berrylium = [UpgradeDefinition]::new(
    "Sacrifices",
    5, # Own 5 temples
    [Number]::new("1000000000"), # Base price
    "Temples are twice as efficient.",
    239, # ID
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Temple.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
    "Delicious blessing",
    25, # Own 25 temples
    [Number]::new("10000000000"), # Base price
    "Temples are twice as efficient.",
    240, # ID
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Temple.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
    "Sun festival",
    50, # Own 50 temples
    [Number]::new("1000000000000"), # Base price
    "Temples are twice as efficient.",
    241, # ID
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Temple.Upgrades.Buttergold = [UpgradeDefinition]::new(
    "Enlarged pantheon",
    100, # Own 100 temples
    [Number]::new("100000000000000"), # Base price
    "Temples are twice as efficient.",
    242, # ID
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Temple.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
    "Great Baker in the sky",
    150, # Own 150 temples
    [Number]::new("10000000000000000"), # Base price
    "Temples are twice as efficient.",
    243, # ID
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Temple.Upgrades.Jetmint = [UpgradeDefinition]::new(
    "Creation myth",
    200, # Own 200 temples
    [Number]::new("10000000000000000000"), # Base price
    "Temples are twice as efficient.",
    299, # ID
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Temple.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
    "Theocracy",
    250, # Own 250 temples
    [Number]::new("10000000000000000000000"), # Base price
    "Temples are twice as efficient.",
    312, # ID
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Temple.Upgrades.Hazelrald = [UpgradeDefinition]::new(
    "Sick rap prayers",
    300, # Own 300 temples
    [Number]::new("10000000000000000000000000"), # Base price
    "Temples are twice as efficient.",
    433, # ID
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Temple.Upgrades.Mooncandy = [UpgradeDefinition]::new(
    "Psalm-reading",
    350, # Own 350 temples
    [Number]::new("10000000000000000000000000000"), # Base price
    "Temples are twice as efficient.",
    485, # ID
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Temple.Upgrades.Astrofudge = [UpgradeDefinition]::new(
    "War of the gods",
    400, # Own 400 temples
    [Number]::new("100000000000000000000000000000000"), # Base price
    "Temples are twice as efficient.",
    511, # ID
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Temple.Upgrades.Alabascream = [UpgradeDefinition]::new(
    "A novel idea",
    450, # Own 450 temples
    [Number]::new("1000000000000000000000000000000000000"), # Base price
    "Temples are twice as efficient.",
    667, # ID
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Temple.Upgrades.Iridyum = [UpgradeDefinition]::new(
    "Apparitions",
    500, # Own 500 temples
    [Number]::new("10000000000000000000000000000000000000000"), # Base price
    "Temples are twice as efficient.",
    705, # ID
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Temple.Upgrades.Glucosmium = [UpgradeDefinition]::new(
    "Negatheism",
    550, # Own 550 temples
    [Number]::new("100000000000000000000000000000000000000000000"), # Base price
    "Temples are twice as efficient.",
    748, # ID
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Temple.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
    "Temple traps",
    600, # Own 600 temples
    [Number]::new("1000000000000000000000000000000000000000000000000"), # Base price
    "Temples are twice as efficient.",
    845, # ID
    { param($building) $building.Income *= [Number]::new("2") }
)