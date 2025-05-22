using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class Factory : BuildingDefinition
{
    public Factory() : base(
        "Factory",
        new Number((BigInteger.Pow(10, 5) + BigInteger.Pow(10, 4) * 3).ToString()),
        new Number("260"))
    {
        Upgrades.Add(new FactoryPlain(this));
        Upgrades.Add(new FactoryBerrylium(this));
        Upgrades.Add(new FactoryBlueberrylium(this));
        Upgrades.Add(new FactoryChalcedhoney(this));
        Upgrades.Add(new FactoryButtergold(this));
        Upgrades.Add(new FactorySugarmuck(this));
        Upgrades.Add(new FactoryJetmint(this));
        Upgrades.Add(new FactoryCherrysilver(this));
        Upgrades.Add(new FactoryHazelrald(this));
        Upgrades.Add(new FactoryMooncandy(this));
        Upgrades.Add(new FactoryAstrofudge(this));
        Upgrades.Add(new FactoryAlabascream(this));
        Upgrades.Add(new FactoryIridyum(this));
        Upgrades.Add(new FactoryGlucosmium(this));
        Upgrades.Add(new FactoryGlimmeringue(this));
    }
}

internal class FactoryPlain(BuildingDefinition building) : UpgradeDefinition(
    13,
    "Sturdier conveyor belts",
    1,
    new Number((BigInteger.Pow(10, 6) + BigInteger.Pow(10, 5) * 3).ToString()),
    "Factories are twice as efficient.",
    UpgradeType.Plain,
    building,
    Utils.LoadImage(Path.Combine("Factory", "FactoryPlain.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FactoryBerrylium(BuildingDefinition building) : UpgradeDefinition(
    14,
    "Child labor",
    5,
    new Number((BigInteger.Pow(10, 5) * 6 + BigInteger.Pow(10, 4) * 5).ToString()),
    "Factories are twice as efficient.",
    UpgradeType.Berrylium,
    building,
    Utils.LoadImage(Path.Combine("Factory", "FactoryBerrylium.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FactoryBlueberrylium(BuildingDefinition building) : UpgradeDefinition(
    15,
    "Sweatshop",
    25,
    new Number((BigInteger.Pow(10, 6) * 6 + BigInteger.Pow(10, 5) * 5).ToString()),
    "Factories are twice as efficient.",
    UpgradeType.Blueberrylium,
    building,
    Utils.LoadImage(Path.Combine("Factory", "FactoryBlueberrylium.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FactoryChalcedhoney(BuildingDefinition building) : UpgradeDefinition(
    46,
    "Radium reactors",
    50,
    new Number((BigInteger.Pow(10, 9) * 6 + BigInteger.Pow(10, 8) * 5).ToString()),
    "Factories are twice as efficient.",
    UpgradeType.Chalcedhoney,
    building,
    Utils.LoadImage(Path.Combine("Factory", "FactoryChalcedhoney.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FactoryButtergold(BuildingDefinition building) : UpgradeDefinition(
    112,
    "Recombobulators",
    100,
    new Number((BigInteger.Pow(10, 11) * 6 + BigInteger.Pow(10, 10) * 5).ToString()),
    "Factories are twice as efficient.",
    UpgradeType.Buttergold,
    building,
    Utils.LoadImage(Path.Combine("Factory", "FactoryButtergold.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FactorySugarmuck(BuildingDefinition building) : UpgradeDefinition(
    194,
    "Deep-bake process",
    150,
    new Number((BigInteger.Pow(10, 13) * 6 + BigInteger.Pow(10, 12) * 5).ToString()),
    "Factories are twice as efficient.",
    UpgradeType.Sugarmuck,
    building,
    Utils.LoadImage(Path.Combine("Factory", "FactorySugarmuck.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FactoryJetmint(BuildingDefinition building) : UpgradeDefinition(
    297,
    "Cyborg workforce",
    200,
    new Number((BigInteger.Pow(10, 16) * 6 + BigInteger.Pow(10, 15) * 5).ToString()),
    "Factories are twice as efficient.",
    UpgradeType.Jetmint,
    building,
    Utils.LoadImage(Path.Combine("Factory", "FactoryJetmint.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FactoryCherrysilver(BuildingDefinition building) : UpgradeDefinition(
    310,
    "78-hour days",
    250,
    new Number((BigInteger.Pow(10, 19) * 6 + BigInteger.Pow(10, 18) * 5).ToString()),
    "Factories are twice as efficient.",
    UpgradeType.Cherrysilver,
    building,
    Utils.LoadImage(Path.Combine("Factory", "FactoryCherrysilver.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FactoryHazelrald(BuildingDefinition building) : UpgradeDefinition(
    431,
    "Machine learning",
    300,
    new Number((BigInteger.Pow(10, 22) * 6 + BigInteger.Pow(10, 21) * 5).ToString()),
    "Factories are twice as efficient.",
    UpgradeType.Hazelrald,
    building,
    Utils.LoadImage(Path.Combine("Factory", "FactoryHazelrald.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FactoryMooncandy(BuildingDefinition building) : UpgradeDefinition(
    483,
    "Brownie point system",
    350,
    new Number((BigInteger.Pow(10, 25) * 6 + BigInteger.Pow(10, 24) * 5).ToString()),
    "Factories are twice as efficient.",
    UpgradeType.Mooncandy,
    building,
    Utils.LoadImage(Path.Combine("Factory", "FactoryMooncandy.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FactoryAstrofudge(BuildingDefinition building) : UpgradeDefinition(
    509,
    "'Volunteer' interns",
    400,
    new Number((BigInteger.Pow(10, 29) * 6 + BigInteger.Pow(10, 28) * 5).ToString()),
    "Factories are twice as efficient.",
    UpgradeType.Astrofudge,
    building,
    Utils.LoadImage(Path.Combine("Factory", "FactoryAstrofudge.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FactoryAlabascream(BuildingDefinition building) : UpgradeDefinition(
    665,
    "Behavioral reframing",
    450,
    new Number((BigInteger.Pow(10, 33) * 6 + BigInteger.Pow(10, 32) * 5).ToString()),
    "Factories are twice as efficient.",
    UpgradeType.Alabascream,
    building,
    Utils.LoadImage(Path.Combine("Factory", "FactoryAlabascream.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FactoryIridyum(BuildingDefinition building) : UpgradeDefinition(
    703,
    "The infinity engine",
    500,
    new Number((BigInteger.Pow(10, 37) * 6 + BigInteger.Pow(10, 36) * 5).ToString()),
    "Factories are twice as efficient.",
    UpgradeType.Iridyum,
    building,
    Utils.LoadImage(Path.Combine("Factory", "FactoryIridyum.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FactoryGlucosmium(BuildingDefinition building) : UpgradeDefinition(
    746,
    "N-dimensional assembly lines",
    550,
    new Number((BigInteger.Pow(10, 41) * 6 + BigInteger.Pow(10, 40) * 5).ToString()),
    "Factories are twice as efficient.",
    UpgradeType.Glucosmium,
    building,
    Utils.LoadImage(Path.Combine("Factory", "FactoryGlucosmium.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FactoryGlimmeringue(BuildingDefinition building) : UpgradeDefinition(
    843,
    "Universal automation",
    600,
    new Number((BigInteger.Pow(10, 45) * 6 + BigInteger.Pow(10, 44) * 5).ToString()),
    "Factories are twice as efficient.",
    UpgradeType.Glimmeringue,
    building,
    Utils.LoadImage(Path.Combine("Factory", "FactoryGlimmeringue.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}
