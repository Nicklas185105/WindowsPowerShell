using namespace IdleClicker

$global:BuildingData.FractalEngine = [BuildingDefinition]::new("Fractal Engine", [Number]::new("310000000000000000.0"), [Number]::new("150000000000.0"), $global:Keys.N6)
$global:BuildingData.FractalEngine.Upgrades = [UpgradeData]::new()

# — Fractal Engine efficiency upgrades (×2) —

$global:BuildingData.FractalEngine.Upgrades.Plain = [UpgradeDefinition]::new(
	"Metabakeries",
	1, # Own 1 fractal engine
	3100000000000000000, # Base price: 3.1 quintillion
	"Fractal engines are twice as efficient.",
	522, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.FractalEngine.Upgrades.Berrylium = [UpgradeDefinition]::new(
	"Mandelbrown sugar",
	5, # Own 5 fractal engines
	15500000000000000000, # Base price: 15.5 quintillion
	"Fractal engines are twice as efficient.",
	523,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.FractalEngine.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
	"Fractoids",
	25, # Own 25 fractal engines
	155000000000000000000, # Base price: 155 quintillion
	"Fractal engines are twice as efficient.",
	524,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.FractalEngine.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
	"Nested universe theory",
	50, # Own 50 fractal engines
	15500000000000000000000, # Base price: 15.5 sextillion
	"Fractal engines are twice as efficient.",
	525,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.FractalEngine.Upgrades.Buttergold = [UpgradeDefinition]::new(
	"Menger sponge cake",
	100, # Own 100 fractal engines
	1550000000000000000000000, # Base price: 1.55 septillion
	"Fractal engines are twice as efficient.",
	526,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.FractalEngine.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
	"One particularly good-humored cow",
	150, # Own 150 fractal engines
	155000000000000000000000000, # Base price: 155 septillion
	"Fractal engines are twice as efficient.",
	527,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.FractalEngine.Upgrades.Jetmint = [UpgradeDefinition]::new(
	"Chocolate ouroboros",
	200, # Own 200 fractal engines
	155000000000000000000000000000, # Base price: 155 octillion
	"Fractal engines are twice as efficient.",
	528,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.FractalEngine.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
	"Nested",
	250, # Own 250 fractal engines
	155000000000000000000000000000000, # Base price: 155 nonillion
	"Fractal engines are twice as efficient.",
	529,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.FractalEngine.Upgrades.Hazelrald = [UpgradeDefinition]::new(
	"Space-filling fibers",
	300, # Own 300 fractal engines
	155000000000000000000000000000000000, # Base price: 155 decillion
	"Fractal engines are twice as efficient.",
	530,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.FractalEngine.Upgrades.Mooncandy = [UpgradeDefinition]::new(
	"Endless book of prose",
	350, # Own 350 fractal engines
	155000000000000000000000000000000000000, # Base price: 155 undecillion
	"Fractal engines are twice as efficient.",
	531,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.FractalEngine.Upgrades.Astrofudge = [UpgradeDefinition]::new(
	"The set of all sets",
	400, # Own 400 fractal engines
	1550000000000000000000000000000000000000000, # Base price: 1.55 tredecillion
	"Fractal engines are twice as efficient.",
	532,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.FractalEngine.Upgrades.Alabascream = [UpgradeDefinition]::new(
	"This upgrade",
	450, # Own 450 fractal engines
	15000000000000000000000000000000000000000000000, # Base price: 15 quattuordecillion
	"Fractal engines are twice as efficient.",
	676,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.FractalEngine.Upgrades.Iridyum = [UpgradeDefinition]::new(
	"A box",
	500, # Own 500 fractal engines
	155000000000000000000000000000000000000000000000000, # Base price: 155 quindecillion
	"Fractal engines are twice as efficient.",
	714,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.FractalEngine.Upgrades.Glucosmium = [UpgradeDefinition]::new(
	"Multiscale profiling",
	550, # Own 550 fractal engines
	1550000000000000000000000000000000000000000000000000000, # Base price: 1.55 septendecillion
	"Fractal engines are twice as efficient.",
	757,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.FractalEngine.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
	"The more they stay the same",
	600, # Own 600 fractal engines
	15500000000000000000000000000000000000000000000000000000000, # Base price: 15.5 octodecillion
	"Fractal engines are twice as efficient.",
	854,
	{ param($building) $building.Income *= 2 }
)
