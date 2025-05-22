using CookieClicker.Definitions;

namespace CookieClicker.Buildings;

internal class Temple : BuildingDefinition
{
    public Temple() : base(
        "Temple",
        new Number("20000000.0"),
        new Number("7800.0"))
    {
        Upgrades.Add(new TemplePlain(this));
        Upgrades.Add(new TempleSacrifices(this));
        Upgrades.Add(new TempleDeliciousBlessing(this));
        Upgrades.Add(new TempleSunFestival(this));
        Upgrades.Add(new TempleEnlargedPantheon(this));
        Upgrades.Add(new TempleGreatBaker(this));
        Upgrades.Add(new TempleCreationMyth(this));
        Upgrades.Add(new TempleTheocracy(this));
        Upgrades.Add(new TempleRapPrayers(this));
        Upgrades.Add(new TemplePsalmReading(this));
        Upgrades.Add(new TempleWarOfTheGods(this));
        Upgrades.Add(new TempleANovelIdea(this));
        Upgrades.Add(new TempleApparitions(this));
        Upgrades.Add(new TempleNegatheism(this));
        Upgrades.Add(new TempleTempleTraps(this));
    }
}

internal class TemplePlain(BuildingDefinition building) : UpgradeDefinition(
    238,
    "Golden idols",
    1,
    new Number("200000000"),
    "Temples are twice as efficient.",
    UpgradeType.Plain,
    building,
    Utils.LoadImage(Path.Combine("Temple", "TemplePlain.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class TempleSacrifices(BuildingDefinition building) : UpgradeDefinition(
    239,
    "Sacrifices",
    5,
    new Number("1000000000"),
    "Temples are twice as efficient.",
    UpgradeType.Berrylium,
    building,
    Utils.LoadImage(Path.Combine("Temple", "TempleSacrifices.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class TempleDeliciousBlessing(BuildingDefinition building) : UpgradeDefinition(
    240,
    "Delicious blessing",
    25,
    new Number("10000000000"),
    "Temples are twice as efficient.",
    UpgradeType.Blueberrylium,
    building,
    Utils.LoadImage(Path.Combine("Temple", "TempleDeliciousBlessing.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class TempleSunFestival(BuildingDefinition building) : UpgradeDefinition(
    241,
    "Sun festival",
    50,
    new Number("1000000000000"),
    "Temples are twice as efficient.",
    UpgradeType.Chalcedhoney,
    building,
    Utils.LoadImage(Path.Combine("Temple", "TempleSunFestival.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class TempleEnlargedPantheon(BuildingDefinition building) : UpgradeDefinition(
    242,
    "Enlarged pantheon",
    100,
    new Number("100000000000000"),
    "Temples are twice as efficient.",
    UpgradeType.Buttergold,
    building,
    Utils.LoadImage(Path.Combine("Temple", "TempleEnlargedPantheon.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class TempleGreatBaker(BuildingDefinition building) : UpgradeDefinition(
    243,
    "Great Baker in the sky",
    150,
    new Number("10000000000000000"),
    "Temples are twice as efficient.",
    UpgradeType.Sugarmuck,
    building,
    Utils.LoadImage(Path.Combine("Temple", "TempleGreatBaker.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class TempleCreationMyth(BuildingDefinition building) : UpgradeDefinition(
    299,
    "Creation myth",
    200,
    new Number("10000000000000000000"),
    "Temples are twice as efficient.",
    UpgradeType.Jetmint,
    building,
    Utils.LoadImage(Path.Combine("Temple", "TempleCreationMyth.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class TempleTheocracy(BuildingDefinition building) : UpgradeDefinition(
    312,
    "Theocracy",
    250,
    new Number("10000000000000000000000"),
    "Temples are twice as efficient.",
    UpgradeType.Cherrysilver,
    building,
    Utils.LoadImage(Path.Combine("Temple", "TempleTheocracy.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class TempleRapPrayers(BuildingDefinition building) : UpgradeDefinition(
    433,
    "Sick rap prayers",
    300,
    new Number("10000000000000000000000000"),
    "Temples are twice as efficient.",
    UpgradeType.Hazelrald,
    building,
    Utils.LoadImage(Path.Combine("Temple", "TempleRapPrayers.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class TemplePsalmReading(BuildingDefinition building) : UpgradeDefinition(
    485,
    "Psalm-reading",
    350,
    new Number("10000000000000000000000000000"),
    "Temples are twice as efficient.",
    UpgradeType.Mooncandy,
    building,
    Utils.LoadImage(Path.Combine("Temple", "TemplePsalmReading.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class TempleWarOfTheGods(BuildingDefinition building) : UpgradeDefinition(
    511,
    "War of the gods",
    400,
    new Number("100000000000000000000000000000000"),
    "Temples are twice as efficient.",
    UpgradeType.Astrofudge,
    building,
    Utils.LoadImage(Path.Combine("Temple", "TempleWarOfTheGods.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class TempleANovelIdea(BuildingDefinition building) : UpgradeDefinition(
    667,
    "A novel idea",
    450,
    new Number("1000000000000000000000000000000000000"),
    "Temples are twice as efficient.",
    UpgradeType.Alabascream,
    building,
    Utils.LoadImage(Path.Combine("Temple", "TempleANovelIdea.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class TempleApparitions(BuildingDefinition building) : UpgradeDefinition(
    705,
    "Apparitions",
    500,
    new Number("10000000000000000000000000000000000000000"),
    "Temples are twice as efficient.",
    UpgradeType.Iridyum,
    building,
    Utils.LoadImage(Path.Combine("Temple", "TempleApparitions.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class TempleNegatheism(BuildingDefinition building) : UpgradeDefinition(
    748,
    "Negatheism",
    550,
    new Number("100000000000000000000000000000000000000000000"),
    "Temples are twice as efficient.",
    UpgradeType.Glucosmium,
    building,
    Utils.LoadImage(Path.Combine("Temple", "TempleNegatheism.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}

internal class TempleTempleTraps(BuildingDefinition building) : UpgradeDefinition(
    845,
    "Temple traps",
    600,
    new Number("1000000000000000000000000000000000000000000000000"),
    "Temples are twice as efficient.",
    UpgradeType.Glimmeringue,
    building,
    Utils.LoadImage(Path.Combine("Temple", "TempleTempleTraps.png")))
{
    public override void Effect()
    {
        if (IsPurchased || !IsUnlocked) return;
        Building.BaseIncome *= new Number("2");
    }
}
