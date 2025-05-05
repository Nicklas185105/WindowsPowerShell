namespace CookieClicker;

public class CookieClicker
{
    private readonly GameScreen _gameScreen;

    public CookieClicker()
    {
        Console.WriteLine("" + GameData.Instance.LastSaveTime);
        _gameScreen = new GameScreen();
    }

    public void ShowForm()
    {
        Application.Run(_gameScreen);
    }
}