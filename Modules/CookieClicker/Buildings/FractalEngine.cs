using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class FractalEngine : BuildingDefinition
{
    public FractalEngine() : base(
        "Fractal Engine",
        new Number(BigInteger.Multiply(31, BigInteger.Pow(10, 16)).ToString()),
        new Number(BigInteger.Multiply(15, BigInteger.Pow(10, 10)).ToString()))
    { }
}