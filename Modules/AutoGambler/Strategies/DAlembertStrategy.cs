
using AutoGambler.Interfaces;

namespace AutoGambler.Strategies;

internal class DAlembertStrategy(int baseBet) : IBettingStrategy
{
    private readonly int _baseBet = baseBet;
    private int _currentStep = 0;

    public int NextBet(int lastBet, bool lastWin)
    {
        if (lastWin)
            _currentStep = Math.Max(0, _currentStep - 1);
        else
            _currentStep++;

        return _baseBet + (_currentStep * _baseBet);
    }

    public void Reset() => _currentStep = 0;
}
