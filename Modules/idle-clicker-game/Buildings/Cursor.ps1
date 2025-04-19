$global:BuildingData.Cursor = [BuildingDefinition]::new("Cursor", 15, 0.1, $global:Keys.D1)
$global:BuildingData.Cursor.Upgrades = [UpgradeData]::new()

# — Plain / Berrylium / Blueberrylium (×2 efficiency) —
$global:BuildingData.Cursor.Upgrades.Plain = [UpgradeDefinition]::new(
	"Reinforced index finger",
	1, # Own 1 cursor
	100, # Base price
	"The mouse and cursors are twice as efficient.",
	0, # ID
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Cursor.Upgrades.Berrylium = [UpgradeDefinition]::new(
	"Carpal tunnel prevention cream",
	1,
	500,
	"The mouse and cursors are twice as efficient.",
	1,
	{ param($building) $building.Income *= 2 }
)

$global:BuildingData.Cursor.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
	"Ambidextrous",
	10,
	10000,
	"The mouse and cursors are twice as efficient.",
	2,
	{ param($building) $building.Income *= 2 }
)

# — Chalcedhoney → Thousand fingers (+0.1 per non‑cursor) —
$global:BuildingData.Cursor.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
	"Thousand fingers",
	25,
	100000,
	"The mouse and cursors gain +0.1 cookies for each non-cursor object owned.",
	3,
	{
		param($building)
		# TODO: count all other buildings owned and add 0.1 per building to cursor income
		# Example sketch (adjust to your data structures):
		# $others = ($building.GameData.Buildings |
		#            Where-Object { $_.Key -ne "Cursor" } |
		#            Measure-Object -Property Value -Sum).Sum
		# $building.Income += 0.1 * $others
	}
)

# — Buttergold → Million fingers (×5 on Thousand fingers bonus) —
$global:BuildingData.Cursor.Upgrades.Buttergold = [UpgradeDefinition]::new(
	"Million fingers",
	50,
	10000000,
	"Multiplies the gain from Thousand fingers by 5.",
	4,
	{ param($building) $building.Income *= 5 }
)

# — Sugarmuck → Billion fingers (×10 on Thousand fingers bonus) —
$global:BuildingData.Cursor.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
	"Billion fingers",
	100,
	100000000,
	"Multiplies the gain from Thousand fingers by 10.",
	5,
	{ param($building) $building.Income *= 10 }
)

# — Jetmint → Trillion fingers (×20 on Thousand fingers bonus) —
$global:BuildingData.Cursor.Upgrades.Jetmint = [UpgradeDefinition]::new(
	"Trillion fingers",
	150,
	1000000000,
	"Multiplies the gain from Thousand fingers by 20.",
	6,
	{ param($building) $building.Income *= 20 }
)

# — Cherrysilver → Quadrillion fingers (×20 on Thousand fingers bonus) —
$global:BuildingData.Cursor.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
	"Quadrillion fingers",
	200,
	10000000000,
	"Multiplies the gain from Thousand fingers by 20.",
	43,
	{ param($building) $building.Income *= 20 }
)

# — Hazelrald → Quintillion fingers (×20) —
$global:BuildingData.Cursor.Upgrades.Hazelrald = [UpgradeDefinition]::new(
	"Quintillion fingers",
	250,
	10000000000000,
	"Multiplies the gain from Thousand fingers by 20.",
	82,
	{ param($building) $building.Income *= 20 }
)

# — Mooncandy → Sextillion fingers (×20) —
$global:BuildingData.Cursor.Upgrades.Mooncandy = [UpgradeDefinition]::new(
	"Sextillion fingers",
	300,
	10000000000000000,
	"Multiplies the gain from Thousand fingers by 20.",
	109,
	{ param($building) $building.Income *= 20 }
)

# — Astrofudge → Septillion fingers (×20) —
$global:BuildingData.Cursor.Upgrades.Astrofudge = [UpgradeDefinition]::new(
	"Septillion fingers",
	350,
	10000000000000000000,
	"Multiplies the gain from Thousand fingers by 20.",
	188,
	{ param($building) $building.Income *= 20 }
)

# — Alabascream → Octillion fingers (×20) —
$global:BuildingData.Cursor.Upgrades.Alabascream = [UpgradeDefinition]::new(
	"Octillion fingers",
	400,
	10000000000000000000000,
	"Multiplies the gain from Thousand fingers by 20.",
	189,
	{ param($building) $building.Income *= 20 }
)

# — Iridyum → Nonillion fingers (×20) —
$global:BuildingData.Cursor.Upgrades.Iridyum = [UpgradeDefinition]::new(
	"Nonillion fingers",
	450,
	10000000000000000000000000,
	"Multiplies the gain from Thousand fingers by 20.",
	660,
	{ param($building) $building.Income *= 20 }
)

# — Glucosmium → Decillion fingers (×20) —
$global:BuildingData.Cursor.Upgrades.Glucosmium = [UpgradeDefinition]::new(
	"Decillion fingers",
	500,
	10000000000000000000000000000,
	"Multiplies the gain from Thousand fingers by 20.",
	764,
	{ param($building) $building.Income *= 20 }
)

# — Glimmeringue → Undecillion fingers (×20) —
$global:BuildingData.Cursor.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
	"Undecillion fingers",
	550,
	10000000000000000000000000000000,
	"Multiplies the gain from Thousand fingers by 20.",
	873,
	{ param($building) $building.Income *= 20 }
)