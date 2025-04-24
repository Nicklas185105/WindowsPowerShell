using namespace IdleClicker

$global:BuildingData.Grandma = [BuildingDefinition]::new("Grandma", [Number]::new("100.0"), [Number]::new("1.0"), $global:Keys.D2)
$global:BuildingData.Grandma.Upgrades = [UpgradeData]::new()

# — Grandma efficiency upgrades (×2) —

$global:BuildingData.Grandma.Upgrades.Plain = [UpgradeDefinition]::new(
	"Forwards from grandma",
	1, # Own 1 grandma
	1000, # Base price
	"Grandmas are twice as efficient.",
	7, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Grandma.Upgrades.Berrylium = [UpgradeDefinition]::new(
	"Steel-plated rolling pins",
	5, # Own 5 grandmas
	5000,
	"Grandmas are twice as efficient.",
	8,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Grandma.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
	"Lubricated dentures",
	25,
	50000,
	"Grandmas are twice as efficient.",
	9,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Grandma.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
	"Prune juice",
	50,
	5000000,
	"Grandmas are twice as efficient.",
	44,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Grandma.Upgrades.Buttergold = [UpgradeDefinition]::new(
	"Double-thick glasses",
	100,
	500000000,
	"Grandmas are twice as efficient.",
	110,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Grandma.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
	"Aging agents",
	150,
	50000000000,
	"Grandmas are twice as efficient.",
	192,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Grandma.Upgrades.Jetmint = [UpgradeDefinition]::new(
	"Xtreme walkers",
	200,
	50000000000000,
	"Grandmas are twice as efficient.",
	294,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Grandma.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
	"The Unbridling",
	250,
	50000000000000000,
	"Grandmas are twice as efficient.",
	307,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Grandma.Upgrades.Hazelrald = [UpgradeDefinition]::new(
	"Reverse dementia",
	300,
	50000000000000000000,
	"Grandmas are twice as efficient.",
	428,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Grandma.Upgrades.Mooncandy = [UpgradeDefinition]::new(
	"Timeproof hair dyes",
	350,
	50000000000000000000000,
	"Grandmas are twice as efficient.",
	480,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Grandma.Upgrades.Astrofudge = [UpgradeDefinition]::new(
	"Good manners",
	400,
	500000000000000000000000,
	"Grandmas are twice as efficient.",
	506,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Grandma.Upgrades.Alabascream = [UpgradeDefinition]::new(
	"Generation degeneration",
	450,
	5000000000000000000000000000,
	"Grandmas are twice as efficient.",
	662,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Grandma.Upgrades.Iridyum = [UpgradeDefinition]::new(
	"Visits",
	500,
	50000000000000000000000000000000,
	"Grandmas are twice as efficient.",
	700,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Grandma.Upgrades.Glucosmium = [UpgradeDefinition]::new(
	"Kitchen cabinets",
	550,
	500000000000000000000000000000000000,
	"Grandmas are twice as efficient.",
	743,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Grandma.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
	"Foam-tipped canes",
	600,
	5000000000000000000000000000000000000000,
	"Grandmas are twice as efficient.",
	840,
	{ param($building) $building.Income *= 2 }
)