using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class Chancemaker : BuildingDefinition
{
    public Chancemaker() : base(
        "Chancemaker",
        new Number(BigInteger.Multiply(26, BigInteger.Pow(10, 15)).ToString()),
        new Number(BigInteger.Multiply(21, BigInteger.Pow(10, 9)).ToString()))
    { }
}