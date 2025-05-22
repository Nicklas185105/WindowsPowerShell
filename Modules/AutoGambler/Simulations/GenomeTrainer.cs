using AutoGambler.Export;
using AutoGambler.Games.Blackjack.AI;
using AutoGambler.Utils;

namespace AutoGambler.Simulations;

public class GenomeTrainer(int populationSize, int generations, int startingBalance, int baseBet, int roundsPerGenome, double mutationRate = 0.05)
{
    private readonly int _populationSize = populationSize;
    private readonly int _generations = generations;
    private readonly int _startingBalance = startingBalance;
    private readonly int _baseBet = baseBet;
    private readonly int _roundsPerGenome = roundsPerGenome;
    private readonly double _mutationRate = mutationRate;
    private readonly string _logFile = "training_log.csv";
    private readonly List<(BlackjackGenome genome, int score)> _hallOfFame = [];

    public void Train()
    {
        var evaluator = new GenomeEvaluator();
        var population = new List<(BlackjackGenome genome, int score)>();

        for (int i = 0; i < _populationSize; i++)
        {
            var genome = new BlackjackGenome();
            int score = evaluator.Evaluate(genome, _startingBalance, _baseBet, _roundsPerGenome);
            population.Add((genome, score));
        }

        using var writer = new StreamWriter(_logFile);
        writer.WriteLine("Generation,BestScore,AverageScore");

        var rng = new Random();

        for (int gen = 1; gen <= _generations; gen++)
        {
            population = population.OrderByDescending(x => x.score).ToList();
            var best = population.First();
            double avg = population.Average(x => x.score);

            GamblerLogger.LogInfo($">>> Gen {gen}: Best {best.score} | Avg {avg:F2}");
            writer.WriteLine($"{gen},{best.score},{avg:F2}");

            // Add best to Hall of Fame if it's better than previous
            if (_hallOfFame.Count < 5 || best.score > _hallOfFame.Min(x => x.score))
            {
                _hallOfFame.Add(best);
                _hallOfFame.Sort((a, b) => b.score.CompareTo(a.score));
                if (_hallOfFame.Count > 5)
                    _hallOfFame.RemoveAt(_hallOfFame.Count - 1);
            }

            int eliteCount = _populationSize / 10;
            var nextGen = population.Take(eliteCount).ToList();

            while (nextGen.Count < _populationSize)
            {
                // Crossover
                var parent1 = population[rng.Next(eliteCount)].genome;
                var parent2 = population[rng.Next(eliteCount)].genome;

                var child = Crossover(parent1, parent2).CloneAndMutate(_mutationRate);
                int score = evaluator.Evaluate(child, _startingBalance, _baseBet, _roundsPerGenome);
                nextGen.Add((child, score));
            }

            population = nextGen;
        }

        GamblerLogger.LogInfo("Training complete.");
        var topGenome = _hallOfFame.First().genome;
        BestGenomeExporter.SaveToJson(topGenome, "best_genome.json");
        GamblerLogger.LogInfo("Best genome saved.");
    }

    private BlackjackGenome Crossover(BlackjackGenome a, BlackjackGenome b)
    {
        var child = new BlackjackGenome();
        var keys = a.StrategyRules.Keys;

        foreach (var key in keys)
        {
            child.StrategyRules[key] = (new Random().NextDouble() < 0.5)
                ? a.StrategyRules[key]
                : b.StrategyRules[key];
        }

        return child;
    }
}
