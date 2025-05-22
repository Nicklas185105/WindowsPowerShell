using AutoGambler.Interfaces;

namespace AutoGambler.Games.Blackjack;

public class BlackjackRoundManager(int initialBalance, int bet, IPlayerStrategy strategy)
{
    private readonly BlackjackGame _game = new BlackjackGame();
    private readonly IPlayerStrategy _strategy = strategy;

    public int Balance { get; private set; } = initialBalance;
    public int Bet { get; private set; } = bet;

    public string PlayRound()
    {
        _game.StartNewGame();

        bool doubledDown = false;
        while (true)
        {
            var action = _strategy.DecideAction(_game.PlayerHand, _game.DealerHand.Cards[0], Balance, Bet);

            if (action == PlayerAction.Hit)
            {
                _game.PlayerHit();
                if (_game.PlayerHand.IsBust) break;
            }
            else if (action == PlayerAction.DoubleDown && Balance >= Bet * 2)
            {
                Bet *= 2;
                _game.PlayerHit();
                doubledDown = true;
                break; // player only gets one card after doubling down
            }
            else
            {
                break;
            }

            if (doubledDown)
                break;
        }

        _game.DealerTurn();
        var result = _game.DetermineOutcome();

        if (result == "Win")
            Balance += Bet;
        else if (result == "Loss")
            Balance -= Bet;

        return $"Outcome: {result} | Player: {_game.PlayerHand.TotalValue} vs Dealer: {_game.DealerHand.TotalValue} | Bet: {Bet} | Balance: {Balance}";
    }
}
