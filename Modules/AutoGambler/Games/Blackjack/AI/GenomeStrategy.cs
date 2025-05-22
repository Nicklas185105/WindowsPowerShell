using AutoGambler.Interfaces;

namespace AutoGambler.Games.Blackjack.AI;

public class GenomeStrategy(BlackjackGenome genome) : IPlayerStrategy
{
    private readonly BlackjackGenome _genome = genome;

    public PlayerAction DecideAction(Hand playerHand, Card dealerUpCard, int balance, int currentBet)
    {
        int playerTotal = playerHand.TotalValue;
        int dealerValue = (int)dealerUpCard.Rank;

        if (dealerValue == 1) dealerValue = 11; // Ace as 11 for simplicity

        if (_genome.StrategyRules.TryGetValue((playerTotal, dealerValue), out var action))
        {
            if (action == PlayerAction.DoubleDown && balance < currentBet * 2)
                return PlayerAction.Hit;
            return action;
        }

        return PlayerAction.Hit;
    }
}
