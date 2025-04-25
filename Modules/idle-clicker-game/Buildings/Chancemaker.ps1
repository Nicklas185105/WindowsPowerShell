using namespace IdleClicker

$global:BuildingData.Chancemaker = [BuildingDefinition]::new("Chancemaker", [Number]::new("26000000000000000.0"), [Number]::new("21000000000.0"), $global:Keys.N5)
$global:BuildingData.Chancemaker.Upgrades = [UpgradeData]::new()

# — Chancemaker efficiency upgrades (×2) —

$global:BuildingData.Chancemaker.Upgrades.Plain = [UpgradeDefinition]::new(
    "Your lucky cookie",
    1,  # Own 1 chancemaker
    [Number]::new("260000000000000000"),  # Base price: 260 quadrillion
    "Chancemakers are twice as efficient.",
    416, # ID
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Chancemaker.Upgrades.Berrylium = [UpgradeDefinition]::new(
    "All Bets Are Off magic coin",
    5,  # Own 5 chancemakers
    [Number]::new("1300000000000000000"),  # Base price: 1.3 quintillion
    "Chancemakers are twice as efficient.",
    417,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Chancemaker.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
    "Winning lottery ticket",
    25, # Own 25 chancemakers
    [Number]::new("13000000000000000000"),  # Base price: 13 quintillion
    "Chancemakers are twice as efficient.",
    418,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Chancemaker.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
    "Four-leaf clover field",
    50, # Own 50 chancemakers
    [Number]::new("1300000000000000000000"),  # Base price: 1.3 sextillion
    "Chancemakers are twice as efficient.",
    419,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Chancemaker.Upgrades.Buttergold = [UpgradeDefinition]::new(
    "A recipe book about books",
    100, # Own 100 chancemakers
    [Number]::new("130000000000000000000000"),  # Base price: 130 sextillion
    "Chancemakers are twice as efficient.",
    420,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Chancemaker.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
    "Leprechaun village",
    150, # Own 150 chancemakers
    [Number]::new("13000000000000000000000000"),  # Base price: 13 septillion
    "Chancemakers are twice as efficient.",
    421,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Chancemaker.Upgrades.Jetmint = [UpgradeDefinition]::new(
    "Improbability drive",
    200, # Own 200 chancemakers
    [Number]::new("13000000000000000000000000000"),  # Base price: 13 octillion
    "Chancemakers are twice as efficient.",
    422,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Chancemaker.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
    "Antisuperstistronics",
    250, # Own 250 chancemakers
    [Number]::new("13000000000000000000000000000000"),  # Base price: 13 nonillion
    "Chancemakers are twice as efficient.",
    423,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Chancemaker.Upgrades.Hazelrald = [UpgradeDefinition]::new(
    "Bunnypedes",
    300, # Own 300 chancemakers
    [Number]::new("13000000000000000000000000000000000"),  # Base price: 13 decillion
    "Chancemakers are twice as efficient.",
    441,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Chancemaker.Upgrades.Mooncandy = [UpgradeDefinition]::new(
    "Revised probabilistics",
    350, # Own 350 chancemakers
    [Number]::new("13000000000000000000000000000000000000"),  # Base price: 13 undecillion
    "Chancemakers are twice as efficient.",
    493,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Chancemaker.Upgrades.Astrofudge = [UpgradeDefinition]::new(
    "0-sided dice",
    400, # Own 400 chancemakers
    [Number]::new("130000000000000000000000000000000000000000"),  # Base price: 130 duodecillion
    "Chancemakers are twice as efficient.",
    519,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Chancemaker.Upgrades.Alabascream = [UpgradeDefinition]::new(
    "A touch of determinism",
    450, # Own 450 chancemakers
    [Number]::new("1300000000000000000000000000000000000000000000"),  # Base price: 1.3 quattuordecillion
    "Chancemakers are twice as efficient.",
    675,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Chancemaker.Upgrades.Iridyum = [UpgradeDefinition]::new(
    "On a streak",
    500, # Own 500 chancemakers
    [Number]::new("13000000000000000000000000000000000000000000000000"),  # Base price: 13 quindecillion
    "Chancemakers are twice as efficient.",
    713,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Chancemaker.Upgrades.Glucosmium = [UpgradeDefinition]::new(
    "Silver lining maximization",
    550, # Own 550 chancemakers
    [Number]::new("130000000000000000000000000000000000000000000000000000"),  # Base price: 130 sexdecillion
    "Chancemakers are twice as efficient.",
    756,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.Chancemaker.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
    "Gambler's fallacy fallacy",
    600, # Own 600 chancemakers
    [Number]::new("1300000000000000000000000000000000000000000000000000000000"),  # Base price: 1.3 octodecillion
    "Chancemakers are twice as efficient.",
    853,
    { param($building) $building.Income *= [Number]::new("2") }
)
