$global:BuildingData.AntimatterCondenser = [BuildingDefinition]::new("Antimatter Condenser", 170000000000000, 430000000, $global:Keys.N3)
$global:BuildingData.AntimatterCondenser.Upgrades = [UpgradeData]::new()

# — Antimatter Condenser efficiency upgrades (×2) —

$global:BuildingData.AntimatterCondenser.Upgrades.Plain = [UpgradeDefinition]::new(
	"Sugar bosons",
	1, # Own 1 antimatter condenser
	1700000000000000, # Base price: 1.7 quadrillion
	"Antimatter condensers are twice as efficient.",
	99, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.AntimatterCondenser.Upgrades.Berrylium = [UpgradeDefinition]::new(
	"String theory",
	5, # Own 5 antimatter condensers
	8500000000000000, # Base price: 8.5 quadrillion
	"Antimatter condensers are twice as efficient.",
	100,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.AntimatterCondenser.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
	"Large macaron collider",
	25, # Own 25 antimatter condensers
	85000000000000000, # Base price: 85 quadrillion
	"Antimatter condensers are twice as efficient.",
	101,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.AntimatterCondenser.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
	"Big bang bake",
	50, # Own 50 antimatter condensers
	8500000000000000000, # Base price: 8.5 quintillion
	"Antimatter condensers are twice as efficient.",
	102,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.AntimatterCondenser.Upgrades.Buttergold = [UpgradeDefinition]::new(
	"Reverse cyclotrons",
	100, # Own 100 antimatter condensers
	850000000000000000000, # Base price: 850 quintillion
	"Antimatter condensers are twice as efficient.",
	118,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.AntimatterCondenser.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
	"Nanocosmics",
	150, # Own 150 antimatter condensers
	85000000000000000000000, # Base price: 85 sextillion
	"Antimatter condensers are twice as efficient.",
	200,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.AntimatterCondenser.Upgrades.Jetmint = [UpgradeDefinition]::new(
	"The Pulse",
	200, # Own 200 antimatter condensers
	85000000000000000000000000, # Base price: 85 septillion
	"Antimatter condensers are twice as efficient.",
	305,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.AntimatterCondenser.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
	"Some other super-tiny fundamental particle? Probably?",
	250, # Own 250 antimatter condensers
	85000000000000000000000000000, # Base price: 85 octillion
	"Antimatter condensers are twice as efficient.",
	318,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.AntimatterCondenser.Upgrades.Hazelrald = [UpgradeDefinition]::new(
	"Quantum comb",
	300, # Own 300 antimatter condensers
	85000000000000000000000000000000, # Base price: 85 nonillion
	"Antimatter condensers are twice as efficient.",
	439,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.AntimatterCondenser.Upgrades.Mooncandy = [UpgradeDefinition]::new(
	"Baking Nobel prize",
	350, # Own 350 antimatter condensers
	85000000000000000000000000000000000, # Base price: 85 decillion
	"Antimatter condensers are twice as efficient.",
	491,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.AntimatterCondenser.Upgrades.Astrofudge = [UpgradeDefinition]::new(
	"The definite molecule",
	400, # Own 400 antimatter condensers
	850000000000000000000000000000000000000, # Base price: 850 undecillion
	"Antimatter condensers are twice as efficient.",
	517,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.AntimatterCondenser.Upgrades.Alabascream = [UpgradeDefinition]::new(
	"Flavor itself",
	450, # Own 450 antimatter condensers
	8500000000000000000000000000000000000000, # Base price: 8.5 tredecillion
	"Antimatter condensers are twice as efficient.",
	673,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.AntimatterCondenser.Upgrades.Iridyum = [UpgradeDefinition]::new(
	"Delicious pull",
	500, # Own 500 antimatter condensers
	85000000000000000000000000000000000000000, # Base price: 85 quattuordecillion
	"Antimatter condensers are twice as efficient.",
	711,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.AntimatterCondenser.Upgrades.Glucosmium = [UpgradeDefinition]::new(
	"Employee minification",
	550, # Own 550 antimatter condensers
	850000000000000000000000000000000000000000000000, # Base price: 850 quindecillion
	"Antimatter condensers are twice as efficient.",
	754,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.AntimatterCondenser.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
	"Candied atoms",
	600, # Own 600 antimatter condensers
	8500000000000000000000000000000000000000000000000000, # Base price: 8.5 septendecillion
	"Antimatter condensers are twice as efficient.",
	851,
	{ param($building) $building.Income *= 2 }
)