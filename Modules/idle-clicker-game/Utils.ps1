function FormatLargeNumber([decimal]$number) {
	if ($number -lt 1e3) {
		$decimals = GetDecimal $number
		return $number.ToString("F$decimals")
	}
	elseif ($number -lt 1e6) {
		$val = $number / 1e3
		$decimals = GetDecimal $val
		return ("{0:F$decimals}K" -f $val)
	}
	elseif ($number -lt 1e9) {
		$val = $number / 1e6
		$decimals = GetDecimal $val
		return ("{0:F$decimals}M" -f $val)
	}
	elseif ($number -lt 1e12) {
		$val = $number / 1e9
		$decimals = GetDecimal $val
		return ("{0:F$decimals}B" -f $val)
	}
	elseif ($number -lt 1e15) {
		$val = $number / 1e12
		$decimals = GetDecimal $val
		return ("{0:F$decimals}T" -f $val)
	}
	elseif ($number -lt 1e18) {
		$val = $number / 1e15
		$decimals = GetDecimal $val
		return ("{0:F$decimals}Qa" -f $val)
	}
	elseif ($number -lt 1e21) {
		$val = $number / 1e18
		$decimals = GetDecimal $val
		return ("{0:F$decimals}Qi" -f $val)
	}
	elseif ($number -lt 1e24) {
		$val = $number / 1e21
		$decimals = GetDecimal $val
		return ("{0:F$decimals}Sx" -f $val)
	}
	elseif ($number -lt 1e27) {
		$val = $number / 1e24
		$decimals = GetDecimal $val
		return ("{0:F$decimals}Sp" -f $val)
	}
	else {
		return $number.ToString("E1")
	}
}

function FormatShopItem([string]$name, $owned, $price) {
	# First line: name left-aligned in 25 characters, owned count right-aligned in 6 characters.
	$line1 = "{0,-20}{1,6}" -f $name, $owned
	# Second line: the cost, right-aligned in the full right column, with " p" appended.
	$line2 = "{0,10} p" -f $price
	return @($line1, $line2)
}

function GetDecimal([decimal]$number) {
	if ($number -lt 10) {
		return 1
	}
	else {
		return 0
	}
}