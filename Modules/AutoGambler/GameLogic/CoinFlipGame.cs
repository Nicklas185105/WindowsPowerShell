
namespace AutoGambler.GameLogic;

internal class CoinFlipGame
{
    private int _betAmount;
    public int Balance { get; private set; }
    private readonly Random _random;

    public CoinFlipGame(int startingBalance, int betAmount)
    {
        Balance = startingBalance;
        _betAmount = betAmount;
        _random = new Random();
    }

    public void UpdateBetSize(int amount) => _betAmount = amount;

    public bool CanPlay() => Balance >= _betAmount;

    public string PlayRound()
    {
        var flip = _random.Next(0, 2); // 0 = lose, 1 = win

        if (flip == 1)
        {
            Balance += _betAmount;
            return $"Win! Gained {_betAmount}. New balance: {Balance}";
        }
        else
        {
            Balance -= _betAmount;
            return $"Lose! Lost {_betAmount}. New balance: {Balance}";
        }
    }
}