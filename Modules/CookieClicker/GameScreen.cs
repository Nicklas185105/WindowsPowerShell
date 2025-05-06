using Timer = System.Windows.Forms.Timer;

namespace CookieClicker;

public class GameScreen : Form
{
    private Panel _leftPanel;
    private Panel _rightPanel;

    // UI Elements for the stats panel
    // private Label _pointsLabel;
    // private Label _idleLabel;
    private Label _lastSaveLabel;
    private Button _clickButton;
    private Button _saveButton;
    private Button _loadButton;
    private Button _resetButton;
    private Button _exitButton;

    public GameScreen()
    {
        InitializeComponent();
    }

    private void InitializeComponent()
    {
        Text = "Cookie Clicker";
        Width = 1000;
        Height = 600;

        var layout = new TableLayoutPanel
        {
            Dock = DockStyle.Fill,
            ColumnCount = 2,
            RowCount = 1
        };
        layout.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 40F));
        layout.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 60F));

        // Left Panel
        _leftPanel = new Panel
        {
            Dock = DockStyle.Fill,
            BackColor = Color.LightGray
        };

        var statsGroup = new GroupBox
        {
            Text = "Stats",
            Dock = DockStyle.Fill
        };

        // Create a vertical layout panel for stat controls
        var statsLayout = new TableLayoutPanel
        {
            Dock = DockStyle.Fill,
            RowCount = 10,
            ColumnCount = 1,
            Padding = new Padding(25, 0, 25, 0)
        };
        for (var i = 0; i < 10; i++)
        {
            statsLayout.RowStyles.Add(new RowStyle(SizeType.Absolute, 40));
        }

        GameData.Instance.ClicksLabel = new Label { Text = "Points: 0", Dock = DockStyle.Fill, TextAlign = ContentAlignment.MiddleCenter };
        GameData.Instance.IdleIncomeLabel = new Label { Text = "Idle: 0 p/s", Dock = DockStyle.Fill, TextAlign = ContentAlignment.MiddleCenter };
        _lastSaveLabel = new Label { Text = "Last Save: Not saved yet", Dock = DockStyle.Fill, TextAlign = ContentAlignment.MiddleCenter };

        _clickButton = new Button { Text = "Click Me", Dock = DockStyle.Fill, Margin = new Padding(50, 0, 50, 0), Cursor = Cursors.Hand };
        _clickButton.Click += (_, _) =>
        {
            // Increment points on button click
            GameData.Instance.Clicks += GameData.Instance.ClickValue;
            GameData.Instance.ClicksLabel.Text = $"Points: {GameData.Instance.Clicks.FormatCompact()}";
        };
        _saveButton = new Button { Text = "Save Game", Dock = DockStyle.Fill, Cursor = Cursors.Hand };
        _loadButton = new Button { Text = "Load Game", Dock = DockStyle.Fill, Cursor = Cursors.Hand };
        _resetButton = new Button { Text = "Reset Game", Dock = DockStyle.Fill, Cursor = Cursors.Hand };
        _exitButton = new Button { Text = "Quit Game", Dock = DockStyle.Fill, Cursor = Cursors.Hand };

        var saveLoadLayout = new TableLayoutPanel
        {
            Dock = DockStyle.Fill,
            ColumnCount = 2,
            RowCount = 1
        };
        saveLoadLayout.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 50F));
        saveLoadLayout.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 50F));
        saveLoadLayout.Controls.Add(_saveButton, 0, 0);
        saveLoadLayout.Controls.Add(_loadButton, 1, 0);

        var resetExitLayout = new TableLayoutPanel
        {
            Dock = DockStyle.Fill,
            ColumnCount = 2,
            RowCount = 1
        };
        resetExitLayout.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 50F));
        resetExitLayout.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 50F));
        resetExitLayout.Controls.Add(_resetButton, 0, 0);
        resetExitLayout.Controls.Add(_exitButton, 1, 0);

        statsLayout.Controls.Add(GameData.Instance.ClicksLabel, 0, 0);
        statsLayout.Controls.Add(GameData.Instance.IdleIncomeLabel, 0, 1);
        statsLayout.Controls.Add(_clickButton, 0, 3);
        statsLayout.Controls.Add(saveLoadLayout, 0, 5);
        statsLayout.Controls.Add(resetExitLayout, 0, 6);
        statsLayout.Controls.Add(_lastSaveLabel, 0, 7);
        // statsLayout.Controls.Add(_clickButton,0,9);

        statsGroup.Controls.Add(statsLayout);
        _leftPanel.Controls.Add(statsGroup);

        // Right Panel
        _rightPanel = new Panel
        {
            Dock = DockStyle.Fill,
            AutoScroll = true,
            BackColor = Color.WhiteSmoke
        };

        var buildingsGroup = new GroupBox
        {
            Text = "Buildings",
            Dock = DockStyle.Fill
        };

        var buildingScroll = new ScrollableControl
        {
            Dock = DockStyle.Fill,
            AutoScroll = true
        };

        // Create a vertical layout panel for stat controls
        var buildingsLayout = new TableLayoutPanel
        {
            AutoSize = true,
            AutoSizeMode = AutoSizeMode.GrowAndShrink,
            Dock = DockStyle.Top,
            //RowCount = 15,
            ColumnCount = 1,
            // Padding = new Padding(25, 0, 25, 0)
        };
        int buildingCount = GameData.Instance.BuildingDefinitions.Count;
        for (var i = 0; i < buildingCount; i++)
        {
            buildingsLayout.RowStyles.Add(new RowStyle(SizeType.Absolute, 90));
            buildingsLayout.RowCount++;
        }
        //for (var i = 0; i < 15; i++)
        //{
        //    buildingsLayout.RowStyles.Add(new RowStyle(SizeType.Absolute, 90));
        //}

        foreach (var building in GameData.Instance.BuildingDefinitions)
        {
            building.Dock = DockStyle.Fill;
            building.Cursor = Cursors.Hand;
            building.Enabled = false;
            buildingsLayout.Controls.Add(building);
        }

        buildingsLayout.Height = 90 * buildingCount;

        buildingScroll.Controls.Add(buildingsLayout);
        buildingsGroup.Controls.Add(buildingScroll);
        _rightPanel.Controls.Add(buildingsGroup);

        // Add panels to layout
        layout.Controls.Add(_leftPanel, 0, 0);
        layout.Controls.Add(_rightPanel, 1, 0);

        GameData.Instance.IdleTimer = new Timer
        {
            Interval = 1000 // 1 second per tick
        };
        GameData.Instance.IdleTimer.Tick += AutoClickerTimer_Tick;

        // Add layout to form
        Controls.Add(layout);
    }

    private void AutoClickerTimer_Tick(object sender, EventArgs e)
    {
        GameData.Instance.Clicks += GameData.Instance.IdleIncome;
        GameData.Instance.ClicksLabel.Text = $"Points: {GameData.Instance.Clicks.FormatCompact()}";
    }
}