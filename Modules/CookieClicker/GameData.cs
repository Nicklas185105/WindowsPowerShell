using CookieClicker.Buildings;
using CookieClicker.Definitions;
using Cursor = CookieClicker.Buildings.Cursor;
using Timer = System.Windows.Forms.Timer;

namespace CookieClicker;

public class GameData
{
    // singleton instance
    private static GameData _instance;
    public static GameData Instance => _instance ??= new GameData();

    private Number _clicks;
    private List<BuildingDefinition> _buildingDefinitions;

    public Number Clicks
    {
        get => _clicks;
        set
        {
            if (_clicks != value)
            {
                _clicks = value;
                OnPointsChanged?.Invoke(this, EventArgs.Empty);
            }
        }
    }
    public Number IdleIncome { get; set; }
    public Number ClickValue { get; set; }
    public DateTime LastSaveTime { get; set; }
    public List<BuildingDefinition> BuildingDefinitions => _buildingDefinitions ??= CreateBuildings();

    public Label ClicksLabel { get; set; }
    public Label IdleIncomeLabel { get; set; }
    public Timer IdleTimer { get; set; }

    public event EventHandler OnPointsChanged;

    private GameData()
    {
        Clicks = new Number("0");
        IdleIncome = new Number("0");
        ClickValue = new Number("1");
        LastSaveTime = DateTime.Now;
    }

    public void CalculateIdleIncome()
    {
        IdleIncome = new Number("0");
        foreach (var def in BuildingDefinitions)
        {
            IdleIncome += def.Income;
        }
        IdleIncomeLabel.Text = $"Idle: {IdleIncome.FormatCompact()} p/s";
        Console.WriteLine($"IdleIncome: {IdleIncome.ToString()}");
        if (!IdleTimer.Enabled && IdleIncome > new Number("0"))
            IdleTimer.Start();
    }

    private List<BuildingDefinition> CreateBuildings()
    {
        var builder = new List<BuildingDefinition>();

        Console.WriteLine("Creating Buildings");
        builder.Add(new Cursor());
        builder.Add(new Grandma());
        builder.Add(new Farm());
        builder.Add(new Mine());
        builder.Add(new Factory());
        builder.Add(new Bank());
        builder.Add(new Temple());
        builder.Add(new WizardTower());
        builder.Add(new Shipment());
        builder.Add(new AlchemyLab());
        builder.Add(new Portal());
        builder.Add(new TimeMachine());
        builder.Add(new AntimatterCondenser());
        builder.Add(new Prism());
        builder.Add(new Chancemaker());
        builder.Add(new FractalEngine());
        builder.Add(new JavascriptConsole());
        builder.Add(new Idleverse());
        builder.Add(new CortexBaker());
        builder.Add(new You());

        return builder;
    }
}