using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class Cursor : BuildingDefinition
{
    public Cursor() : base(
        "Cursor",
        new Number((BigInteger.Pow(10, 1) + 5).ToString()),
        new Number("0.1"))
    { }
}