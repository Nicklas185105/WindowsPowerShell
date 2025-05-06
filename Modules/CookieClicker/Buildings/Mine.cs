using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class Mine : BuildingDefinition
{
    public Mine() : base(
        "Mine",
        new Number(BigInteger.Multiply(12, BigInteger.Pow(10, 3)).ToString()),
        new Number("47"))
    { }
}