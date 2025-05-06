using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class Shipment : BuildingDefinition
{
    public Shipment() : base(
        "Shipment",
        new Number(BigInteger.Multiply(51, BigInteger.Pow(10, 8)).ToString()),
        new Number(BigInteger.Multiply(26, BigInteger.Pow(10, 4)).ToString()))
    { }
}