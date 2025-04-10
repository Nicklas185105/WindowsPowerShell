$global:GameState = @{
    Running      = $false
    UpdateScreen = $true
}

$global:Data = @{
    Clicks          = 0      # Total number of clicks/points
    IdleIncome      = 0      # Points gained automatically every interval
    ClickValue      = 1      # Points per click
    LastSaveTime    = $null  # Holds the DateTime of the last save
    Buildings       = @{
        Cursor      = 0
        Grandma     = 0
        Farm        = 0
        Mine        = 0
        Factory     = 0
        Bank        = 0
        Temple      = 0
        WizardTower = 0
    }
}

$global:Buildings = @{
    Cursor      = @{ Cost = 15;         Income = 0.1;  }
    Grandma     = @{ Cost = 100;        Income = 1;    }
    Farm        = @{ Cost = 1100;       Income = 8;    }
    Mine        = @{ Cost = 12000;      Income = 47;   }
    Factory     = @{ Cost = 130000;     Income = 260   }
    Bank        = @{ Cost = 1400000;    Income = 1400  }
    Temple      = @{ Cost = 20000000;   Income = 7800  }
    WizardTower = @{ Cost = 330000000;  Income = 44000 }
}