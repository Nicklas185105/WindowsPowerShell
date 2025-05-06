using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class CortexBaker : BuildingDefinition
{
    public CortexBaker() : base(
        "Cortex Baker",
        new Number(BigInteger.Multiply(19, BigInteger.Pow(10, 24)).ToString()),
        new Number(BigInteger.Multiply(64, BigInteger.Pow(10, 12)).ToString()))
    { }
}