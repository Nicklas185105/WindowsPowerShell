using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class Grandma : BuildingDefinition
{
    public Grandma() : base(
        "Grandma",
        new Number(BigInteger.Pow(10, 2).ToString()),
        new Number("1"))
    { }
}