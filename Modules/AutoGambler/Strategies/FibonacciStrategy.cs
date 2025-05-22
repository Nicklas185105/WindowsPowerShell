
using AutoGambler.Interfaces;

namespace AutoGambler.Strategies;

internal class FibonacciStrategy(int baseBet) : IBettingStrategy
{
    private readonly int _baseBet = baseBet;
    private int _index = 0;
    private readonly List<int> _fibSequence = [1, 1];

    public int NextBet(int lastBet, bool lastWin)
    {
        if (lastWin)
            _index = Math.Max(0, _index - 2);
        else
            _index++;

        while (_index >= _fibSequence.Count)
        {
            int next = _fibSequence[^1] + _fibSequence[^2];
            _fibSequence.Add(next);
        }

        return _fibSequence[_index] * _baseBet;
    }

    public void Reset()
    {
        _index = 0;
    }
}
