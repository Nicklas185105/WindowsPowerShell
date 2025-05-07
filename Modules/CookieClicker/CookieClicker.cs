using CookieClicker.UI;

namespace CookieClicker;

public class CookieClicker
{
    private readonly GameScreen _gameScreen;
    private bool _gameLoaded = false;

    public CookieClicker()
    {
        try
        {
            GameData.Instance.CreateNewInstance();
            var gameLoaded = SavingLoading.LoadGame();
            _gameScreen = new GameScreen();
            if (gameLoaded)
                new ToastNotification("Game loaded from save file successfully!", _gameScreen).Show();
        }
        catch (Exception ex)
        {
            Console.WriteLine("Constructor failed: " + ex.Message);
            throw; // let it bubble up so you still see it in PowerShell
        }
    }

    public void ShowForm()
    {
        Application.Run(_gameScreen);
    }
}