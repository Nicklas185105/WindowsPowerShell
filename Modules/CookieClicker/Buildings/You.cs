using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class You : BuildingDefinition
{
    public You() : base(
        "You",
        new Number(BigInteger.Multiply(54, BigInteger.Pow(10, 25)).ToString()),
        new Number(BigInteger.Multiply(51, BigInteger.Pow(10, 14)).ToString()))
    { }
}