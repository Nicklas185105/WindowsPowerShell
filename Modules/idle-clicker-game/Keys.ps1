class KeyDefinition {
    [string]$Name
    [string]$Key

    KeyDefinition([string]$name, [string]$key){
        $this.Name = $name
        $this.Key = $key
    }
}

class Keys {
    [KeyDefinition]$Space   = [KeyDefinition]::new("Space", "Spacebar")
    [KeyDefinition]$S       = [KeyDefinition]::new("S", "S")
    [KeyDefinition]$L       = [KeyDefinition]::new("L", "P")
    [KeyDefinition]$P       = [KeyDefinition]::new("P", "P")
    [KeyDefinition]$R       = [KeyDefinition]::new("R", "R")
    [KeyDefinition]$Escape  = [KeyDefinition]::new("Escape", "Escape")
    [KeyDefinition]$D1       = [KeyDefinition]::new("1", "D1")
    [KeyDefinition]$D2       = [KeyDefinition]::new("2", "D2")
    [KeyDefinition]$D3       = [KeyDefinition]::new("3", "D3")
    [KeyDefinition]$D4       = [KeyDefinition]::new("4", "D4")
    [KeyDefinition]$D5       = [KeyDefinition]::new("5", "D5")
    [KeyDefinition]$D6       = [KeyDefinition]::new("6", "D6")
    [KeyDefinition]$D7       = [KeyDefinition]::new("7", "D7")
    [KeyDefinition]$D8       = [KeyDefinition]::new("8", "D8")
    [KeyDefinition]$D9       = [KeyDefinition]::new("9", "D9")
    [KeyDefinition]$D0       = [KeyDefinition]::new("0", "D0")
    [KeyDefinition]$N1       = [KeyDefinition]::new("N1", "NumPad1")
    [KeyDefinition]$N2       = [KeyDefinition]::new("N2", "NumPad2")
    [KeyDefinition]$N3       = [KeyDefinition]::new("N3", "NumPad3")
    [KeyDefinition]$N4       = [KeyDefinition]::new("N4", "NumPad4")
    [KeyDefinition]$N5       = [KeyDefinition]::new("N5", "NumPad5")
    [KeyDefinition]$N6       = [KeyDefinition]::new("N6", "NumPad6")
    [KeyDefinition]$N7       = [KeyDefinition]::new("N7", "NumPad7")
    [KeyDefinition]$N8       = [KeyDefinition]::new("N8", "NumPad8")
    [KeyDefinition]$N9       = [KeyDefinition]::new("N9", "NumPad9")
    [KeyDefinition]$N0       = [KeyDefinition]::new("N0", "NumPad0")
}