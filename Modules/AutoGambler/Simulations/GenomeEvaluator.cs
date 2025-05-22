using AutoGambler.Games.Blackjack;
using AutoGambler.Games.Blackjack.AI;

namespace AutoGambler.Simulations;

public class GenomeEvaluator
{
    public int Evaluate(BlackjackGenome genome, int startingBalance, int baseBet, int rounds)
    {
        var strategy = new GenomeStrategy(genome);
        var manager = new BlackjackRoundManager(startingBalance, baseBet, strategy);
        int totalProfit = 0;

        for (int i = 0; i < rounds; i++)
        {
            if (manager.Balance < baseBet) break;

            manager.PlayRound();
        }

        totalProfit = manager.Balance - startingBalance;
        return totalProfit;
    }
}
