using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class Farm : BuildingDefinition
{
    public Farm() : base(
        "Farm",
        new Number((BigInteger.Pow(10, 3) + BigInteger.Pow(10, 2)).ToString()),
        new Number("8"))
    {
        Upgrades.Add(new FarmPlain(this));
        Upgrades.Add(new FarmBerrylium(this));
        Upgrades.Add(new FarmBlueberrylium(this));
        Upgrades.Add(new FarmChalcedhoney(this));
        Upgrades.Add(new FarmButtergold(this));
        Upgrades.Add(new FarmSugarmuck(this));
        Upgrades.Add(new FarmJetmint(this));
        Upgrades.Add(new FarmCherrysilver(this));
        Upgrades.Add(new FarmHazelrald(this));
        Upgrades.Add(new FarmMooncandy(this));
        Upgrades.Add(new FarmAstrofudge(this));
        Upgrades.Add(new FarmAlabascream(this));
        Upgrades.Add(new FarmIridyum(this));
        Upgrades.Add(new FarmGlucosmium(this));
        Upgrades.Add(new FarmGlimmeringue(this));
    }
}

internal class FarmPlain(BuildingDefinition building) : UpgradeDefinition(
    10,
    "Cheap hoes",
    1,
    new Number((BigInteger.Pow(10, 4) + BigInteger.Pow(10, 3)).ToString()),
    "Farms are twice as efficient.",
    UpgradeType.Plain,
    building,
    Utils.LoadImage(Path.Combine("Farm", "FarmPlain.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FarmBerrylium(BuildingDefinition building) : UpgradeDefinition(
    11,
    "Fertilizer",
    5,
    new Number((5 * BigInteger.Pow(10, 4) + 5 * BigInteger.Pow(10, 3)).ToString()),
    "Farms are twice as efficient.",
    UpgradeType.Berrylium,
    building,
    Utils.LoadImage(Path.Combine("Farm", "FarmBerrylium.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FarmBlueberrylium(BuildingDefinition building) : UpgradeDefinition(
    12,
    "Cookie trees",
    25,
    new Number((5 * BigInteger.Pow(10, 5) + 5 * BigInteger.Pow(10, 4)).ToString()),
    "Farms are twice as efficient.",
    UpgradeType.Blueberrylium,
    building,
    Utils.LoadImage(Path.Combine("Farm", "FarmBlueberrylium.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FarmChalcedhoney(BuildingDefinition building) : UpgradeDefinition(
    45,
    "Genetically-modified cookies",
    50,
    new Number((5 * BigInteger.Pow(10, 7) + 5 * BigInteger.Pow(10, 6)).ToString()),
    "Farms are twice as efficient.",
    UpgradeType.Chalcedhoney,
    building,
    Utils.LoadImage(Path.Combine("Farm", "FarmChalcedhoney.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FarmButtergold(BuildingDefinition building) : UpgradeDefinition(
    111,
    "Gingerbread scarecrows",
    100,
    new Number((5 * BigInteger.Pow(10, 9) + 5 * BigInteger.Pow(10, 8)).ToString()),
    "Farms are twice as efficient.",
    UpgradeType.Buttergold,
    building,
    Utils.LoadImage(Path.Combine("Farm", "FarmButtergold.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FarmSugarmuck(BuildingDefinition building) : UpgradeDefinition(
    193,
    "Pulsar sprinklers",
    150,
    new Number((5 * BigInteger.Pow(10, 11) + 5 * BigInteger.Pow(10, 10)).ToString()),
    "Farms are twice as efficient.",
    UpgradeType.Sugarmuck,
    building,
    Utils.LoadImage(Path.Combine("Farm", "FarmSugarmuck.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FarmJetmint(BuildingDefinition building) : UpgradeDefinition(
    295,
    "Fudge fungus",
    200,
    new Number((5 * BigInteger.Pow(10, 14) + 5 * BigInteger.Pow(10, 13)).ToString()),
    "Farms are twice as efficient.",
    UpgradeType.Jetmint,
    building,
    Utils.LoadImage(Path.Combine("Farm", "FarmJetmint.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FarmCherrysilver(BuildingDefinition building) : UpgradeDefinition(
    308,
    "Wheat triffids",
    250,
    new Number((5 * BigInteger.Pow(10, 17) + 5 * BigInteger.Pow(10, 16)).ToString()),
    "Farms are twice as efficient.",
    UpgradeType.Cherrysilver,
    building,
    Utils.LoadImage(Path.Combine("Farm", "FarmCherrysilver.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FarmHazelrald(BuildingDefinition building) : UpgradeDefinition(
    429,
    "Humane pesticides",
    300,
    new Number((5 * BigInteger.Pow(10, 20) + 5 * BigInteger.Pow(10, 19)).ToString()),
    "Farms are twice as efficient.",
    UpgradeType.Hazelrald,
    building,
    Utils.LoadImage(Path.Combine("Farm", "FarmHazelrald.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FarmMooncandy(BuildingDefinition building) : UpgradeDefinition(
    481,
    "Barnstars",
    350,
    new Number((5 * BigInteger.Pow(10, 23) + 5 * BigInteger.Pow(10, 22)).ToString()),
    "Farms are twice as efficient.",
    UpgradeType.Mooncandy,
    building,
    Utils.LoadImage(Path.Combine("Farm", "FarmMooncandy.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FarmAstrofudge(BuildingDefinition building) : UpgradeDefinition(
    507,
    "Lindworms",
    400,
    new Number((5 * BigInteger.Pow(10, 27) + 5 * BigInteger.Pow(10, 26)).ToString()),
    "Farms are twice as efficient.",
    UpgradeType.Astrofudge,
    building,
    Utils.LoadImage(Path.Combine("Farm", "FarmAstrofudge.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FarmAlabascream(BuildingDefinition building) : UpgradeDefinition(
    663,
    "Global seed vault",
    450,
    new Number((5 * BigInteger.Pow(10, 31) + 5 * BigInteger.Pow(10, 30)).ToString()),
    "Farms are twice as efficient.",
    UpgradeType.Alabascream,
    building,
    Utils.LoadImage(Path.Combine("Farm", "FarmAlabascream.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FarmIridyum(BuildingDefinition building) : UpgradeDefinition(
    701,
    "Reverse-veganism",
    500,
    new Number((5 * BigInteger.Pow(10, 35) + 5 * BigInteger.Pow(10, 34)).ToString()),
    "Farms are twice as efficient.",
    UpgradeType.Iridyum,
    building,
    Utils.LoadImage(Path.Combine("Farm", "FarmIridyum.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FarmGlucosmium(BuildingDefinition building) : UpgradeDefinition(
    744,
    "Cookie mulch",
    550,
    new Number((5 * BigInteger.Pow(10, 39) + 5 * BigInteger.Pow(10, 38)).ToString()),
    "Farms are twice as efficient.",
    UpgradeType.Glucosmium,
    building,
    Utils.LoadImage(Path.Combine("Farm", "FarmGlucosmium.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class FarmGlimmeringue(BuildingDefinition building) : UpgradeDefinition(
    841,
    "Self-driving tractors",
    600,
    new Number((5 * BigInteger.Pow(10, 43) + 5 * BigInteger.Pow(10, 42)).ToString()),
    "Farms are twice as efficient.",
    UpgradeType.Glimmeringue,
    building,
    Utils.LoadImage(Path.Combine("Farm", "FarmGlimmeringue.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}
