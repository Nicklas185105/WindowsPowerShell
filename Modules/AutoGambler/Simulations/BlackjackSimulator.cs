using AutoGambler.Games.Blackjack;
using AutoGambler.Utils;

namespace AutoGambler.Simulations;

public class BlackjackSimulator
{
    public static void Run(int simulations, int startingBalance, int baseBet)
    {
        var strategy = new BasicStrategy();
        int totalWins = 0;
        int totalLosses = 0;
        int totalPushes = 0;
        int bankruptcies = 0;
        int totalNetProfit = 0;
        int totalRounds = 0;

        for (int i = 0; i < simulations; i++)
        {
            var manager = new BlackjackRoundManager(startingBalance, baseBet, strategy);
            int rounds = 0;

            while (manager.Balance >= baseBet && rounds < 100)
            {
                var result = manager.PlayRound();
                rounds++;

                if (result.Contains("Win"))
                    totalWins++;
                else if (result.Contains("Loss"))
                    totalLosses++;
                else if (result.Contains("Push"))
                    totalPushes++;
            }

            totalRounds += rounds;
            totalNetProfit += manager.Balance - startingBalance;
            if (manager.Balance < baseBet)
                bankruptcies++;
        }

        GamblerLogger.LogInfo("=== Blackjack Strategy Simulation Summary ===");
        GamblerLogger.LogInfo($"Simulations: {simulations}");
        GamblerLogger.LogInfo($"Total Rounds: {totalRounds}");
        GamblerLogger.LogInfo($"Wins: {totalWins}");
        GamblerLogger.LogInfo($"Losses: {totalLosses}");
        GamblerLogger.LogInfo($"Pushes: {totalPushes}");
        GamblerLogger.LogInfo($"Average Rounds per Simulation: {(double)totalRounds / simulations:F2}");
        GamblerLogger.LogInfo($"Average Net Profit: {(double)totalNetProfit / simulations:F2}");
        GamblerLogger.LogInfo($"Bankruptcies: {bankruptcies}");
        GamblerLogger.LogInfo("=============================================");
    }
}
