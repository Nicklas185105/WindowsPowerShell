$global:BuildingData.You = [BuildingDefinition]::new("You", [Number]::new("540000000000000000000000000.0"), [Number]::new("510000000000000.0"), $global:Keys.N0)
$global:BuildingData.You.Upgrades = [UpgradeData]::new()

# — You efficiency upgrades (×2) —

$global:BuildingData.You.Upgrades.Plain = [UpgradeDefinition]::new(
	"Cloning vats",
	1, # Own 1 You
	5400000000000000000000000000, # Base price: 5.4 octillion
	"You are twice as efficient.",
	826,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.You.Upgrades.Berrylium = [UpgradeDefinition]::new(
	"Energized nutrients",
	5, # Own 5 You
	27000000000000000000000000000, # Base price: 27 octillion
	"You are twice as efficient.",
	827,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.You.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
	"Stunt doubles",
	25, # Own 25 You
	270000000000000000000000000000, # Base price: 270 octillion
	"You are twice as efficient.",
	828,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.You.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
	"Clone recycling plant",
	50, # Own 50 You
	27000000000000000000000000000000000, # Base price: 27 nonillion
	"You are twice as efficient.",
	829,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.You.Upgrades.Buttergold = [UpgradeDefinition]::new(
	"Free‑range clones",
	100, # Own 100 You
	2700000000000000000000000000000000000, # Base price: 2.7 decillion
	"You are twice as efficient.",
	830,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.You.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
	"Genetic tailoring",
	150, # Own 150 You
	270000000000000000000000000000000000000, # Base price: 270 decillion
	"You are twice as efficient.",
	831,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.You.Upgrades.Jetmint = [UpgradeDefinition]::new(
	"Power in diversity",
	200, # Own 200 You
	2700000000000000000000000000000000000000000, # Base price: 270 undecillion
	"You are twice as efficient.",
	832,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.You.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
	"Self‑betterment",
	250, # Own 250 You
	27000000000000000000000000000000000000000000000, # Base price: 270 duodecillion
	"You are twice as efficient.",
	833,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.You.Upgrades.Hazelrald = [UpgradeDefinition]::new(
	"Source control",
	300, # Own 300 You
	270000000000000000000000000000000000000000000000000, # Base price: 270 tredecillion
	"You are twice as efficient.",
	834,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.You.Upgrades.Mooncandy = [UpgradeDefinition]::new(
	"United workforce",
	350, # Own 350 You
	27000000000000000000000000000000000000000000000000000000, # Base price: 270 quattuordecillion
	"You are twice as efficient.",
	835,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.You.Upgrades.Astrofudge = [UpgradeDefinition]::new(
	"Safety patrols",
	400, # Own 400 You
	2700000000000000000000000000000000000000000000000000000000000, # Base price: 2.7 sexdecillion
	"You are twice as efficient.",
	836,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.You.Upgrades.Alabascream = [UpgradeDefinition]::new(
	"Clone rights",
	450, # Own 450 You
	27000000000000000000000000000000000000000000000000000000000000000, # Base price: 27 septendecillion
	"You are twice as efficient.",
	837,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.You.Upgrades.Iridyum = [UpgradeDefinition]::new(
	"One big family",
	500, # Own 500 You
	270000000000000000000000000000000000000000000000000000000000000000000, # Base price: 270 octodecillion
	"You are twice as efficient.",
	838,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.You.Upgrades.Glucosmium = [UpgradeDefinition]::new(
	"Fine‑tuned body plans",
	550, # Own 550 You
	2700000000000000000000000000000000000000000000000000000000000000000000000, # Base price: 2.7 vigintillion
	"You are twice as efficient.",
	839,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.You.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
	"Reading your clones bedtime stories",
	600, # Own 600 You
	270000000000000000000000000000000000000000000000000000000000000000000000000000, # Base price: 27 unvigintillion
	"You are twice as efficient.",
	858,
	{ param($building) $building.Income *= 2 }
)
