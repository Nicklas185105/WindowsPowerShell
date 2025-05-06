using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class Idleverse : BuildingDefinition
{
    public Idleverse() : base(
        "Idleverse",
        new Number(BigInteger.Multiply(12, BigInteger.Pow(10, 21)).ToString()),
        new Number(BigInteger.Multiply(83, BigInteger.Pow(10, 11)).ToString()))
    { }
}