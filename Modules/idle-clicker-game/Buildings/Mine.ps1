$global:BuildingData.Mine = [BuildingDefinition]::new("Mine", 12000, 47, $global:Keys.D4)
$global:BuildingData.Mine.Upgrades = [UpgradeData]::new()

# — Mine efficiency upgrades (×2) —

$global:BuildingData.Mine.Upgrades.Plain = [UpgradeDefinition]::new(
	"Sugar gas",
	1, # Own 1 mine
	120000, # Base price
	"Mines are twice as efficient.",
	16, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Mine.Upgrades.Berrylium = [UpgradeDefinition]::new(
	"Megadrill",
	5,
	600000,
	"Mines are twice as efficient.",
	17,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Mine.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
	"Ultradrill",
	25,
	6000000,
	"Mines are twice as efficient.",
	18,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Mine.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
	"Ultimadrill",
	50,
	600000000,
	"Mines are twice as efficient.",
	47,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Mine.Upgrades.Buttergold = [UpgradeDefinition]::new(
	"H‑bomb mining",
	100,
	60000000000,
	"Mines are twice as efficient.",
	113,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Mine.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
	"Coreforge",
	150,
	6000000000000,
	"Mines are twice as efficient.",
	195,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Mine.Upgrades.Jetmint = [UpgradeDefinition]::new(
	"Planetsplitters",
	200,
	6000000000000000,
	"Mines are twice as efficient.",
	296,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Mine.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
	"Canola oil wells",
	250,
	6000000000000000000,
	"Mines are twice as efficient.",
	309,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Mine.Upgrades.Hazelrald = [UpgradeDefinition]::new(
	"Mole people",
	300,
	6000000000000000000000,
	"Mines are twice as efficient.",
	430,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Mine.Upgrades.Mooncandy = [UpgradeDefinition]::new(
	"Mine canaries",
	350,
	6000000000000000000000000,
	"Mines are twice as efficient.",
	482,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Mine.Upgrades.Astrofudge = [UpgradeDefinition]::new(
	"Bore again",
	400,
	60000000000000000000000000000,
	"Mines are twice as efficient.",
	508,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Mine.Upgrades.Alabascream = [UpgradeDefinition]::new(
	"Air mining",
	450,
	600000000000000000000000000000000,
	"Mines are twice as efficient.",
	664,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Mine.Upgrades.Iridyum = [UpgradeDefinition]::new(
	"Caramel alloys",
	500,
	6000000000000000000000000000000000000,
	"Mines are twice as efficient.",
	702,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Mine.Upgrades.Glucosmium = [UpgradeDefinition]::new(
	"Delicious mineralogy",
	550,
	60000000000000000000000000000000000000000,
	"Mines are twice as efficient.",
	745,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Mine.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
	"Mineshaft supports",
	600,
	600000000000000000000000000000000000000000000,
	"Mines are twice as efficient.",
	842,
	{ param($building) $building.Income *= 2 }
)