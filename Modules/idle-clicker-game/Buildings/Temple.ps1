$global:BuildingData.Temple = [BuildingDefinition]::new("Temple", 20000000, 7800, $global:Keys.D7)
$global:BuildingData.Temple.Upgrades = [UpgradeData]::new()

# — Temple efficiency upgrades (×2) —

$global:BuildingData.Temple.Upgrades.Plain = [UpgradeDefinition]::new(
	"Golden idols",
	1, # Own 1 temple
	200000000, # Base price
	"Temples are twice as efficient.",
	238, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Temple.Upgrades.Berrylium = [UpgradeDefinition]::new(
	"Sacrifices",
	5, # Own 5 temples
	1000000000, # Base price
	"Temples are twice as efficient.",
	239, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Temple.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
	"Delicious blessing",
	25, # Own 25 temples
	10000000000, # Base price
	"Temples are twice as efficient.",
	240, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Temple.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
	"Sun festival",
	50, # Own 50 temples
	1000000000000, # Base price
	"Temples are twice as efficient.",
	241, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Temple.Upgrades.Buttergold = [UpgradeDefinition]::new(
	"Enlarged pantheon",
	100, # Own 100 temples
	100000000000000, # Base price
	"Temples are twice as efficient.",
	242, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Temple.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
	"Great Baker in the sky",
	150, # Own 150 temples
	10000000000000000, # Base price
	"Temples are twice as efficient.",
	243, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Temple.Upgrades.Jetmint = [UpgradeDefinition]::new(
	"Creation myth",
	200, # Own 200 temples
	10000000000000000000, # Base price
	"Temples are twice as efficient.",
	299, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Temple.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
	"Theocracy",
	250, # Own 250 temples
	10000000000000000000000, # Base price
	"Temples are twice as efficient.",
	312, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Temple.Upgrades.Hazelrald = [UpgradeDefinition]::new(
	"Sick rap prayers",
	300, # Own 300 temples
	10000000000000000000000000, # Base price
	"Temples are twice as efficient.",
	433, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Temple.Upgrades.Mooncandy = [UpgradeDefinition]::new(
	"Psalm-reading",
	350, # Own 350 temples
	10000000000000000000000000000, # Base price
	"Temples are twice as efficient.",
	485, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Temple.Upgrades.Astrofudge = [UpgradeDefinition]::new(
	"War of the gods",
	400, # Own 400 temples
	100000000000000000000000000000000, # Base price
	"Temples are twice as efficient.",
	511, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Temple.Upgrades.Alabascream = [UpgradeDefinition]::new(
	"A novel idea",
	450, # Own 450 temples
	1000000000000000000000000000000000000, # Base price
	"Temples are twice as efficient.",
	667, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Temple.Upgrades.Iridyum = [UpgradeDefinition]::new(
	"Apparitions",
	500, # Own 500 temples
	10000000000000000000000000000000000000000, # Base price
	"Temples are twice as efficient.",
	705, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Temple.Upgrades.Glucosmium = [UpgradeDefinition]::new(
	"Negatheism",
	550, # Own 550 temples
	100000000000000000000000000000000000000000000, # Base price
	"Temples are twice as efficient.",
	748, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Temple.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
	"Temple traps",
	600, # Own 600 temples
	1000000000000000000000000000000000000000000000000, # Base price
	"Temples are twice as efficient.",
	845, # ID
	{ param($building) $building.Income *= 2 }
)