
using AutoGambler.Interfaces;

namespace AutoGambler.Games.Blackjack;

public class BasicStrategy : IPlayerStrategy
{
    public PlayerAction DecideAction(Hand playerHand, Card dealerUpCard, int balance, int currentBet)
    {
        int playerTotal = playerHand.TotalValue;
        int dealerValue = (int)dealerUpCard.Rank;

        // Very simplified basic strategy logic
        if (playerTotal >= 17) return PlayerAction.Stand;
        if (playerTotal >= 13 && dealerValue <= 6) return PlayerAction.Stand;
        if (playerTotal == 11 && balance >= currentBet * 2) return PlayerAction.DoubleDown;

        return PlayerAction.Hit;
    }
}
