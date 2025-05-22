using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class Mine : BuildingDefinition
{
    public Mine() : base(
        "Mine",
        new Number((BigInteger.Pow(10, 4) + BigInteger.Pow(10, 3) * 2).ToString()),
        new Number("47.0"))
    {
        Upgrades.Add(new MinePlain(this));
        Upgrades.Add(new MineBerrylium(this));
        Upgrades.Add(new MineBlueberrylium(this));
        Upgrades.Add(new MineChalcedhoney(this));
        Upgrades.Add(new MineButtergold(this));
        Upgrades.Add(new MineSugarmuck(this));
        Upgrades.Add(new MineJetmint(this));
        Upgrades.Add(new MineCherrysilver(this));
        Upgrades.Add(new MineHazelrald(this));
        Upgrades.Add(new MineMooncandy(this));
        Upgrades.Add(new MineAstrofudge(this));
        Upgrades.Add(new MineAlabascream(this));
        Upgrades.Add(new MineIridyum(this));
        Upgrades.Add(new MineGlucosmium(this));
        Upgrades.Add(new MineGlimmeringue(this));
    }
}

internal class MinePlain(BuildingDefinition building) : UpgradeDefinition(
    16,
    "Sugar gas",
    1,
    new Number((BigInteger.Pow(10, 5) + BigInteger.Pow(10, 4) * 2).ToString()),
    "Mines are twice as efficient.",
    UpgradeType.Plain,
    building,
    Utils.LoadImage(Path.Combine("Mine", "MinePlain.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class MineBerrylium(BuildingDefinition building) : UpgradeDefinition(
    17,
    "Megadrill",
    5,
    new Number((6 * BigInteger.Pow(10, 5)).ToString()),
    "Mines are twice as efficient.",
    UpgradeType.Berrylium,
    building,
    Utils.LoadImage(Path.Combine("Mine", "MineBerrylium.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class MineBlueberrylium(BuildingDefinition building) : UpgradeDefinition(
    18,
    "Ultradrill",
    25,
    new Number((6 * BigInteger.Pow(10, 6)).ToString()),
    "Mines are twice as efficient.",
    UpgradeType.Blueberrylium,
    building,
    Utils.LoadImage(Path.Combine("Mine", "MineBlueberrylium.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class MineChalcedhoney(BuildingDefinition building) : UpgradeDefinition(
    47,
    "Ultimadrill",
    50,
    new Number((6 * BigInteger.Pow(10, 8)).ToString()),
    "Mines are twice as efficient.",
    UpgradeType.Chalcedhoney,
    building,
    Utils.LoadImage(Path.Combine("Mine", "MineChalcedhoney.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class MineButtergold(BuildingDefinition building) : UpgradeDefinition(
    113,
    "H-bomb mining",
    100,
    new Number((6 * BigInteger.Pow(10, 10)).ToString()),
    "Mines are twice as efficient.",
    UpgradeType.Buttergold,
    building,
    Utils.LoadImage(Path.Combine("Mine", "MineButtergold.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class MineSugarmuck(BuildingDefinition building) : UpgradeDefinition(
    195,
    "Coreforge",
    150,
    new Number((6 * BigInteger.Pow(10, 12)).ToString()),
    "Mines are twice as efficient.",
    UpgradeType.Sugarmuck,
    building,
    Utils.LoadImage(Path.Combine("Mine", "MineSugarmuck.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class MineJetmint(BuildingDefinition building) : UpgradeDefinition(
    296,
    "Planetsplitters",
    200,
    new Number((6 * BigInteger.Pow(10, 15)).ToString()),
    "Mines are twice as efficient.",
    UpgradeType.Jetmint,
    building,
    Utils.LoadImage(Path.Combine("Mine", "MineJetmint.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class MineCherrysilver(BuildingDefinition building) : UpgradeDefinition(
    309,
    "Canola oil wells",
    250,
    new Number((6 * BigInteger.Pow(10, 18)).ToString()),
    "Mines are twice as efficient.",
    UpgradeType.Cherrysilver,
    building,
    Utils.LoadImage(Path.Combine("Mine", "MineCherrysilver.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class MineHazelrald(BuildingDefinition building) : UpgradeDefinition(
    430,
    "Mole people",
    300,
    new Number((6 * BigInteger.Pow(10, 21)).ToString()),
    "Mines are twice as efficient.",
    UpgradeType.Hazelrald,
    building,
    Utils.LoadImage(Path.Combine("Mine", "MineHazelrald.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class MineMooncandy(BuildingDefinition building) : UpgradeDefinition(
    482,
    "Mine canaries",
    350,
    new Number((6 * BigInteger.Pow(10, 24)).ToString()),
    "Mines are twice as efficient.",
    UpgradeType.Mooncandy,
    building,
    Utils.LoadImage(Path.Combine("Mine", "MineMooncandy.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class MineAstrofudge(BuildingDefinition building) : UpgradeDefinition(
    508,
    "Bore again",
    400,
    new Number((6 * BigInteger.Pow(10, 28)).ToString()),
    "Mines are twice as efficient.",
    UpgradeType.Astrofudge,
    building,
    Utils.LoadImage(Path.Combine("Mine", "MineAstrofudge.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class MineAlabascream(BuildingDefinition building) : UpgradeDefinition(
    664,
    "Air mining",
    450,
    new Number((6 * BigInteger.Pow(10, 32)).ToString()),
    "Mines are twice as efficient.",
    UpgradeType.Alabascream,
    building,
    Utils.LoadImage(Path.Combine("Mine", "MineAlabascream.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class MineIridyum(BuildingDefinition building) : UpgradeDefinition(
    702,
    "Caramel alloys",
    500,
    new Number((6 * BigInteger.Pow(10, 36)).ToString()),
    "Mines are twice as efficient.",
    UpgradeType.Iridyum,
    building,
    Utils.LoadImage(Path.Combine("Mine", "MineIridyum.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class MineGlucosmium(BuildingDefinition building) : UpgradeDefinition(
    745,
    "Delicious mineralogy",
    550,
    new Number((6 * BigInteger.Pow(10, 40)).ToString()),
    "Mines are twice as efficient.",
    UpgradeType.Glucosmium,
    building,
    Utils.LoadImage(Path.Combine("Mine", "MineGlucosmium.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class MineGlimmeringue(BuildingDefinition building) : UpgradeDefinition(
    842,
    "Mineshaft supports",
    600,
    new Number((6 * BigInteger.Pow(10, 44)).ToString()),
    "Mines are twice as efficient.",
    UpgradeType.Glimmeringue,
    building,
    Utils.LoadImage(Path.Combine("Mine", "MineGlimmeringue.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}
