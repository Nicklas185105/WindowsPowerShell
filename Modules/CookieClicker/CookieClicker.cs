using CookieClicker.UI;

namespace CookieClicker;

public class CookieClicker
{
    private readonly GameScreen _gameScreen;
    private bool _gameLoaded = false;

    public CookieClicker(string basePath)
    {
        try
        {
            GameData.Instance.CreateNewInstance(basePath);
            var gameLoaded = SavingLoading.LoadGame();
            _gameScreen = new GameScreen();
            if (gameLoaded)
                new ToastNotification("Game loaded from save file successfully!", _gameScreen).Show();
            _gameScreen.RefreshUpgrades();
            GameData.Instance.Screen = _gameScreen;
        }
        catch (Exception ex)
        {
            Console.WriteLine("Constructor failed: " + ex.Message);
            throw; // let it bubble up so you still see it in PowerShell
        }
    }

    [STAThread]
    public void ShowForm()
    {
        Application.Run(_gameScreen);
    }
}