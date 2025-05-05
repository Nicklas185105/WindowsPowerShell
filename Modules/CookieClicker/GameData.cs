namespace CookieClicker;

public class GameData
{
    // singleton instance
    private static GameData _instance;
    public static GameData Instance => _instance ??= new GameData();

    public Number Clicks { get; set; }
    public Number IdleIncome { get; set; }
    public Number ClickValue { get; set; }
    public DateTime LastSaveTime { get; set; }
    
    public Label ClicksLabel { get; set; }
    public Label IdleIncomeLabel { get; set; }
    
    public event EventHandler ClicksChanged;

    private GameData()
    {
        Clicks = new Number("0");
        IdleIncome = new Number("0");
        ClickValue = new Number("1");
        LastSaveTime = DateTime.Now;

        // ClicksChanged = (sender, args) =>
        // {
        //     Clicks++;
        //     if (ClicksLabel == null) return;
        //     ClicksLabel.Text = Clicks.ToString();
        // };
        //
        // ClicksChanged.Invoke(this, EventArgs.Empty);
    }
}