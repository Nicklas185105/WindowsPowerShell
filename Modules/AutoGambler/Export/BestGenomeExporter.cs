using AutoGambler.Games.Blackjack.AI;
using System.Text.Json;

namespace AutoGambler.Export;

public static class BestGenomeExporter
{
    public static void SaveToJson(BlackjackGenome genome, string path)
    {
        var options = new JsonSerializerOptions { WriteIndented = true };
        var serializable = new SerializableGenome(genome);
        string json = JsonSerializer.Serialize(serializable, options);
        File.WriteAllText(path, json);
    }

    private class SerializableGenome
    {
        public Dictionary<string, string> Strategy { get; set; }

        public SerializableGenome(BlackjackGenome genome)
        {
            Strategy = [];
            foreach (var kvp in genome.StrategyRules)
            {
                string key = $"{kvp.Key.Item1}-{kvp.Key.Item2}";
                Strategy[key] = kvp.Value.ToString();
            }
        }
    }
}
