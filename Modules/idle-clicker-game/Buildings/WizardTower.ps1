using namespace IdleClicker

$global:BuildingData.WizardTower = [BuildingDefinition]::new("Wizard Tower", [Number]::new("330000000.0"), [Number]::new("44000.0"), $global:Keys.D8)
$global:BuildingData.WizardTower.Upgrades = [UpgradeData]::new()

# — Wizard Tower efficiency upgrades (×2) —

$global:BuildingData.WizardTower.Upgrades.Plain = [UpgradeDefinition]::new(
	"Pointier hats",
	1, # Own 1 wizard tower
	3300000000, # Base price: 3.3 billion
	"Wizard towers are twice as efficient.",
	244, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.WizardTower.Upgrades.Berrylium = [UpgradeDefinition]::new(
	"Beardlier beards",
	5, # Own 5 wizard towers
	16500000000, # Base price: 16.5 billion
	"Wizard towers are twice as efficient.",
	245,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.WizardTower.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
	"Ancient grimoires",
	25, # Own 25 wizard towers
	165000000000, # Base price: 165 billion
	"Wizard towers are twice as efficient.",
	246,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.WizardTower.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
	"Kitchen curses",
	50, # Own 50 wizard towers
	16500000000000, # Base price: 16.5 trillion
	"Wizard towers are twice as efficient.",
	247,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.WizardTower.Upgrades.Buttergold = [UpgradeDefinition]::new(
	"School of sorcery",
	100, # Own 100 wizard towers
	1650000000000000, # Base price: 1.65 quadrillion
	"Wizard towers are twice as efficient.",
	248,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.WizardTower.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
	"Dark formulas",
	150, # Own 150 wizard towers
	165000000000000000, # Base price: 165 quadrillion
	"Wizard towers are twice as efficient.",
	249,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.WizardTower.Upgrades.Jetmint = [UpgradeDefinition]::new(
	"Cookiemancy",
	200, # Own 200 wizard towers
	165000000000000000000, # Base price: 165 quintillion
	"Wizard towers are twice as efficient.",
	300,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.WizardTower.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
	"Rabbit trick",
	250, # Own 250 wizard towers
	165000000000000000000000, # Base price: 165 sextillion
	"Wizard towers are twice as efficient.",
	313,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.WizardTower.Upgrades.Hazelrald = [UpgradeDefinition]::new(
	"Deluxe tailored wands",
	300, # Own 300 wizard towers
	165000000000000000000000000, # Base price: 165 septillion
	"Wizard towers are twice as efficient.",
	434,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.WizardTower.Upgrades.Mooncandy = [UpgradeDefinition]::new(
	"Immobile spellcasting",
	350, # Own 350 wizard towers
	165000000000000000000000000000, # Base price: 165 octillion
	"Wizard towers are twice as efficient.",
	486,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.WizardTower.Upgrades.Astrofudge = [UpgradeDefinition]::new(
	"Electricity",
	400, # Own 400 wizard towers
	1650000000000000000000000000000000, # Base price: 1.65 decillion
	"Wizard towers are twice as efficient.",
	512,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.WizardTower.Upgrades.Alabascream = [UpgradeDefinition]::new(
	"Spelling bees",
	450, # Own 450 wizard towers
	16500000000000000000000000000000000000, # Base price: 16.5 undecillion
	"Wizard towers are twice as efficient.",
	668,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.WizardTower.Upgrades.Iridyum = [UpgradeDefinition]::new(
	"Wizard basements",
	500, # Own 500 wizard towers
	165000000000000000000000000000000000000000, # Base price: 165 duodecillion
	"Wizard towers are twice as efficient.",
	706,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.WizardTower.Upgrades.Glucosmium = [UpgradeDefinition]::new(
	"Magical realism",
	550, # Own 550 wizard towers
	1650000000000000000000000000000000000000000000, # Base price: 1.65 quattuordecillion
	"Wizard towers are twice as efficient.",
	749,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.WizardTower.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
	"Polymorphism",
	600, # Own 600 wizard towers
	16500000000000000000000000000000000000000000000000, # Base price: 16.5 quindecillion
	"Wizard towers are twice as efficient.",
	846,
	{ param($building) $building.Income *= 2 }
)