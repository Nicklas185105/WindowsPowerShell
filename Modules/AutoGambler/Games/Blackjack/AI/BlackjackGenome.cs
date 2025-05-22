using AutoGambler.Interfaces;

namespace AutoGambler.Games.Blackjack.AI;

public class BlackjackGenome
{
    public Dictionary<(int, int), PlayerAction> StrategyRules { get; private set; }
    private static readonly Random Rng = new();

    public BlackjackGenome()
    {
        StrategyRules = [];

        // Initialize for player totals 4 to 21 vs dealer 2-11
        for (int playerTotal = 4; playerTotal <= 21; playerTotal++)
        {
            for (int dealerCard = 2; dealerCard <= 11; dealerCard++)
            {
                StrategyRules[(playerTotal, dealerCard)] = RandomAction();
            }
        }
    }

    private static PlayerAction RandomAction()
    {
        int roll = Rng.Next(3);
        return roll switch
        {
            0 => PlayerAction.Hit,
            1 => PlayerAction.Stand,
            2 => PlayerAction.DoubleDown,
            _ => PlayerAction.Hit
        };
    }

    public BlackjackGenome CloneAndMutate(double mutationRate = 0.05)
    {
        var clone = new BlackjackGenome();
        foreach (var key in StrategyRules.Keys)
        {
            if (Rng.NextDouble() < mutationRate)
                clone.StrategyRules[key] = RandomAction();
            else
                clone.StrategyRules[key] = StrategyRules[key];
        }
        return clone;
    }
}
