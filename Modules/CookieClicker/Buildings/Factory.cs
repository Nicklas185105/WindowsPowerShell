using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class Factory : BuildingDefinition
{
    public Factory() : base(
        "Factory",
        new Number(BigInteger.Multiply(13, BigInteger.Pow(10, 4)).ToString()),
        new Number(BigInteger.Multiply(26, BigInteger.Pow(10, 1)).ToString()))
    { }
}