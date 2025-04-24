using namespace IdleClicker

$global:BuildingData.Factory = [BuildingDefinition]::new("Factory", [Number]::new("130000.0"), [Number]::new("260.0"), $global:Keys.D5)
$global:BuildingData.Factory.Upgrades = [UpgradeData]::new()

# — Factory efficiency upgrades (×2) —

$global:BuildingData.Factory.Upgrades.Plain = [UpgradeDefinition]::new(
	"Sturdier conveyor belts",
	1, # Own 1 factory
	1300000, # Base price
	"Factories are twice as efficient.",
	13, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Factory.Upgrades.Berrylium = [UpgradeDefinition]::new(
	"Child labor",
	5, # Own 5 factories
	6500000, # Base price
	"Factories are twice as efficient.",
	14, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Factory.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
	"Sweatshop",
	25, # Own 25 factories
	65000000, # Base price
	"Factories are twice as efficient.",
	15, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Factory.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
	"Radium reactors",
	50, # Own 50 factories
	6500000000, # Base price
	"Factories are twice as efficient.",
	46, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Factory.Upgrades.Buttergold = [UpgradeDefinition]::new(
	"Recombobulators",
	100, # Own 100 factories
	650000000000, # Base price
	"Factories are twice as efficient.",
	112, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Factory.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
	"Deep-bake process",
	150, # Own 150 factories
	65000000000000, # Base price
	"Factories are twice as efficient.",
	194, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Factory.Upgrades.Jetmint = [UpgradeDefinition]::new(
	"Cyborg workforce",
	200, # Own 200 factories
	65000000000000000, # Base price
	"Factories are twice as efficient.",
	297, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Factory.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
	"78-hour days",
	250, # Own 250 factories
	65000000000000000000, # Base price
	"Factories are twice as efficient.",
	310, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Factory.Upgrades.Hazelrald = [UpgradeDefinition]::new(
	"Machine learning",
	300, # Own 300 factories
	65000000000000000000000, # Base price
	"Factories are twice as efficient.",
	431, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Factory.Upgrades.Mooncandy = [UpgradeDefinition]::new(
	"Brownie point system",
	350, # Own 350 factories
	65000000000000000000000000, # Base price
	"Factories are twice as efficient.",
	483, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Factory.Upgrades.Astrofudge = [UpgradeDefinition]::new(
	"'Volunteer' interns",
	400, # Own 400 factories
	650000000000000000000000000000, # Base price
	"Factories are twice as efficient.",
	509, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Factory.Upgrades.Alabascream = [UpgradeDefinition]::new(
	"Behavioral reframing",
	450, # Own 450 factories
	6500000000000000000000000000000000, # Base price
	"Factories are twice as efficient.",
	665, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Factory.Upgrades.Iridyum = [UpgradeDefinition]::new(
	"The infinity engine",
	500, # Own 500 factories
	65000000000000000000000000000000000000, # Base price
	"Factories are twice as efficient.",
	703, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Factory.Upgrades.Glucosmium = [UpgradeDefinition]::new(
	"N-dimensional assembly lines",
	550, # Own 550 factories
	650000000000000000000000000000000000000000, # Base price
	"Factories are twice as efficient.",
	746, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Factory.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
	"Universal automation",
	600, # Own 600 factories
	6500000000000000000000000000000000000000000000, # Base price
	"Factories are twice as efficient.",
	843, # ID
	{ param($building) $building.Income *= 2 }
)