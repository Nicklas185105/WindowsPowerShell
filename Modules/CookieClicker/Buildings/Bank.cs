using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class Bank : BuildingDefinition
{
    public Bank() : base(
        "Bank",
        new Number(BigInteger.Multiply(14, BigInteger.Pow(10, 6)).ToString()),
        new Number(BigInteger.Multiply(14, BigInteger.Pow(10, 2)).ToString()))
    { }
}