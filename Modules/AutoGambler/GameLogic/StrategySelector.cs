using AutoGambler.Interfaces;
using AutoGambler.Strategies;

namespace AutoGambler.GameLogic;

internal static class StrategySelector
{
    public static IBettingStrategy SelectStrategy(string name, int baseBet)
    {
        return name.ToLower() switch
        {
            "martingale" => new MartingaleStrategy(baseBet),
            "flat" => new FlatBettingStrategy(baseBet),
            "reverse" => new ReverseMartingaleStrategy(baseBet),
            "dalembert" => new DAlembertStrategy(baseBet),
            "fibonacci" => new FibonacciStrategy(baseBet),
            _ => throw new ArgumentException("Unknown strategy name")
        };
    }

    public static IEnumerable<string> AvailableStrategies =>
    [
        "martingale",
        "reverse",
        "dalembert",
        "fibonacci",
        "flat"
    ];
}
