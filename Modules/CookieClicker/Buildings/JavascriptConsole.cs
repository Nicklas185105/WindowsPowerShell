using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class JavascriptConsole : BuildingDefinition
{
    public JavascriptConsole() : base(
        "Javascript Console",
        new Number(BigInteger.Multiply(71, BigInteger.Pow(10, 18)).ToString()),
        new Number(BigInteger.Multiply(11, BigInteger.Pow(10, 11)).ToString()))
    { }
}