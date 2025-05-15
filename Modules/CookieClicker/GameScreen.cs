using CookieClicker.UI;
using MaterialSkin.Controls;

namespace CookieClicker;

internal class GameScreen : MaterialForm
{
    private Panel _leftPanel;
    private Panel _rightPanel;
    private TableLayoutPanel _upgradesLayout;

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

        // 🖱 Get the screen where the mouse cursor currently is
        var activeScreen = Screen.FromPoint(Cursor.Position);
        var workingArea = activeScreen.WorkingArea;

        // 🎯 Center the window in that screen
        var centerX = workingArea.Left + (workingArea.Width - Width) / 2;
        var centerY = workingArea.Top + (workingArea.Height - Height) / 2;

        StartPosition = FormStartPosition.Manual;
        Location = new Point(centerX, centerY);
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
            BackColor = Color.White
        };

        var statsGroup = new MaterialCard
        {
            Dock = DockStyle.Fill,
            BackColor = Color.White
        };

        var statsLayout = new TableLayoutPanel
        {
            Dock = DockStyle.Fill,
            RowCount = 10,
            ColumnCount = 1,
            Padding = new Padding(25, 0, 25, 0)
        };
        for (var i = 0; i < 10; i++)
            statsLayout.RowStyles.Add(new RowStyle(SizeType.Absolute, 50));

        GameData.Instance.ClicksLabel = new MaterialLabel
        {
            Text = $"Points: {GameData.Instance.Clicks.FormatCompact()}",
            Dock = DockStyle.Fill,
            TextAlign = ContentAlignment.MiddleCenter
        };
        GameData.Instance.IdleIncomeLabel = new MaterialLabel
        {
            Text = "Idle: 0 p/s",
            Dock = DockStyle.Fill,
            TextAlign = ContentAlignment.MiddleCenter
        };
        GameData.Instance.CalculateIdleIncome();
        _lastSaveLabel = new MaterialLabel
        {
            Text = $"Last Save: {GameData.Instance.LastSaveTime}",
            Dock = DockStyle.Fill,
            TextAlign = ContentAlignment.MiddleCenter
        };

        _clickButton = new MaterialButton
        {
            Text = "Click Me",
            Dock = DockStyle.Fill,
            Margin = new Padding(50, 0, 50, 0),
            Cursor = Cursors.Hand
        };
        _clickButton.Click += (_, _) =>
        {
            GameData.Instance.Clicks += GameData.Instance.ClickValue;
            GameData.Instance.ClicksLabel.Text = $"Points: {GameData.Instance.Clicks.FormatCompact()}";
        };

        _saveButton = new MaterialButton { Text = "Save Game", Dock = DockStyle.Fill, Cursor = Cursors.Hand };
        _saveButton.Click += (_, _) =>
        {
            SavingLoading.SaveGame();
            new ToastNotification("Game saved successfully!", this).Show();
            _lastSaveLabel.Text = $"Last Save: {GameData.Instance.LastSaveTime}";
        };

        _loadButton = new MaterialButton { Text = "Load Game", Dock = DockStyle.Fill, Cursor = Cursors.Hand };
        _resetButton = new MaterialButton { Text = "Reset Game", Dock = DockStyle.Fill, Cursor = Cursors.Hand };
        _exitButton = new MaterialButton { Text = "Quit Game", Dock = DockStyle.Fill, Cursor = Cursors.Hand };

        var saveLoadLayout = new TableLayoutPanel { Dock = DockStyle.Fill, ColumnCount = 2, RowCount = 1, Padding = new Padding(0), Margin = new Padding(0) };
        saveLoadLayout.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 50F));
        saveLoadLayout.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 50F));
        saveLoadLayout.Controls.Add(_saveButton, 0, 0);
        saveLoadLayout.Controls.Add(_loadButton, 1, 0);

        var resetExitLayout = new TableLayoutPanel { Dock = DockStyle.Fill, ColumnCount = 2, RowCount = 1 };
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

        statsGroup.Controls.Add(statsLayout);
        _leftPanel.Controls.Add(statsGroup);

        // Right Panel
        _rightPanel = new Panel
        {
            Dock = DockStyle.Fill,
            Padding = new Padding(0),
            Margin = new Padding(0),
            AutoScroll = true,
            BackColor = Color.WhiteSmoke
        };

        var rightPanelLayout = new TableLayoutPanel
        {
            Dock = DockStyle.Fill,
            Padding = new Padding(0),
            Margin = new Padding(0),
            ColumnCount = 1,
            RowCount = 2,
            AutoSize = true,
            AutoSizeMode = AutoSizeMode.GrowAndShrink
        };
        rightPanelLayout.RowStyles.Add(new RowStyle(SizeType.Absolute, 110));
        rightPanelLayout.RowStyles.Add(new RowStyle(SizeType.Percent, 100F));

        var upgradesGroup = new MaterialCard
        {
            Dock = DockStyle.Fill,
            Padding = new Padding(0),
            Margin = new Padding(15, 15, 15, 0),
            BackColor = Color.WhiteSmoke
        };

        var upgradeScroll = new ScrollableControl
        {
            Dock = DockStyle.Fill,
            Padding = new Padding(0),
            Margin = new Padding(0),
            AutoScroll = true,
        };

        _upgradesLayout = new TableLayoutPanel
        {
            AutoSize = true,
            Padding = new Padding(0),
            Margin = new Padding(0),
            AutoSizeMode = AutoSizeMode.GrowAndShrink,
            Dock = DockStyle.Top,
            RowCount = 1,
        };

        var buildingsGroup = new MaterialCard
        {
            Dock = DockStyle.Fill,
            Padding = new Padding(0),
            Margin = new Padding(15, 15, 15, 15),
            BackColor = Color.WhiteSmoke
        };

        var buildingScroll = new ScrollableControl
        {
            Dock = DockStyle.Fill,
            Padding = new Padding(0),
            Margin = new Padding(0),
            AutoScroll = true
        };

        var buildingsLayout = new TableLayoutPanel
        {
            AutoSize = true,
            AutoSizeMode = AutoSizeMode.GrowAndShrink,
            Padding = new Padding(0),
            Margin = new Padding(0),
            Dock = DockStyle.Top,
            ColumnCount = 1,
        };

        int buildingCount = GameData.Instance.BuildingDefinitions.Count;
        for (var i = 0; i < buildingCount; i++)
        {
            buildingsLayout.RowStyles.Add(new RowStyle(SizeType.Absolute, 100));
            buildingsLayout.RowCount++;
        }

        foreach (var building in GameData.Instance.BuildingDefinitions)
        {
            if (building.Name == "Cursor") building.Margin = new Padding(15, 15, 15, 15);
            building.Dock = DockStyle.Fill;
            buildingsLayout.Controls.Add(building);
        }

        upgradeScroll.Controls.Add(_upgradesLayout);
        upgradesGroup.Controls.Add(upgradeScroll);
        rightPanelLayout.Controls.Add(upgradesGroup, 0, 0);

        buildingsLayout.Height = 90 * buildingCount;
        buildingScroll.Controls.Add(buildingsLayout);
        buildingsGroup.Controls.Add(buildingScroll);

        rightPanelLayout.Controls.Add(buildingsGroup, 0, 1);
        _rightPanel.Controls.Add(rightPanelLayout);

        layout.Controls.Add(_leftPanel, 0, 0);
        layout.Controls.Add(_rightPanel, 1, 0);

        GameData.Instance.IdleTimer.Tick += AutoClickerTimer_Tick;
        Controls.Add(layout);
    }

    private void AutoClickerTimer_Tick(object sender, EventArgs e)
    {
        GameData.Instance.Clicks += GameData.Instance.IdleIncome;
        GameData.Instance.ClicksLabel.Text = $"Points: {GameData.Instance.Clicks.FormatCompact()}";
    }

    public void RefreshUpgrades()
    {
        _upgradesLayout.Controls.Clear();

        int visible = 0;

        foreach (var building in GameData.Instance.BuildingDefinitions)
        {
            foreach (var upgrade in building.Upgrades)
            {
                upgrade.UnlockCondition();

                if (upgrade.Visible || upgrade.IsPurchased) continue;

                if (upgrade.IsUnlocked)
                {
                    _upgradesLayout.Controls.Add(upgrade);
                    upgrade.Visible = true;
                    visible++;
                }
            }
        }

        _upgradesLayout.ColumnCount = visible;
        for (var i = 0; i < visible; i++)
        {
            _upgradesLayout.ColumnStyles.Add(new ColumnStyle(SizeType.Absolute, 95));
        }
    }
}