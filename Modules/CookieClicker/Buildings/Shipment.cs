using CookieClicker.Definitions;

namespace CookieClicker.Buildings;

internal class Shipment : BuildingDefinition
{
    public Shipment() : base(
        "Shipment",
        new Number("5100000000.0"),
        new Number("260000.0"))
    {
        Upgrades.Add(new ShipmentPlain(this));
        Upgrades.Add(new ShipmentBerrylium(this));
        Upgrades.Add(new ShipmentBlueberrylium(this));
        Upgrades.Add(new ShipmentChalcedhoney(this));
        Upgrades.Add(new ShipmentButtergold(this));
        Upgrades.Add(new ShipmentSugarmuck(this));
        Upgrades.Add(new ShipmentJetmint(this));
        Upgrades.Add(new ShipmentCherrysilver(this));
        Upgrades.Add(new ShipmentHazelrald(this));
        Upgrades.Add(new ShipmentMooncandy(this));
        Upgrades.Add(new ShipmentAstrofudge(this));
        Upgrades.Add(new ShipmentAlabascream(this));
        Upgrades.Add(new ShipmentIridyum(this));
        Upgrades.Add(new ShipmentGlucosmium(this));
        Upgrades.Add(new ShipmentGlimmeringue(this));
    }
}

internal class ShipmentPlain(BuildingDefinition building) : UpgradeDefinition(
    19,
    "Vanilla nebulae",
    1,
    new Number("51000000000"),
    "Shipments are twice as efficient.",
    UpgradeType.Plain,
    building,
    Utils.LoadImage(Path.Combine("Shipment", "ShipmentPlain.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class ShipmentBerrylium(BuildingDefinition building) : UpgradeDefinition(
    20,
    "Wormholes",
    5,
    new Number("255000000000"),
    "Shipments are twice as efficient.",
    UpgradeType.Berrylium,
    building,
    Utils.LoadImage(Path.Combine("Shipment", "ShipmentBerrylium.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class ShipmentBlueberrylium(BuildingDefinition building) : UpgradeDefinition(
    21,
    "Frequent flyer",
    25,
    new Number("2550000000000"),
    "Shipments are twice as efficient.",
    UpgradeType.Blueberrylium,
    building,
    Utils.LoadImage(Path.Combine("Shipment", "ShipmentBlueberrylium.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class ShipmentChalcedhoney(BuildingDefinition building) : UpgradeDefinition(
    48,
    "Warp drive",
    50,
    new Number("255000000000000"),
    "Shipments are twice as efficient.",
    UpgradeType.Chalcedhoney,
    building,
    Utils.LoadImage(Path.Combine("Shipment", "ShipmentChalcedhoney.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class ShipmentButtergold(BuildingDefinition building) : UpgradeDefinition(
    114,
    "Chocolate monoliths",
    100,
    new Number("25500000000000000"),
    "Shipments are twice as efficient.",
    UpgradeType.Buttergold,
    building,
    Utils.LoadImage(Path.Combine("Shipment", "ShipmentButtergold.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class ShipmentSugarmuck(BuildingDefinition building) : UpgradeDefinition(
    196,
    "Generation ship",
    150,
    new Number("2550000000000000000"),
    "Shipments are twice as efficient.",
    UpgradeType.Sugarmuck,
    building,
    Utils.LoadImage(Path.Combine("Shipment", "ShipmentSugarmuck.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class ShipmentJetmint(BuildingDefinition building) : UpgradeDefinition(
    301,
    "Dyson sphere",
    200,
    new Number("2550000000000000000000"),
    "Shipments are twice as efficient.",
    UpgradeType.Jetmint,
    building,
    Utils.LoadImage(Path.Combine("Shipment", "ShipmentJetmint.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class ShipmentCherrysilver(BuildingDefinition building) : UpgradeDefinition(
    314,
    "The final frontier",
    250,
    new Number("2550000000000000000000000"),
    "Shipments are twice as efficient.",
    UpgradeType.Cherrysilver,
    building,
    Utils.LoadImage(Path.Combine("Shipment", "ShipmentCherrysilver.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class ShipmentHazelrald(BuildingDefinition building) : UpgradeDefinition(
    435,
    "Autopilot",
    300,
    new Number("2550000000000000000000000000"),
    "Shipments are twice as efficient.",
    UpgradeType.Hazelrald,
    building,
    Utils.LoadImage(Path.Combine("Shipment", "ShipmentHazelrald.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class ShipmentMooncandy(BuildingDefinition building) : UpgradeDefinition(
    487,
    "Restaurants at the end of the universe",
    350,
    new Number("2550000000000000000000000000000"),
    "Shipments are twice as efficient.",
    UpgradeType.Mooncandy,
    building,
    Utils.LoadImage(Path.Combine("Shipment", "ShipmentMooncandy.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class ShipmentAstrofudge(BuildingDefinition building) : UpgradeDefinition(
    513,
    "Universal alphabet",
    400,
    new Number("25500000000000000000000000000000000"),
    "Shipments are twice as efficient.",
    UpgradeType.Astrofudge,
    building,
    Utils.LoadImage(Path.Combine("Shipment", "ShipmentAstrofudge.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class ShipmentAlabascream(BuildingDefinition building) : UpgradeDefinition(
    669,
    "Toroid universe",
    450,
    new Number("255000000000000000000000000000000000000"),
    "Shipments are twice as efficient.",
    UpgradeType.Alabascream,
    building,
    Utils.LoadImage(Path.Combine("Shipment", "ShipmentAlabascream.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class ShipmentIridyum(BuildingDefinition building) : UpgradeDefinition(
    707,
    "Prime directive",
    500,
    new Number("2550000000000000000000000000000000000000000"),
    "Shipments are twice as efficient.",
    UpgradeType.Iridyum,
    building,
    Utils.LoadImage(Path.Combine("Shipment", "ShipmentIridyum.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class ShipmentGlucosmium(BuildingDefinition building) : UpgradeDefinition(
    750,
    "Cosmic foreground radiation",
    550,
    new Number("25500000000000000000000000000000000000000000000"),
    "Shipments are twice as efficient.",
    UpgradeType.Glucosmium,
    building,
    Utils.LoadImage(Path.Combine("Shipment", "ShipmentGlucosmium.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class ShipmentGlimmeringue(BuildingDefinition building) : UpgradeDefinition(
    847,
    "At your doorstep in 30 minutes or your money back",
    600,
    new Number("255000000000000000000000000000000000000000000000000"),
    "Shipments are twice as efficient.",
    UpgradeType.Glimmeringue,
    building,
    Utils.LoadImage(Path.Combine("Shipment", "ShipmentGlimmeringue.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}
