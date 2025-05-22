using AutoGambler.GameLogic;
using AutoGambler.Simulations;
using AutoGambler.Utils;

namespace AutoGambler;

public class AutoGambler(int startingBalance, int baseBet)
{
    public int Wins { get; private set; }
    public int Losses { get; private set; }

    public int TotalWinnings { get; private set; }
    public int TotalLossings { get; private set; }

    public int HighestBetSize { get; private set; } = baseBet;
    public int HighestBalance { get; private set; }

    private readonly int _startingBalance = startingBalance;
    private readonly int _baseBet = baseBet;

    public void Start(string strategyName)
    {
        var strategy = StrategySelector.SelectStrategy(strategyName, _baseBet);
        var game = new CoinFlipGame(_startingBalance, _baseBet);
        var betSize = _baseBet;
        strategy.Reset();
        GamblerLogger.LogInfo("Starting Coin Flip Gambler...");

        while (game.CanPlay())
        {
            var result = game.PlayRound();
            var win = result.StartsWith("Win");

            if (win)
            {
                GamblerLogger.LogWin(result);
                Wins++;
                TotalWinnings += betSize;
            }
            else
            {
                GamblerLogger.LogLoss(result);
                Losses++;
                TotalLossings += betSize;
            }

            betSize = strategy.NextBet(betSize, win);
            game.UpdateBetSize(betSize);
            HighestBetSize = Math.Max(HighestBetSize, betSize);
            HighestBalance = Math.Max(HighestBalance, game.Balance);

            //Thread.Sleep(50);
        }

        GamblerLogger.LogInfo("Game over! Balance too low to continue.");
        PrintSummary();
    }

    public static void ListStrategies()
    {
        GamblerLogger.LogInfo("Available Strategies:");
        foreach (var strategy in StrategySelector.AvailableStrategies)
        {
            GamblerLogger.LogInfo($"- {strategy}");
        }
    }

    public void Simulate(int simulations)
    {
        BlackjackSimulator.Run(simulations, _startingBalance, _baseBet);
    }

    public void Trainer()
    {
        var trainer = new GenomeTrainer(
            populationSize: 100,
            generations: 1000,
            startingBalance: _startingBalance,
            baseBet: _baseBet,
            roundsPerGenome: 100000
        );
        trainer.Train();
    }

    private void PrintSummary()
    {
        GamblerLogger.LogInfo("=== Summary ===");
        GamblerLogger.LogInfo($"Wins: {Wins}");
        GamblerLogger.LogInfo($"Losses: {Losses}");
        GamblerLogger.LogInfo($"Total Winnings: {TotalWinnings}");
        GamblerLogger.LogInfo($"Total Losses: {TotalLossings}");
        GamblerLogger.LogInfo($"Net Profit: {TotalWinnings - TotalLossings}");
        GamblerLogger.LogInfo($"Highest Bet Size: {HighestBetSize}");
        GamblerLogger.LogInfo($"Highest Balance: {HighestBalance}");
    }
}
