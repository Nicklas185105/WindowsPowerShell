using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class AntimatterCondenser : BuildingDefinition
{
    public AntimatterCondenser() : base(
        "Antimatter Condenser",
        new Number(BigInteger.Multiply(170, BigInteger.Pow(10, 12)).ToString()),
        new Number(BigInteger.Multiply(43, BigInteger.Pow(10, 7)).ToString()))
    { }
}