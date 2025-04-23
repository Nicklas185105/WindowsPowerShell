class Number {
    [bigint] $Numerator
    [bigint] $Denominator

    Number([string] $text) {
        if ($text -match '^(?<int>\d+)([\.,](?<frac>\d+))?$') {
            $intPart  = $matches.int
            $fracPart = $matches.frac
            $scale     = if ($fracPart) { $fracPart.Length } else { 0 }
            $this.Numerator   = [bigint]("$intPart$fracPart")
            # Use math Pow for exponentiation
            $this.Denominator = [bigint][math]::Pow(10, $scale)
        } else {
            throw "Invalid number format: $text"
        }
    }

    static [Number] FromFraction([bigint] $num, [bigint] $den) {
        $inst = [Number]::new('0')
        $inst.Numerator   = $num
        $inst.Denominator = $den
        return $inst
    }

    [string] ToString() {
        $whole = [bigint]::Divide($this.Numerator, $this.Denominator)
        $rem   = [bigint]::Remainder($this.Numerator, $this.Denominator)
        if ($rem -eq 0) { return "$whole" }
        $width = if ($this.Denominator -gt 0) { [int][math]::Log10($this.Denominator) } else { 0 }
        $frac  = $rem.ToString().PadLeft($width, '0')
        return "$whole.$frac"
    }

    [Number] Ceiling() {
        $whole = [bigint]::Divide($this.Numerator, $this.Denominator)
        $rem   = [bigint]::Remainder($this.Numerator, $this.Denominator)
        if ($rem -gt 0) { $whole++ }
        return [Number]::new("$whole")
    }

    [Number] Pow([Number] $exp) {
        if ($exp.Denominator -ne 1) {
            throw "Exponent must be an integer"
        }
        $e       = [int]$exp.Numerator
        $newNum  = [bigint]::Pow($this.Numerator, $e)
        $newDen  = [bigint]::Pow($this.Denominator, $e)
        return [Number]::FromFraction($newNum, $newDen)
    }

    static [Number] op_Addition([Number] $a, [Number] $b) {
        $den = $a.Denominator * $b.Denominator
        $num = $a.Numerator   * $b.Denominator +
               $b.Numerator   * $a.Denominator
        return [Number]::FromFraction($num, $den)
    }

    static [Number] op_Subtraction([Number] $a, [Number] $b) {
        $den = $a.Denominator * $b.Denominator
        $num = $a.Numerator   * $b.Denominator -
               $b.Numerator   * $a.Denominator
        return [Number]::FromFraction($num, $den)
    }

    static [Number] op_Multiply([Number] $a, [Number] $b) {
        return [Number]::FromFraction(
            $a.Numerator * $b.Numerator,
            $a.Denominator * $b.Denominator
        )
    }

    static [Number] op_Division([Number] $a, [Number] $b) {
        return [Number]::FromFraction(
            $a.Numerator * $b.Denominator,
            $a.Denominator * $b.Numerator
        )
    }

    static [bool] op_Equality([Number] $a, [Number] $b) {
        return ($a.Numerator * $b.Denominator) -eq ($b.Numerator * $a.Denominator)
    }

    static [bool] op_Inequality([Number] $a, [Number] $b) {
        return -not [Number]::op_Equality($a, $b)
    }

    static [bool] op_LessThan([Number] $a, [Number] $b) {
        return ($a.Numerator * $b.Denominator) -lt ($b.Numerator * $a.Denominator)
    }

    static [bool] op_LessThanOrEqual([Number] $a, [Number] $b) {
        return [Number]::op_LessThan($a, $b) -or [Number]::op_Equality($a, $b)
    }

    static [bool] op_GreaterThan([Number] $a, [Number] $b) {
        return ($a.Numerator * $b.Denominator) -gt ($b.Numerator * $a.Denominator)
    }

    static [bool] op_GreaterThanOrEqual([Number] $a, [Number] $b) {
        return [Number]::op_GreaterThan($a, $b) -or [Number]::op_Equality($a, $b)
    }

    [int] GetDecimal([decimal] $number) {
        if ($number -lt 10) { return 1 } else { return 0 }
    }

    hidden [string] FormatWithSuffix([bigint] $whole, [decimal] $scale, [string] $suffix) {
        [decimal]$val  = ($whole * 100) / $scale
        $ceilValue     = [math]::Round($val/10)/10
        $dec           = $this.GetDecimal($ceilValue)
        return ("{0:F$dec}$suffix" -f $ceilValue)
    }

    [string] FormatCompact() {
        # now you can format the integer part for K/M/B suffixes:
        $whole = [bigint]::Divide($this.Numerator, $this.Denominator)
        # Write-Host "$(FormatLargeNumber ([decimal]4667273922))"
        switch ($whole) {
            { $_ -lt 1e3 } {$dec = $this.GetDecimal([decimal]$whole); return $whole.ToString("F$dec")}
            { $_ -lt 1e6 } { return $this.FormatWithSuffix($whole, 1e3, 'K') }
            { $_ -lt 1e9 } { return $this.FormatWithSuffix($whole, 1e6, 'M') }
            { $_ -lt 1e12 } { return $this.FormatWithSuffix($whole, 1e9, 'B') }
            { $_ -lt 1e15 } { return $this.FormatWithSuffix($whole, 1e12, 'T') }
            { $_ -lt 1e18 } { return $this.FormatWithSuffix($whole, 1e15, 'Qa') }
            { $_ -lt 1e21 } { return $this.FormatWithSuffix($whole, 1e18, 'Qi') }
            { $_ -lt 1e24 } { return $this.FormatWithSuffix($whole, 1e21, 'Sx') }
            { $_ -lt 1e27 } { return $this.FormatWithSuffix($whole, 1e24, 'Sp') }
            Default {
                # Fallback to scientific notation with one decimal place
                return ($whole).ToString("E1")
            }
        }
        return ""
    }
}