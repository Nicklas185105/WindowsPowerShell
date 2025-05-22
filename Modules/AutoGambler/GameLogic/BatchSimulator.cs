using AutoGambler.Utils;

namespace AutoGambler.GameLogic;

internal class BatchSimulator
{
    public static void RunSimulations(int simulations, int startingBalance, int baseBet)
    {
        foreach (var strategyName in StrategySelector.AvailableStrategies)
        {
            int totalWins = 0;
            int totalLosses = 0;
            int longestWinStreak = 0;
            int longestLossStreak = 0;
            int bankruptcies = 0;
            int totalBetsPlaced = 0;
            long totalBetAmount = 0;
            long totalNetProfit = 0;
            long totalROI = 0;
            int maxBetSize = 0;
            int totalSessionLength = 0;
            int maxDrawdown = 0;

            for (int i = 0; i < simulations; i++)
            {
                var strategy = StrategySelector.SelectStrategy(strategyName, baseBet);
                var game = new CoinFlipGame(startingBalance, baseBet);
                int bet = baseBet;
                int winStreak = 0;
                int lossStreak = 0;
                int sessionBets = 0;
                int highestBetInSession = 0;

                int currentBalance = startingBalance;
                int peakBalance = startingBalance;

                strategy.Reset();

                while (game.CanPlay())
                {
                    var result = game.PlayRound();
                    bool win = result.StartsWith("Win");

                    if (win)
                    {
                        totalWins++;
                        winStreak++;
                        lossStreak = 0;
                    }
                    else
                    {
                        totalLosses++;
                        lossStreak++;
                        winStreak = 0;
                    }

                    longestWinStreak = Math.Max(longestWinStreak, winStreak);
                    longestLossStreak = Math.Max(longestLossStreak, lossStreak);

                    totalBetAmount += bet;
                    totalBetsPlaced++;
                    sessionBets++;
                    highestBetInSession = Math.Max(highestBetInSession, bet);

                    bet = strategy.NextBet(bet, win);
                    game.UpdateBetSize(bet);

                    currentBalance = game.Balance;
                    peakBalance = Math.Max(peakBalance, currentBalance);
                    int drawdown = peakBalance - currentBalance;
                    maxDrawdown = Math.Max(maxDrawdown, drawdown);
                }

                if (!game.CanPlay())
                    bankruptcies++;

                int netProfit = game.Balance - startingBalance;
                totalNetProfit += netProfit;
                totalROI += (long)(((double)netProfit / startingBalance) * 100);
                maxBetSize = Math.Max(maxBetSize, highestBetInSession);
                totalSessionLength += sessionBets;
            }

            double winRate = totalBetsPlaced > 0 ? (double)totalWins / totalBetsPlaced * 100 : 0;
            double averageBet = totalBetsPlaced > 0 ? (double)totalBetAmount / totalBetsPlaced : 0;
            double averageSessionLength = simulations > 0 ? (double)totalSessionLength / simulations : 0;
            double averageNetProfit = simulations > 0 ? (double)totalNetProfit / simulations : 0;
            double averageROI = simulations > 0 ? (double)totalROI / simulations : 0;

            GamblerLogger.LogInfo($"--- Strategy: {strategyName} ---");
            GamblerLogger.LogInfo($"Total Bets Placed: {totalBetsPlaced}");
            GamblerLogger.LogInfo($"Total Wins: {totalWins}");
            GamblerLogger.LogInfo($"Total Losses: {totalLosses}");
            GamblerLogger.LogInfo($"Win Rate: {winRate:F2}%");
            GamblerLogger.LogInfo($"Average Bet Size: {averageBet:F2}");
            GamblerLogger.LogInfo($"Max Bet Size: {maxBetSize}");
            GamblerLogger.LogInfo($"Longest Win Streak: {longestWinStreak}");
            GamblerLogger.LogInfo($"Longest Loss Streak: {longestLossStreak}");
            GamblerLogger.LogInfo($"Average Session Length: {averageSessionLength:F2} bets");
            GamblerLogger.LogInfo($"Average Net Profit: {averageNetProfit:F2}");
            GamblerLogger.LogInfo($"Average ROI: {averageROI:F2}%");
            GamblerLogger.LogInfo($"Max Drawdown Observed: {maxDrawdown}");
            GamblerLogger.LogInfo($"Bankruptcies: {bankruptcies}");
            GamblerLogger.LogInfo("----------------------------\n");
        }
    }
}
