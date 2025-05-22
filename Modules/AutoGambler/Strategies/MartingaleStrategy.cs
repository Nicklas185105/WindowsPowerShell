
using AutoGambler.Interfaces;

namespace AutoGambler.Strategies;

internal class MartingaleStrategy(int baseBet) : IBettingStrategy
{
    private readonly int _baseBet = baseBet;

    public int NextBet(int lastBet, bool lastWin)
    {
        return lastWin ? _baseBet : lastBet * 2;
    }

    public void Reset() { }
}
