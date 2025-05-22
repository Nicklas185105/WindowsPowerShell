namespace AutoGambler.Interfaces;

internal interface IBettingStrategy
{
    int NextBet(int lastBet, bool lastWin);
    void Reset();
}
