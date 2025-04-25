using namespace IdleClicker

$global:BuildingData.JavascriptConsole = [BuildingDefinition]::new("Javascript Console", [Number]::new("71000000000000000000.0"), [Number]::new("1100000000000.0"), $global:Keys.N7)
$global:BuildingData.JavascriptConsole.Upgrades = [UpgradeData]::new()

# — JavaScript Console efficiency upgrades (×2) —

$global:BuildingData.JavaScriptConsole.Upgrades.Plain = [UpgradeDefinition]::new(
    "The JavaScript console for dummies",
    1, # Own 1 javascript console
    [Number]::new("710000000000000000000"), # Base price: 710 quintillion
    "Javascript consoles are twice as efficient.",
    594, # ID
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.JavaScriptConsole.Upgrades.Berrylium = [UpgradeDefinition]::new(
    "64bit arrays",
    5, # Own 5 javascript consoles
    [Number]::new("3550000000000000000000"), # Base price: 3.55 sextillion
    "Javascript consoles are twice as efficient.",
    595,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.JavaScriptConsole.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
    "Stack overflow",
    25, # Own 25 javascript consoles
    [Number]::new("35500000000000000000000"), # Base price: 35.5 sextillion
    "Javascript consoles are twice as efficient.",
    596,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.JavaScriptConsole.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
    "Enterprise compiler",
    50, # Own 50 javascript consoles
    [Number]::new("3550000000000000000000000"), # Base price: 3.55 septillion
    "Javascript consoles are twice as efficient.",
    597,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.JavaScriptConsole.Upgrades.Buttergold = [UpgradeDefinition]::new(
    "Syntactic sugar",
    100, # Own 100 javascript consoles
    [Number]::new("355000000000000000000000000"), # Base price: 355 septillion
    "Javascript consoles are twice as efficient.",
    598,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.JavaScriptConsole.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
    "A nice cup of coffee",
    150, # Own 150 javascript consoles
    [Number]::new("35500000000000000000000000000"), # Base price: 35.5 octillion
    "Javascript consoles are twice as efficient.",
    599,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.JavaScriptConsole.Upgrades.Jetmint = [UpgradeDefinition]::new(
    "Just-in-time baking",
    200, # Own 200 javascript consoles
    [Number]::new("35500000000000000000000000000000"), # Base price: 35.5 nonillion
    "Javascript consoles are twice as efficient.",
    600,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.JavaScriptConsole.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
    "cookies++",
    250, # Own 250 javascript consoles
    [Number]::new("35500000000000000000000000000000000"), # Base price: 35.5 decillion
    "Javascript consoles are twice as efficient.",
    601,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.JavaScriptConsole.Upgrades.Hazelrald = [UpgradeDefinition]::new(
    "Software updates",
    300, # Own 300 javascript consoles
    [Number]::new("35500000000000000000000000000000000000"), # Base price: 35.5 undecillion
    "Javascript consoles are twice as efficient.",
    602,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.JavaScriptConsole.Upgrades.Mooncandy = [UpgradeDefinition]::new(
    "Game.Loop",
    350, # Own 350 javascript consoles
    [Number]::new("35500000000000000000000000000000000000000"), # Base price: 35.5 duodecillion
    "Javascript consoles are twice as efficient.",
    603,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.JavaScriptConsole.Upgrades.Astrofudge = [UpgradeDefinition]::new(
    "eval()",
    400, # Own 400 javascript consoles
    [Number]::new("355000000000000000000000000000000000000000000"), # Base price: 355 tredecillion
    "Javascript consoles are twice as efficient.",
    604,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.JavaScriptConsole.Upgrades.Alabascream = [UpgradeDefinition]::new(
    "Your biggest fans",
    450, # Own 450 javascript consoles
    [Number]::new("3550000000000000000000000000000000000000000000"), # Base price: 3.55 quindecillion
    "Javascript consoles are twice as efficient.",
    677,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.JavaScriptConsole.Upgrades.Iridyum = [UpgradeDefinition]::new(
    "Hacker shades",
    500, # Own 500 javascript consoles
    [Number]::new("35500000000000000000000000000000000000000000000000"), # Base price: 35.5 sexdecillion
    "Javascript consoles are twice as efficient.",
    715,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.JavaScriptConsole.Upgrades.Glucosmium = [UpgradeDefinition]::new(
    "PHP containment vats",
    550, # Own 550 javascript consoles
    [Number]::new("355000000000000000000000000000000000000000000000000000"), # Base price: 355 septendecillion
    "Javascript consoles are twice as efficient.",
    758,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.JavaScriptConsole.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
    "Simulation failsafes",
    600, # Own 600 javascript consoles
    [Number]::new("3550000000000000000000000000000000000000000000000000000000"), # Base price: 3.55 novemdecillion
    "Javascript consoles are twice as efficient.",
    855,
    { param($building) $building.Income *= [Number]::new("2") }
)