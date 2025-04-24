using namespace IdleClicker

$global:BuildingData.Farm = [BuildingDefinition]::new("Farm", [Number]::new("1100.0"), [Number]::new("8.0"), $global:Keys.D3)
$global:BuildingData.Farm.Upgrades = [UpgradeData]::new()

# — Farm efficiency upgrades (×2) —

$global:BuildingData.Farm.Upgrades.Plain = [UpgradeDefinition]::new(
	"Cheap hoes",
	1, # Own 1 farm
	11000, # Base price
	"Farms are twice as efficient.",
	10, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Farm.Upgrades.Berrylium = [UpgradeDefinition]::new(
	"Fertilizer",
	5,
	55000,
	"Farms are twice as efficient.",
	11,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Farm.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
	"Cookie trees",
	25,
	550000,
	"Farms are twice as efficient.",
	12,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Farm.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
	"Genetically-modified cookies",
	50,
	55000000, # 55 million
	"Farms are twice as efficient.",
	45,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Farm.Upgrades.Buttergold = [UpgradeDefinition]::new(
	"Gingerbread scarecrows",
	100,
	5500000000, # 5.5 billion
	"Farms are twice as efficient.",
	111,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Farm.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
	"Pulsar sprinklers",
	150,
	550000000000, # 550 billion
	"Farms are twice as efficient.",
	193,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Farm.Upgrades.Jetmint = [UpgradeDefinition]::new(
	"Fudge fungus",
	200,
	550000000000000, # 550 trillion
	"Farms are twice as efficient.",
	295,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Farm.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
	"Wheat triffids",
	250,
	550000000000000000, # 550 quadrillion
	"Farms are twice as efficient.",
	308,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Farm.Upgrades.Hazelrald = [UpgradeDefinition]::new(
	"Humane pesticides",
	300,
	550000000000000000000, # 550 quintillion
	"Farms are twice as efficient.",
	429,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Farm.Upgrades.Mooncandy = [UpgradeDefinition]::new(
	"Barnstars",
	350,
	550000000000000000000000, # 550 sextillion
	"Farms are twice as efficient.",
	481,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Farm.Upgrades.Astrofudge = [UpgradeDefinition]::new(
	"Lindworms",
	400,
	5500000000000000000000000000, # 5.5 octillion
	"Farms are twice as efficient.",
	507,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Farm.Upgrades.Alabascream = [UpgradeDefinition]::new(
	"Global seed vault",
	450,
	5500000000000000000000000000000, # 55 nonillion
	"Farms are twice as efficient.",
	663,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Farm.Upgrades.Iridyum = [UpgradeDefinition]::new(
	"Reverse-veganism",
	500,
	55000000000000000000000000000000000, # 550 decillion
	"Farms are twice as efficient.",
	701,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Farm.Upgrades.Glucosmium = [UpgradeDefinition]::new(
	"Cookie mulch",
	550,
	550000000000000000000000000000000000000, # 5.5 duodecillion
	"Farms are twice as efficient.",
	744,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Farm.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
	"Self-driving tractors",
	600,
	55000000000000000000000000000000000000000000, # 55 tredecillion
	"Farms are twice as efficient.",
	841,
	{ param($building) $building.Income *= 2 }
)