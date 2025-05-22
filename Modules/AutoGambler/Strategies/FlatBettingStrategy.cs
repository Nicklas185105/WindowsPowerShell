using AutoGambler.Interfaces;

namespace AutoGambler.Strategies;

internal class FlatBettingStrategy(int fixedBet) : IBettingStrategy
{
    private readonly int _fixedBet = fixedBet;

    public int NextBet(int lastBet, bool lastWin)
    {
        return _fixedBet;
    }

    public void Reset() { }
}
