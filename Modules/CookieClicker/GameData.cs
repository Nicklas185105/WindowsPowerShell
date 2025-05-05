namespace CookieClicker
{
    public class GameData
    {
        // singleton instance
        private static GameData _instance;
        public static GameData Instance
        {
            get
            {
                if (_instance == null)
                {
                    _instance = new GameData();
                }
                return _instance;
            }
        }

        public Number Clicks { get; set; }
        public Number IdleIncome { get; set; }
        public Number ClickValue { get; set; }
        public DateTime LastSaveTime { get; set; }

        private GameData()
        {
            Clicks = new Number("0");
            IdleIncome = new Number("0");
            ClickValue = new Number("1");
            LastSaveTime = DateTime.Now;
        }
    }
}