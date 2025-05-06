using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class Prism : BuildingDefinition
{
    public Prism() : base(
        "Prism",
        new Number(BigInteger.Multiply(21, BigInteger.Pow(10, 14)).ToString()),
        new Number(BigInteger.Multiply(29, BigInteger.Pow(10, 8)).ToString()))
    { }
}