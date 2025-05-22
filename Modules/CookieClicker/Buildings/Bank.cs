using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class Bank : BuildingDefinition
{
    public Bank() : base(
        "Bank",
        new Number((BigInteger.Pow(10, 6) + BigInteger.Pow(10, 5) * 4).ToString()),
        new Number((BigInteger.Pow(10, 3) + BigInteger.Pow(10, 2) * 4).ToString()))
    {
        Upgrades.Add(new BankPlain(this));
        Upgrades.Add(new BankBerrylium(this));
        Upgrades.Add(new BankBlueberrylium(this));
        Upgrades.Add(new BankChalcedhoney(this));
        Upgrades.Add(new BankButtergold(this));
        Upgrades.Add(new BankSugarmuck(this));
        Upgrades.Add(new BankJetmint(this));
        Upgrades.Add(new BankCherrysilver(this));
        Upgrades.Add(new BankHazelrald(this));
        Upgrades.Add(new BankMooncandy(this));
        Upgrades.Add(new BankAstrofudge(this));
        Upgrades.Add(new BankAlabascream(this));
        Upgrades.Add(new BankIridyum(this));
        Upgrades.Add(new BankGlucosmium(this));
        Upgrades.Add(new BankGlimmeringue(this));
    }
}

internal class BankPlain(BuildingDefinition building) : UpgradeDefinition(
    232,
    "Taller tellers",
    1,
    new Number((BigInteger.Pow(10, 7) + BigInteger.Pow(10, 6) * 4).ToString()),
    "Banks are twice as efficient.",
    UpgradeType.Plain,
    building,
    Utils.LoadImage(Path.Combine("Bank", "BankPlain.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class BankBerrylium(BuildingDefinition building) : UpgradeDefinition(
    233,
    "Scissor-resistant credit cards",
    5,
    new Number((BigInteger.Pow(10, 6) * 7).ToString()),
    "Banks are twice as efficient.",
    UpgradeType.Berrylium,
    building,
    Utils.LoadImage(Path.Combine("Bank", "BankBerrylium.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class BankBlueberrylium(BuildingDefinition building) : UpgradeDefinition(
    234,
    "Acid-proof vaults",
    25,
    new Number("700000000"),
    "Banks are twice as efficient.",
    UpgradeType.Blueberrylium,
    building,
    Utils.LoadImage(Path.Combine("Bank", "BankBlueberrylium.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class BankChalcedhoney(BuildingDefinition building) : UpgradeDefinition(
    235,
    "Chocolate coins",
    50,
    new Number("70000000000"),
    "Banks are twice as efficient.",
    UpgradeType.Chalcedhoney,
    building,
    Utils.LoadImage(Path.Combine("Bank", "BankChalcedhoney.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class BankButtergold(BuildingDefinition building) : UpgradeDefinition(
    236,
    "Exponential interest rates",
    100,
    new Number("7000000000000"),
    "Banks are twice as efficient.",
    UpgradeType.Buttergold,
    building,
    Utils.LoadImage(Path.Combine("Bank", "BankButtergold.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class BankSugarmuck(BuildingDefinition building) : UpgradeDefinition(
    237,
    "Financial zen",
    150,
    new Number("700000000000000"),
    "Banks are twice as efficient.",
    UpgradeType.Sugarmuck,
    building,
    Utils.LoadImage(Path.Combine("Bank", "BankSugarmuck.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class BankJetmint(BuildingDefinition building) : UpgradeDefinition(
    298,
    "Way of the wallet",
    200,
    new Number("700000000000000000"),
    "Banks are twice as efficient.",
    UpgradeType.Jetmint,
    building,
    Utils.LoadImage(Path.Combine("Bank", "BankJetmint.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class BankCherrysilver(BuildingDefinition building) : UpgradeDefinition(
    311,
    "The stuff rationale",
    250,
    new Number("700000000000000000000"),
    "Banks are twice as efficient.",
    UpgradeType.Cherrysilver,
    building,
    Utils.LoadImage(Path.Combine("Bank", "BankCherrysilver.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class BankHazelrald(BuildingDefinition building) : UpgradeDefinition(
    432,
    "Edible money",
    300,
    new Number("700000000000000000000000"),
    "Banks are twice as efficient.",
    UpgradeType.Hazelrald,
    building,
    Utils.LoadImage(Path.Combine("Bank", "BankHazelrald.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class BankMooncandy(BuildingDefinition building) : UpgradeDefinition(
    484,
    "Grand supercycle",
    350,
    new Number("700000000000000000000000000"),
    "Banks are twice as efficient.",
    UpgradeType.Mooncandy,
    building,
    Utils.LoadImage(Path.Combine("Bank", "BankMooncandy.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class BankAstrofudge(BuildingDefinition building) : UpgradeDefinition(
    510,
    "Rules of acquisition",
    400,
    new Number("7000000000000000000000000000000"),
    "Banks are twice as efficient.",
    UpgradeType.Astrofudge,
    building,
    Utils.LoadImage(Path.Combine("Bank", "BankAstrofudge.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class BankAlabascream(BuildingDefinition building) : UpgradeDefinition(
    666,
    "Altruistic loop",
    450,
    new Number("70000000000000000000000000000000000"),
    "Banks are twice as efficient.",
    UpgradeType.Alabascream,
    building,
    Utils.LoadImage(Path.Combine("Bank", "BankAlabascream.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class BankIridyum(BuildingDefinition building) : UpgradeDefinition(
    704,
    "Diminishing tax returns",
    500,
    new Number("700000000000000000000000000000000000000"),
    "Banks are twice as efficient.",
    UpgradeType.Iridyum,
    building,
    Utils.LoadImage(Path.Combine("Bank", "BankIridyum.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class BankGlucosmium(BuildingDefinition building) : UpgradeDefinition(
    747,
    "Cookie Points",
    550,
    new Number("7000000000000000000000000000000000000000000"),
    "Banks are twice as efficient.",
    UpgradeType.Glucosmium,
    building,
    Utils.LoadImage(Path.Combine("Bank", "BankGlucosmium.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class BankGlimmeringue(BuildingDefinition building) : UpgradeDefinition(
    844,
    "The big shortcake",
    600,
    new Number("70000000000000000000000000000000000000000000000000"),
    "Banks are twice as efficient.",
    UpgradeType.Glimmeringue,
    building,
    Utils.LoadImage(Path.Combine("Bank", "BankGlimmeringue.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}