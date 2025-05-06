using CookieClicker.Definitions;
using System.Numerics;

namespace CookieClicker.Buildings;

internal class TimeMachine : BuildingDefinition
{
    public TimeMachine() : base(
        "Time Machine",
        new Number(BigInteger.Multiply(14, BigInteger.Pow(10, 12)).ToString()),
        new Number(BigInteger.Multiply(65, BigInteger.Pow(10, 6)).ToString()))
    { }
}
