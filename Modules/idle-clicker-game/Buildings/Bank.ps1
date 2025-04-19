$global:BuildingData.Bank = [BuildingDefinition]::new("Bank", 1400000, 1400, $global:Keys.D6)
$global:BuildingData.Bank.Upgrades = [UpgradeData]::new()

# — Bank efficiency upgrades (×2) —

$global:BuildingData.Bank.Upgrades.Plain = [UpgradeDefinition]::new(
	"Taller tellers",
	1, # Own 1 bank
	14000000, # Base price
	"Banks are twice as efficient.",
	232, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Bank.Upgrades.Berrylium = [UpgradeDefinition]::new(
	"Scissor-resistant credit cards",
	5, # Own 5 banks
	70000000, # Base price
	"Banks are twice as efficient.",
	233, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Bank.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
	"Acid-proof vaults",
	25, # Own 25 banks
	700000000, # Base price
	"Banks are twice as efficient.",
	234, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Bank.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
	"Chocolate coins",
	50, # Own 50 banks
	70000000000, # Base price
	"Banks are twice as efficient.",
	235, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Bank.Upgrades.Buttergold = [UpgradeDefinition]::new(
	"Exponential interest rates",
	100, # Own 100 banks
	7000000000000, # Base price
	"Banks are twice as efficient.",
	236, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Bank.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
	"Financial zen",
	150, # Own 150 banks
	700000000000000, # Base price
	"Banks are twice as efficient.",
	237, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Bank.Upgrades.Jetmint = [UpgradeDefinition]::new(
	"Way of the wallet",
	200, # Own 200 banks
	700000000000000000, # Base price
	"Banks are twice as efficient.",
	298, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Bank.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
	"The stuff rationale",
	250, # Own 250 banks
	700000000000000000000, # Base price
	"Banks are twice as efficient.",
	311, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Bank.Upgrades.Hazelrald = [UpgradeDefinition]::new(
	"Edible money",
	300, # Own 300 banks
	700000000000000000000000, # Base price
	"Banks are twice as efficient.",
	432, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Bank.Upgrades.Mooncandy = [UpgradeDefinition]::new(
	"Grand supercycle",
	350, # Own 350 banks
	700000000000000000000000000, # Base price
	"Banks are twice as efficient.",
	484, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Bank.Upgrades.Astrofudge = [UpgradeDefinition]::new(
	"Rules of acquisition",
	400, # Own 400 banks
	7000000000000000000000000000000, # Base price
	"Banks are twice as efficient.",
	510, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Bank.Upgrades.Alabascream = [UpgradeDefinition]::new(
	"Altruistic loop",
	450, # Own 450 banks
	70000000000000000000000000000000000, # Base price
	"Banks are twice as efficient.",
	666, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Bank.Upgrades.Iridyum = [UpgradeDefinition]::new(
	"Diminishing tax returns",
	500, # Own 500 banks
	700000000000000000000000000000000000000, # Base price
	"Banks are twice as efficient.",
	704, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Bank.Upgrades.Glucosmium = [UpgradeDefinition]::new(
	"Cookie Points",
	550, # Own 550 banks
	7000000000000000000000000000000000000000000, # Base price
	"Banks are twice as efficient.",
	747, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Bank.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
	"The big shortcake",
	600, # Own 600 banks
	70000000000000000000000000000000000000000000000000, # Base price
	"Banks are twice as efficient.",
	844, # ID
	{ param($building) $building.Income *= 2 }
)