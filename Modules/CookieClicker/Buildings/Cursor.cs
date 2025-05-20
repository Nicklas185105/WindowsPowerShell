using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class Cursor : BuildingDefinition
{
    public Cursor() : base(
        "Cursor",
        new Number((BigInteger.Pow(10, 1) + 5).ToString()),
        new Number("0.1"))
    {
        Upgrades.Add(new CursorPlain(this));
        Upgrades.Add(new CursorBerrylium(this));
        Upgrades.Add(new CursorBlueberrylium(this));
        Upgrades.Add(new CursorChalcedhoney(this));
        Upgrades.Add(new CursorButtergold(this));
        Upgrades.Add(new CursorSugarmuck(this));
        Upgrades.Add(new CursorJetmint(this));
        Upgrades.Add(new CursorCherrysilver(this));
        Upgrades.Add(new CursorHazelrald(this));
        Upgrades.Add(new CursorMooncandy(this));
        Upgrades.Add(new CursorAstrofudge(this));
        Upgrades.Add(new CursorAlabascream(this));
        Upgrades.Add(new CursorIridyum(this));
        Upgrades.Add(new CursorGlucosmium(this));
        Upgrades.Add(new CursorGlimmeringue(this));
    }
}

internal class CursorPlain(BuildingDefinition building) : UpgradeDefinition(
    0,
    "Reinforced index finger",
    1,
    new Number(BigInteger.Pow(10, 2).ToString()),
    "The mouse and cursors are twice as efficient.",
    UpgradeType.Plain,
    building,
    Utils.LoadImage(Path.Combine("Cursor", "CursorPlain.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked)
        {
            return;
        }
        Building.BaseIncome *= new Number("2");
    }
}

internal class CursorBerrylium(BuildingDefinition building) : UpgradeDefinition(
    1,
    "Carpal tunnel prevention cream",
    1,
    new Number((5 * BigInteger.Pow(10, 2)).ToString()),
    "The mouse and cursors are twice as efficient.",
    UpgradeType.Berrylium,
    building,
    Utils.LoadImage(Path.Combine("Cursor", "CursorBerrylium.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked)
        {
            return;
        }
        Building.BaseIncome *= new Number("2");
    }
}

internal class CursorBlueberrylium(BuildingDefinition building) : UpgradeDefinition(
    2,
    "Ambidextrous",
    10,
    new Number(BigInteger.Pow(10, 4).ToString()),
    "The mouse and cursors are twice as efficient.",
    UpgradeType.Blueberrylium,
    building,
    Utils.LoadImage(Path.Combine("Cursor", "CursorBlueberrylium.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked)
        {
            return;
        }
        Building.BaseIncome *= new Number("2");
    }
}

internal class CursorChalcedhoney(BuildingDefinition building) : UpgradeDefinition(
    3,
    "Thousand fingers",
    25,
    new Number(BigInteger.Pow(10, 5).ToString()),
    "The mouse and cursors gain +0.1 cookies for each non-cursor object owned.",
    UpgradeType.Chalcedhoney,
    building,
    Utils.LoadImage(Path.Combine("Cursor", "CursorChalcedhoney.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked)
        {
            return;
        }
        // TODO: implement non-cursor count logic
    }
}

internal class CursorButtergold(BuildingDefinition building) : UpgradeDefinition(
    4,
    "Million fingers",
    50,
    new Number(BigInteger.Pow(10, 7).ToString()),
    "Multiplies the gain from Thousand fingers by 5.",
    UpgradeType.Buttergold,
    building,
    Utils.LoadImage(Path.Combine("Cursor", "CursorButtergold.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked)
        {
            return;
        }
        Building.BaseIncome *= new Number("5");
    }
}

internal class CursorSugarmuck(BuildingDefinition building) : UpgradeDefinition(
    5,
    "Billion fingers",
    100,
    new Number(BigInteger.Pow(10, 8).ToString()),
    "Multiplies the gain from Thousand fingers by 10.",
    UpgradeType.Sugarmuck,
    building,
    Utils.LoadImage(Path.Combine("Cursor", "CursorSugarmuck.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked)
        {
            return;
        }
        Building.BaseIncome *= new Number("10");
    }
}

internal class CursorJetmint(BuildingDefinition building) : UpgradeDefinition(
    6,
    "Trillion fingers",
    150,
    new Number(BigInteger.Pow(10, 9).ToString()),
    "Multiplies the gain from Thousand fingers by 20.",
    UpgradeType.Jetmint,
    building,
    Utils.LoadImage(Path.Combine("Cursor", "CursorJetmint.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked)
        {
            return;
        }
        Building.BaseIncome *= new Number("20");
    }
}

internal class CursorCherrysilver(BuildingDefinition building) : UpgradeDefinition(
    43,
    "Quadrillion fingers",
    200,
    new Number(BigInteger.Pow(10, 10).ToString()),
    "Multiplies the gain from Thousand fingers by 20.",
    UpgradeType.Cherrysilver,
    building,
    Utils.LoadImage(Path.Combine("Cursor", "CursorCherrysilver.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked)
        {
            return;
        }
        Building.BaseIncome *= new Number("20");
    }
}

internal class CursorHazelrald(BuildingDefinition building) : UpgradeDefinition(
    82,
    "Quintillion fingers",
    250,
    new Number(BigInteger.Pow(10, 13).ToString()),
    "Multiplies the gain from Thousand fingers by 20.",
    UpgradeType.Hazelrald,
    building,
    Utils.LoadImage(Path.Combine("Cursor", "CursorHazelrald.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked)
        {
            return;
        }
        Building.BaseIncome *= new Number("20");
    }
}

internal class CursorMooncandy(BuildingDefinition building) : UpgradeDefinition(
    109,
    "Sextillion fingers",
    300,
    new Number(BigInteger.Pow(10, 16).ToString()),
    "Multiplies the gain from Thousand fingers by 20.",
    UpgradeType.Mooncandy,
    building,
    Utils.LoadImage(Path.Combine("Cursor", "CursorMooncandy.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked)
        {
            return;
        }
        Building.BaseIncome *= new Number("20");
    }
}

internal class CursorAstrofudge(BuildingDefinition building) : UpgradeDefinition(
    188,
    "Septillion fingers",
    350,
    new Number(BigInteger.Pow(10, 19).ToString()),
    "Multiplies the gain from Thousand fingers by 20.",
    UpgradeType.Astrofudge,
    building,
    Utils.LoadImage(Path.Combine("Cursor", "CursorAstrofudge.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked)
        {
            return;
        }
        Building.BaseIncome *= new Number("20");
    }
}

internal class CursorAlabascream(BuildingDefinition building) : UpgradeDefinition(
    189,
    "Octillion fingers",
    400,
    new Number(BigInteger.Pow(10, 22).ToString()),
    "Multiplies the gain from Thousand fingers by 20.",
    UpgradeType.Alabascream,
    building,
    Utils.LoadImage(Path.Combine("Cursor", "CursorAlabascream.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked)
        {
            return;
        }
        Building.BaseIncome *= new Number("20");
    }
}

internal class CursorIridyum(BuildingDefinition building) : UpgradeDefinition(
    660,
    "Nonillion fingers",
    450,
    new Number(BigInteger.Pow(10, 25).ToString()),
    "Multiplies the gain from Thousand fingers by 20.",
    UpgradeType.Iridyum,
    building,
    Utils.LoadImage(Path.Combine("Cursor", "CursorIridyum.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked)
        {
            return;
        }
        Building.BaseIncome *= new Number("20");
    }
}

internal class CursorGlucosmium(BuildingDefinition building) : UpgradeDefinition(
    764,
    "Decillion fingers",
    500,
    new Number(BigInteger.Pow(10, 28).ToString()),
    "Multiplies the gain from Thousand fingers by 20.",
    UpgradeType.Glucosmium,
    building,
    Utils.LoadImage(Path.Combine("Cursor", "CursorGlucosmium.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked)
        {
            return;
        }
        Building.BaseIncome *= new Number("20");
    }
}

internal class CursorGlimmeringue(BuildingDefinition building) : UpgradeDefinition(
    873,
    "Undecillion fingers",
    550,
    new Number(BigInteger.Pow(10, 31).ToString()),
    "Multiplies the gain from Thousand fingers by 20.",
    UpgradeType.Glimmeringue,
    building,
    Utils.LoadImage(Path.Combine("Cursor", "CursorGlimmeringue.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked)
        {
            return;
        }
        Building.BaseIncome *= new Number("20");
    }
}
