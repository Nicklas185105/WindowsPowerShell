namespace CookieClicker.DTO;

internal class SaveFile
{
    public Dictionary<string, string> Data { get; set; }
    public Dictionary<string, int> OwnedBuildings { get; set; }
}
