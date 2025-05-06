using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class AlchemyLab : BuildingDefinition
{
    public AlchemyLab() : base(
        "Alchemy Lab",
        new Number(BigInteger.Multiply(75, BigInteger.Pow(10, 9)).ToString()),
        new Number(BigInteger.Multiply(16, BigInteger.Pow(10, 5)).ToString()))
    { }
}