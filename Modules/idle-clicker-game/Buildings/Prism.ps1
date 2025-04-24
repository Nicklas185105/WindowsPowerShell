using namespace IdleClicker

$global:BuildingData.Prism = [BuildingDefinition]::new("Prism", [Number]::new("2100000000000000.0"), [Number]::new("2900000000.0"), $global:Keys.N4)
$global:BuildingData.Prism.Upgrades = [UpgradeData]::new()

# — Prism efficiency upgrades (×2) —

$global:BuildingData.Prism.Upgrades.Plain = [UpgradeDefinition]::new(
	"Gem polish",
	1, # Own 1 prism
	21000000000000000, # Base price: 21 quadrillion
	"Prisms are twice as efficient.",
	175, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Prism.Upgrades.Berrylium = [UpgradeDefinition]::new(
	"9th color",
	5, # Own 5 prisms
	105000000000000000, # Base price: 105 quadrillion
	"Prisms are twice as efficient.",
	176,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Prism.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
	"Chocolate light",
	25, # Own 25 prisms
	1050000000000000000, # Base price: 1.05 quintillion
	"Prisms are twice as efficient.",
	177,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Prism.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
	"Grainbow",
	50, # Own 50 prisms
	105000000000000000000, # Base price: 105 quintillion
	"Prisms are twice as efficient.",
	178,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Prism.Upgrades.Buttergold = [UpgradeDefinition]::new(
	"Pure cosmic light",
	100, # Own 100 prisms
	10500000000000000000000, # Base price: 10.5 sextillion
	"Prisms are twice as efficient.",
	179,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Prism.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
	"Glow-in-the-dark",
	150, # Own 150 prisms
	1050000000000000000000000, # Base price: 1.05 septillion
	"Prisms are twice as efficient.",
	201,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Prism.Upgrades.Jetmint = [UpgradeDefinition]::new(
	"Lux sanctorum",
	200, # Own 200 prisms
	1050000000000000000000000000, # Base price: 1.05 octillion
	"Prisms are twice as efficient.",
	306,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Prism.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
	"Reverse shadows",
	250, # Own 250 prisms
	1050000000000000000000000000000, # Base price: 1.05 nonillion
	"Prisms are twice as efficient.",
	319,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Prism.Upgrades.Hazelrald = [UpgradeDefinition]::new(
	"Crystal mirrors",
	300, # Own 300 prisms
	1050000000000000000000000000000000, # Base price: 1.05 decillion
	"Prisms are twice as efficient.",
	440,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Prism.Upgrades.Mooncandy = [UpgradeDefinition]::new(
	"Reverse theory of light",
	350, # Own 350 prisms
	1050000000000000000000000000000000000, # Base price: 1.05 undecillion
	"Prisms are twice as efficient.",
	492,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Prism.Upgrades.Astrofudge = [UpgradeDefinition]::new(
	"Light capture measures",
	400, # Own 400 prisms
	10500000000000000000000000000000000000000, # Base price: 10.5 duodecillion
	"Prisms are twice as efficient.",
	518,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Prism.Upgrades.Alabascream = [UpgradeDefinition]::new(
	"Light speed limit",
	450, # Own 450 prisms
	105000000000000000000000000000000000000000000, # Base price: 105 tredecillion
	"Prisms are twice as efficient.",
	674,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Prism.Upgrades.Iridyum = [UpgradeDefinition]::new(
	"Occam's laser",
	500, # Own 500 prisms
	1050000000000000000000000000000000000000000000, # Base price: 1.05 quindecillion
	"Prisms are twice as efficient.",
	712,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Prism.Upgrades.Glucosmium = [UpgradeDefinition]::new(
	"Hyperblack paint",
	550, # Own 550 prisms
	10500000000000000000000000000000000000000000000000000, # Base price: 10.5 sexdecillion
	"Prisms are twice as efficient.",
	755,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Prism.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
	"Lab goggles but like cool shades",
	600, # Own 600 prisms
	105000000000000000000000000000000000000000000000000000000, # Base price: 105 septendecillion
	"Prisms are twice as efficient.",
	852,
	{ param($building) $building.Income *= 2 }
)