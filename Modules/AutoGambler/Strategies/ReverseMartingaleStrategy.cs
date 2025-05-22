
using AutoGambler.Interfaces;

namespace AutoGambler.Strategies;

internal class ReverseMartingaleStrategy(int baseBet) : IBettingStrategy
{
    private readonly int _baseBet = baseBet;

    public int NextBet(int lastBet, bool lastWin)
    {
        return lastWin ? lastBet * 2 : _baseBet;
    }

    public void Reset() { }
}
