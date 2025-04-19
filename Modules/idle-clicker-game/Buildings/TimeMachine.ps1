$global:BuildingData.TimeMachine = [BuildingDefinition]::new("Time Machine", 14000000000000, 65000000, $global:Keys.N2)
$global:BuildingData.TimeMachine.Upgrades = [UpgradeData]::new()

# — Time Machine efficiency upgrades (×2) —

$global:BuildingData.TimeMachine.Upgrades.Plain = [UpgradeDefinition]::new(
	"Flux capacitors",
	1, # Own 1 time machine
	140000000000000, # Base price: 140 trillion
	"Time machines are twice as efficient.",
	28, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.TimeMachine.Upgrades.Berrylium = [UpgradeDefinition]::new(
	"Time paradox resolver",
	5, # Own 5 time machines
	700000000000000, # Base price: 700 trillion
	"Time machines are twice as efficient.",
	29,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.TimeMachine.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
	"Quantum conundrum",
	25, # Own 25 time machines
	7000000000000000, # Base price: 7 quadrillion
	"Time machines are twice as efficient.",
	30,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.TimeMachine.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
	"Causality enforcer",
	50, # Own 50 time machines
	700000000000000000, # Base price: 700 quadrillion
	"Time machines are twice as efficient.",
	51,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.TimeMachine.Upgrades.Buttergold = [UpgradeDefinition]::new(
	"Yestermorrow comparators",
	100, # Own 100 time machines
	70000000000000000000, # Base price: 70 quintillion
	"Time machines are twice as efficient.",
	117,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.TimeMachine.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
	"Far future enactment",
	150, # Own 150 time machines
	7000000000000000000000, # Base price: 7 sextillion
	"Time machines are twice as efficient.",
	199,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.TimeMachine.Upgrades.Jetmint = [UpgradeDefinition]::new(
	"Great loop hypothesis",
	200, # Own 200 time machines
	7000000000000000000000000, # Base price: 7 septillion
	"Time machines are twice as efficient.",
	304,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.TimeMachine.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
	"Cookietopian moments of maybe",
	250, # Own 250 time machines
	7000000000000000000000000000, # Base price: 7 octillion
	"Time machines are twice as efficient.",
	317,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.TimeMachine.Upgrades.Hazelrald = [UpgradeDefinition]::new(
	"Second seconds",
	300, # Own 300 time machines
	7000000000000000000000000000000, # Base price: 7 nonillion
	"Time machines are twice as efficient.",
	438,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.TimeMachine.Upgrades.Mooncandy = [UpgradeDefinition]::new(
	"Additional clock hands",
	350, # Own 350 time machines
	7000000000000000000000000000000000, # Base price: 7 decillion
	"Time machines are twice as efficient.",
	490,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.TimeMachine.Upgrades.Astrofudge = [UpgradeDefinition]::new(
	"Nostalgia",
	400, # Own 400 time machines
	70000000000000000000000000000000000000, # Base price: 70 undecillion
	"Time machines are twice as efficient.",
	516,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.TimeMachine.Upgrades.Alabascream = [UpgradeDefinition]::new(
	"Split seconds",
	450, # Own 450 time machines
	700000000000000000000000000000000000000000, # Base price: 700 duodecillion
	"Time machines are twice as efficient.",
	672,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.TimeMachine.Upgrades.Iridyum = [UpgradeDefinition]::new(
	"Patience abolished",
	500, # Own 500 time machines
	7000000000000000000000000000000000000000000000, # Base price: 7 quattuordecillion
	"Time machines are twice as efficient.",
	710,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.TimeMachine.Upgrades.Glucosmium = [UpgradeDefinition]::new(
	"Timeproof upholstery",
	550, # Own 550 time machines
	70000000000000000000000000000000000000000000000000, # Base price: 70 quindecillion
	"Time machines are twice as efficient.",
	753,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.TimeMachine.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
	"Rectifying a mistake",
	600, # Own 600 time machines
	7000000000000000000000000000000000000000000000000000000, # Base price: 700 sexdecillion
	"Time machines are twice as efficient.",
	850,
	{ param($building) $building.Income *= 2 }
)