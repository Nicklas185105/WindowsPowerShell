using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class Temple : BuildingDefinition
{
    public Temple() : base(
        "Temple",
        new Number(BigInteger.Multiply(20, BigInteger.Pow(10, 6)).ToString()),
        new Number(BigInteger.Multiply(78, BigInteger.Pow(10, 2)).ToString()))
    { }
}