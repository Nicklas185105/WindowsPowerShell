using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class Portal : BuildingDefinition
{
    public Portal() : base(
        "Portal",
        new Number(BigInteger.Pow(10, 12).ToString()),
        new Number(BigInteger.Multiply(10, BigInteger.Pow(10, 6)).ToString()))
    { }
}