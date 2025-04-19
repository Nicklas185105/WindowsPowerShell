$global:BuildingData.Shipment = [BuildingDefinition]::new("Shipment", 5100000000, 260000, $global:Keys.D9)
$global:BuildingData.Shipment.Upgrades = [UpgradeData]::new()

# — Shipment efficiency upgrades (×2) —

$global:BuildingData.Shipment.Upgrades.Plain = [UpgradeDefinition]::new(
	"Vanilla nebulae",
	1, # Own 1 shipment
	51000000000, # Base price: 51 billion
	"Shipments are twice as efficient.",
	19, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Shipment.Upgrades.Berrylium = [UpgradeDefinition]::new(
	"Wormholes",
	5, # Own 5 shipments
	255000000000, # Base price: 255 billion
	"Shipments are twice as efficient.",
	20,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Shipment.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
	"Frequent flyer",
	25, # Own 25 shipments
	2550000000000, # Base price: 2.55 trillion
	"Shipments are twice as efficient.",
	21,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Shipment.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
	"Warp drive",
	50, # Own 50 shipments
	255000000000000, # Base price: 255 trillion
	"Shipments are twice as efficient.",
	48,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Shipment.Upgrades.Buttergold = [UpgradeDefinition]::new(
	"Chocolate monoliths",
	100, # Own 100 shipments
	25500000000000000, # Base price: 25.5 quadrillion
	"Shipments are twice as efficient.",
	114,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Shipment.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
	"Generation ship",
	150, # Own 150 shipments
	2550000000000000000, # Base price: 2.55 quintillion
	"Shipments are twice as efficient.",
	196,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Shipment.Upgrades.Jetmint = [UpgradeDefinition]::new(
	"Dyson sphere",
	200, # Own 200 shipments
	2550000000000000000000, # Base price: 2.55 sextillion
	"Shipments are twice as efficient.",
	301,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Shipment.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
	"The final frontier",
	250, # Own 250 shipments
	2550000000000000000000000, # Base price: 2.55 septillion
	"Shipments are twice as efficient.",
	314,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Shipment.Upgrades.Hazelrald = [UpgradeDefinition]::new(
	"Autopilot",
	300, # Own 300 shipments
	2550000000000000000000000000, # Base price: 2.55 octillion
	"Shipments are twice as efficient.",
	435,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Shipment.Upgrades.Mooncandy = [UpgradeDefinition]::new(
	"Restaurants at the end of the universe",
	350, # Own 350 shipments
	2550000000000000000000000000000, # Base price: 2.55 nonillion
	"Shipments are twice as efficient.",
	487,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Shipment.Upgrades.Astrofudge = [UpgradeDefinition]::new(
	"Universal alphabet",
	400, # Own 400 shipments
	25500000000000000000000000000000000, # Base price: 25.5 decillion
	"Shipments are twice as efficient.",
	513,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Shipment.Upgrades.Alabascream = [UpgradeDefinition]::new(
	"Toroid universe",
	450, # Own 450 shipments
	255000000000000000000000000000000000000, # Base price: 255 undecillion
	"Shipments are twice as efficient.",
	669,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Shipment.Upgrades.Iridyum = [UpgradeDefinition]::new(
	"Prime directive",
	500, # Own 500 shipments
	2550000000000000000000000000000000000000000, # Base price: 2.55 tredecillion
	"Shipments are twice as efficient.",
	707,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Shipment.Upgrades.Glucosmium = [UpgradeDefinition]::new(
	"Cosmic foreground radiation",
	550, # Own 550 shipments
	25500000000000000000000000000000000000000000000, # Base price: 25.5 quattuordecillion
	"Shipments are twice as efficient.",
	750,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Shipment.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
	"At your doorstep in 30 minutes or your money back",
	600, # Own 600 shipments
	255000000000000000000000000000000000000000000000000, # Base price: 255 quindecillion
	"Shipments are twice as efficient.",
	847,
	{ param($building) $building.Income *= 2 }
)