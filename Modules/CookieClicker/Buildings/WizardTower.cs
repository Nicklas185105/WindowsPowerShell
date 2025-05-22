using CookieClicker.Definitions;

namespace CookieClicker.Buildings;

internal class WizardTower : BuildingDefinition
{
    public WizardTower() : base(
        "Wizard Tower",
        new Number("330000000.0"),
        new Number("44000.0"))
    {
        Upgrades.Add(new WizardTowerPlain(this));
        Upgrades.Add(new WizardTowerBerrylium(this));
        Upgrades.Add(new WizardTowerBlueberrylium(this));
        Upgrades.Add(new WizardTowerChalcedhoney(this));
        Upgrades.Add(new WizardTowerButtergold(this));
        Upgrades.Add(new WizardTowerSugarmuck(this));
        Upgrades.Add(new WizardTowerJetmint(this));
        Upgrades.Add(new WizardTowerCherrysilver(this));
        Upgrades.Add(new WizardTowerHazelrald(this));
        Upgrades.Add(new WizardTowerMooncandy(this));
        Upgrades.Add(new WizardTowerAstrofudge(this));
        Upgrades.Add(new WizardTowerAlabascream(this));
        Upgrades.Add(new WizardTowerIridyum(this));
        Upgrades.Add(new WizardTowerGlucosmium(this));
        Upgrades.Add(new WizardTowerGlimmeringue(this));
    }
}

internal class WizardTowerPlain(BuildingDefinition building) : UpgradeDefinition(
    244,
    "Pointier hats",
    1,
    new Number("3300000000"),
    "Wizard towers are twice as efficient.",
    UpgradeType.Plain,
    building,
    Utils.LoadImage(Path.Combine("WizardTower", "WizardTowerPlain.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class WizardTowerBerrylium(BuildingDefinition building) : UpgradeDefinition(
    245,
    "Beardlier beards",
    5,
    new Number("16500000000"),
    "Wizard towers are twice as efficient.",
    UpgradeType.Berrylium,
    building,
    Utils.LoadImage(Path.Combine("WizardTower", "WizardTowerBerrylium.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class WizardTowerBlueberrylium(BuildingDefinition building) : UpgradeDefinition(
    246,
    "Ancient grimoires",
    25,
    new Number("165000000000"),
    "Wizard towers are twice as efficient.",
    UpgradeType.Blueberrylium,
    building,
    Utils.LoadImage(Path.Combine("WizardTower", "WizardTowerBlueberrylium.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class WizardTowerChalcedhoney(BuildingDefinition building) : UpgradeDefinition(
    247,
    "Kitchen curses",
    50,
    new Number("16500000000000"),
    "Wizard towers are twice as efficient.",
    UpgradeType.Chalcedhoney,
    building,
    Utils.LoadImage(Path.Combine("WizardTower", "WizardTowerChalcedhoney.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class WizardTowerButtergold(BuildingDefinition building) : UpgradeDefinition(
    248,
    "School of sorcery",
    100,
    new Number("1650000000000000"),
    "Wizard towers are twice as efficient.",
    UpgradeType.Buttergold,
    building,
    Utils.LoadImage(Path.Combine("WizardTower", "WizardTowerButtergold.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class WizardTowerSugarmuck(BuildingDefinition building) : UpgradeDefinition(
    249,
    "Dark formulas",
    150,
    new Number("165000000000000000"),
    "Wizard towers are twice as efficient.",
    UpgradeType.Sugarmuck,
    building,
    Utils.LoadImage(Path.Combine("WizardTower", "WizardTowerSugarmuck.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class WizardTowerJetmint(BuildingDefinition building) : UpgradeDefinition(
    300,
    "Cookiemancy",
    200,
    new Number("165000000000000000000"),
    "Wizard towers are twice as efficient.",
    UpgradeType.Jetmint,
    building,
    Utils.LoadImage(Path.Combine("WizardTower", "WizardTowerJetmint.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class WizardTowerCherrysilver(BuildingDefinition building) : UpgradeDefinition(
    313,
    "Rabbit trick",
    250,
    new Number("165000000000000000000000"),
    "Wizard towers are twice as efficient.",
    UpgradeType.Cherrysilver,
    building,
    Utils.LoadImage(Path.Combine("WizardTower", "WizardTowerCherrysilver.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class WizardTowerHazelrald(BuildingDefinition building) : UpgradeDefinition(
    434,
    "Deluxe tailored wands",
    300,
    new Number("165000000000000000000000000"),
    "Wizard towers are twice as efficient.",
    UpgradeType.Hazelrald,
    building,
    Utils.LoadImage(Path.Combine("WizardTower", "WizardTowerHazelrald.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class WizardTowerMooncandy(BuildingDefinition building) : UpgradeDefinition(
    486,
    "Immobile spellcasting",
    350,
    new Number("165000000000000000000000000000"),
    "Wizard towers are twice as efficient.",
    UpgradeType.Mooncandy,
    building,
    Utils.LoadImage(Path.Combine("WizardTower", "WizardTowerMooncandy.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class WizardTowerAstrofudge(BuildingDefinition building) : UpgradeDefinition(
    512,
    "Electricity",
    400,
    new Number("1650000000000000000000000000000000"),
    "Wizard towers are twice as efficient.",
    UpgradeType.Astrofudge,
    building,
    Utils.LoadImage(Path.Combine("WizardTower", "WizardTowerAstrofudge.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class WizardTowerAlabascream(BuildingDefinition building) : UpgradeDefinition(
    668,
    "Spelling bees",
    450,
    new Number("16500000000000000000000000000000000000"),
    "Wizard towers are twice as efficient.",
    UpgradeType.Alabascream,
    building,
    Utils.LoadImage(Path.Combine("WizardTower", "WizardTowerAlabascream.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class WizardTowerIridyum(BuildingDefinition building) : UpgradeDefinition(
    706,
    "Wizard basements",
    500,
    new Number("165000000000000000000000000000000000000000"),
    "Wizard towers are twice as efficient.",
    UpgradeType.Iridyum,
    building,
    Utils.LoadImage(Path.Combine("WizardTower", "WizardTowerIridyum.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class WizardTowerGlucosmium(BuildingDefinition building) : UpgradeDefinition(
    749,
    "Magical realism",
    550,
    new Number("1650000000000000000000000000000000000000000000"),
    "Wizard towers are twice as efficient.",
    UpgradeType.Glucosmium,
    building,
    Utils.LoadImage(Path.Combine("WizardTower", "WizardTowerGlucosmium.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class WizardTowerGlimmeringue(BuildingDefinition building) : UpgradeDefinition(
    846,
    "Polymorphism",
    600,
    new Number("16500000000000000000000000000000000000000000000000"),
    "Wizard towers are twice as efficient.",
    UpgradeType.Glimmeringue,
    building,
    Utils.LoadImage(Path.Combine("WizardTower", "WizardTowerGlimmeringue.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}
