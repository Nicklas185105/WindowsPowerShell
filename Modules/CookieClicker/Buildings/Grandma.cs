using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class Grandma : BuildingDefinition
{
    public Grandma() : base(
        "Grandma",
        new Number(BigInteger.Pow(10, 2).ToString()),
        new Number("1"))
    {
        Upgrades.Add(new GrandmaPlain(this));
        Upgrades.Add(new GrandmaBerrylium(this));
        Upgrades.Add(new GrandmaBlueberrylium(this));
        Upgrades.Add(new GrandmaChalcedhoney(this));
        Upgrades.Add(new GrandmaButtergold(this));
        Upgrades.Add(new GrandmaSugarmuck(this));
        Upgrades.Add(new GrandmaJetmint(this));
        Upgrades.Add(new GrandmaCherrysilver(this));
        Upgrades.Add(new GrandmaHazelrald(this));
        Upgrades.Add(new GrandmaMooncandy(this));
        Upgrades.Add(new GrandmaAstrofudge(this));
        Upgrades.Add(new GrandmaAlabascream(this));
        Upgrades.Add(new GrandmaIridyum(this));
        Upgrades.Add(new GrandmaGlucosmium(this));
        Upgrades.Add(new GrandmaGlimmeringue(this));
    }
}

internal class GrandmaPlain(BuildingDefinition building) : UpgradeDefinition(
    7,
    "Forwards from grandma",
    1,
    new Number(BigInteger.Pow(10, 3).ToString()),
    "Grandmas are twice as efficient.",
    UpgradeType.Plain,
    building,
    Utils.LoadImage(Path.Combine("Grandma", "GrandmaPlain.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class GrandmaBerrylium(BuildingDefinition building) : UpgradeDefinition(
    8,
    "Steel-plated rolling pins",
    5,
    new Number((5 * BigInteger.Pow(10, 3)).ToString()),
    "Grandmas are twice as efficient.",
    UpgradeType.Berrylium,
    building,
    Utils.LoadImage(Path.Combine("Grandma", "GrandmaBerrylium.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class GrandmaBlueberrylium(BuildingDefinition building) : UpgradeDefinition(
    9,
    "Lubricated dentures",
    25,
    new Number((5 * BigInteger.Pow(10, 4)).ToString()),
    "Grandmas are twice as efficient.",
    UpgradeType.Blueberrylium,
    building,
    Utils.LoadImage(Path.Combine("Grandma", "GrandmaBlueberrylium.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class GrandmaChalcedhoney(BuildingDefinition building) : UpgradeDefinition(
    44,
    "Prune juice",
    50,
    new Number((5 * BigInteger.Pow(10, 6)).ToString()),
    "Grandmas are twice as efficient.",
    UpgradeType.Chalcedhoney,
    building,
    Utils.LoadImage(Path.Combine("Grandma", "GrandmaChalcedhoney.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class GrandmaButtergold(BuildingDefinition building) : UpgradeDefinition(
    110,
    "Double-thick glasses",
    100,
    new Number((5 * BigInteger.Pow(10, 8)).ToString()),
    "Grandmas are twice as efficient.",
    UpgradeType.Buttergold,
    building,
    Utils.LoadImage(Path.Combine("Grandma", "GrandmaButtergold.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class GrandmaSugarmuck(BuildingDefinition building) : UpgradeDefinition(
    192,
    "Aging agents",
    150,
    new Number((5 * BigInteger.Pow(10, 10)).ToString()),
    "Grandmas are twice as efficient.",
    UpgradeType.Sugarmuck,
    building,
    Utils.LoadImage(Path.Combine("Grandma", "GrandmaSugarmuck.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class GrandmaJetmint(BuildingDefinition building) : UpgradeDefinition(
    294,
    "Xtreme walkers",
    200,
    new Number((5 * BigInteger.Pow(10, 13)).ToString()),
    "Grandmas are twice as efficient.",
    UpgradeType.Jetmint,
    building,
    Utils.LoadImage(Path.Combine("Grandma", "GrandmaJetmint.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class GrandmaCherrysilver(BuildingDefinition building) : UpgradeDefinition(
    307,
    "The Unbridling",
    250,
    new Number((5 * BigInteger.Pow(10, 16)).ToString()),
    "Grandmas are twice as efficient.",
    UpgradeType.Cherrysilver,
    building,
    Utils.LoadImage(Path.Combine("Grandma", "GrandmaCherrysilver.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class GrandmaHazelrald(BuildingDefinition building) : UpgradeDefinition(
    428,
    "Reverse dementia",
    300,
    new Number((5 * BigInteger.Pow(10, 19)).ToString()),
    "Grandmas are twice as efficient.",
    UpgradeType.Hazelrald,
    building,
    Utils.LoadImage(Path.Combine("Grandma", "GrandmaHazelrald.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class GrandmaMooncandy(BuildingDefinition building) : UpgradeDefinition(
    480,
    "Timeproof hair dyes",
    350,
    new Number((5 * BigInteger.Pow(10, 22)).ToString()),
    "Grandmas are twice as efficient.",
    UpgradeType.Mooncandy,
    building,
    Utils.LoadImage(Path.Combine("Grandma", "GrandmaMooncandy.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class GrandmaAstrofudge(BuildingDefinition building) : UpgradeDefinition(
    506,
    "Good manners",
    400,
    new Number((5 * BigInteger.Pow(10, 25)).ToString()),
    "Grandmas are twice as efficient.",
    UpgradeType.Astrofudge,
    building,
    Utils.LoadImage(Path.Combine("Grandma", "GrandmaAstrofudge.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class GrandmaAlabascream(BuildingDefinition building) : UpgradeDefinition(
    662,
    "Generation degeneration",
    450,
    new Number((5 * BigInteger.Pow(10, 30)).ToString()),
    "Grandmas are twice as efficient.",
    UpgradeType.Alabascream,
    building,
    Utils.LoadImage(Path.Combine("Grandma", "GrandmaAlabascream.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class GrandmaIridyum(BuildingDefinition building) : UpgradeDefinition(
    700,
    "Visits",
    500,
    new Number((5 * BigInteger.Pow(10, 34)).ToString()),
    "Grandmas are twice as efficient.",
    UpgradeType.Iridyum,
    building,
    Utils.LoadImage(Path.Combine("Grandma", "GrandmaIridyum.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class GrandmaGlucosmium(BuildingDefinition building) : UpgradeDefinition(
    743,
    "Kitchen cabinets",
    550,
    new Number((5 * BigInteger.Pow(10, 38)).ToString()),
    "Grandmas are twice as efficient.",
    UpgradeType.Glucosmium,
    building,
    Utils.LoadImage(Path.Combine("Grandma", "GrandmaGlucosmium.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class GrandmaGlimmeringue(BuildingDefinition building) : UpgradeDefinition(
    840,
    "Foam-tipped canes",
    600,
    new Number((5 * BigInteger.Pow(10, 42)).ToString()),
    "Grandmas are twice as efficient.",
    UpgradeType.Glimmeringue,
    building,
    Utils.LoadImage(Path.Combine("Grandma", "GrandmaGlimmeringue.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}
