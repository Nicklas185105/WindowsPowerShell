namespace CookieClicker
{
    public class CookieClicker
    {
        private readonly GameScreen gameScreen;

        public CookieClicker()
        {
            Console.WriteLine("" + GameData.Instance.LastSaveTime);
            gameScreen = new GameScreen();
        }

        public void ShowForm()
        {
            Application.Run(gameScreen);
        }
    }
}
