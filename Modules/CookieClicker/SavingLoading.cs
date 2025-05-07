using CookieClicker.DTO;
using System.Text.Json;

namespace CookieClicker;

internal static class SavingLoading
{
    public static void SaveGame()
    {
        // Get user data directory
        string userDataDirectory = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "CookieClicker");
        // Create directory if it doesn't exist
        if (!Directory.Exists(userDataDirectory))
        {
            Directory.CreateDirectory(userDataDirectory);
        }
        // Get current date and time
        var now = DateTime.Now;
        // Format date and time to be used in file name
        string formattedDate = now.ToString();
        // Create file name
        string fileName = "save_data.json";
        // Create full path for the file
        string filePath = Path.Combine(userDataDirectory, fileName);

        // Define save data
        var data = new SaveFile
        {
            Data = [],
            OwnedBuildings = GameData.Instance.BuildingDefinitions.ToDictionary(b => b.Name, b => b.Owned)
        };
        data.Data.Add("Clicks", GameData.Instance.Clicks.ToString());
        data.Data.Add("LastSaveTime", formattedDate);

        // Serialize the game state to JSON
        string json = JsonSerializer.Serialize(data, new JsonSerializerOptions { WriteIndented = true });
        // Write the JSON to the file
        File.WriteAllText(filePath, json);
        // Notify the user that the game has been saved
        Console.WriteLine($"Game saved to {filePath}");
    }

    public static bool LoadGame()
    {
        // Get user data directory
        string userDataDirectory = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "CookieClicker");
        // Create full path for the file
        string filePath = Path.Combine(userDataDirectory, "save_data.json");

        // Check if the save file exists
        if (!File.Exists(filePath))
        {
            Console.WriteLine("Save file not found.");
            return false;
        }

        // Read the JSON from the file
        string json = File.ReadAllText(filePath);
        // Deserialize the JSON to a SaveFile object
        var data = JsonSerializer.Deserialize<SaveFile>(json);

        // Load the game state from the data
        GameData.Instance.Clicks = new Number(data.Data["Clicks"]);
        GameData.Instance.LastSaveTime = DateTime.Parse(data.Data["LastSaveTime"]);
        foreach (var building in GameData.Instance.BuildingDefinitions)
        {
            if (data.OwnedBuildings.TryGetValue(building.Name, out int owned))
            {
                building.Owned = owned;
                building.UpdateLabels();
            }
        }
        // Notify the user that the game has been loaded
        Console.WriteLine($"Game loaded from {filePath}");
        return true;
    }
}
