
using AutoGambler.Games.Blackjack;

namespace AutoGambler.Interfaces;

public interface IPlayerStrategy
{
    PlayerAction DecideAction(Hand playerHand, Card dealerUpCard, int balance, int currentBet);
}

public enum PlayerAction
{
    Hit,
    Stand,
    DoubleDown
}
