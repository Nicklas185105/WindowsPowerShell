namespace CookieClicker;

public class CookieClicker
{
    private readonly GameScreen _gameScreen;

    public CookieClicker()
    {
        try
        {
            _gameScreen = new GameScreen();
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