namespace CookieClicker
{
    internal static class Utils
    {
        public static Image LoadImage(string path)
        {
            string fullPath = Path.Combine(GameData.Instance.BasePath, "Assets", "Images", path);
            return File.Exists(fullPath) ? Image.FromFile(fullPath) : null;
        }
    }
}
