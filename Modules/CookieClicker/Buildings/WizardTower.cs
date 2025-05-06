using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class WizardTower : BuildingDefinition
{
    public WizardTower() : base(
        "Wizard Tower",
        new Number(BigInteger.Multiply(33, BigInteger.Pow(10, 7)).ToString()),
        new Number(BigInteger.Multiply(44, BigInteger.Pow(10, 3)).ToString()))
    { }
}