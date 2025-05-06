using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class Farm : BuildingDefinition
{
    public Farm() : base(
        "Farm",
        new Number(BigInteger.Multiply(11, BigInteger.Pow(10, 2)).ToString()),
        new Number("8"))
    { }
}