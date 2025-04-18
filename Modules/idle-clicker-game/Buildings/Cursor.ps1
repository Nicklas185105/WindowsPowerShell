$global:BuildingData.Cursor = [BuildingDefinition]::new("Cursor", 15, 0.1, $global:Keys.D1)

$global:BuildingData.Cursor.Upgrades = @(
	[UpgradeDefinition]::new(
		"Reinforced index finger",
		1, # Unlock: at least 1 cursor owned
		100,
		"The mouse and cursors are twice as efficient.",
		0,
		{ param($building) $building.Income *= 2 }
	),
	[UpgradeDefinition]::new(
		"Carpal tunnel prevention cream",
		1,
		500,
		"The mouse and cursors are twice as efficient.",
		1,
		{ param($building) $building.Income *= 2 }
	),
	[UpgradeDefinition]::new(
		"Ambidextrous",
		10,
		10000,
		"The mouse and cursors are twice as efficient.",
		2,
		{ param($building) $building.Income *= 2 }
	)
)