using MaterialSkin.Controls;

namespace CookieClicker.Definitions;

internal abstract class BuildingDefinition : MaterialCard
{
    private Number BaseCost { get; set; }
    private Number Cost => (BaseCost * new Number("1.15").Pow(new Number(Owned.ToString()))).Ceiling();
    public Number BaseIncome { get; set; }
    public Number Income => BaseIncome * new Number(Owned.ToString());
    public int Owned { get; set; }
    public List<UpgradeDefinition> Upgrades { get; set; } = new List<UpgradeDefinition>();

    private Label PriceLabel { get; set; }
    private Label OwnedLabel { get; set; }

    protected BuildingDefinition(string name, Number baseCost, Number baseIncome)
    {
        Name = name;
        BaseCost = baseCost;
        BaseIncome = baseIncome;
        Owned = 0;

        Padding = new Padding(10);
        Margin = new Padding(15, 0, 15, 15);
        BackColor = Color.White;
        MouseClick += (_, _) => BuyBuilding();
        //MouseDown
        Height = 100;

        var layout = new TableLayoutPanel
        {
            Dock = DockStyle.Fill,
            ColumnCount = 2,
            RowCount = 1,
            Height = 90,
            //BackColor = Color.Green //for testing
        };
        layout.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 60F));
        layout.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 40F));
        layout.MouseClick += (_, _) => BuyBuilding();

        var nameLayout = new TableLayoutPanel
        {
            Dock = DockStyle.Fill,
            ColumnCount = 1,
            RowCount = 2,
            Height = 10,
            //BackColor = Color.Red //for testing
        };
        nameLayout.RowStyles.Add(new RowStyle(SizeType.Percent, 60F));
        nameLayout.RowStyles.Add(new RowStyle(SizeType.Percent, 40F));
        nameLayout.MouseClick += (_, _) => BuyBuilding();

        var nameLabel = new Label
        {
            Text = name,
            Dock = DockStyle.Fill,
            AutoSize = true,
            Font = new Font("Segoe UI", 16, FontStyle.Bold),
            TextAlign = ContentAlignment.MiddleLeft
        };
        nameLabel.MouseClick += (_, _) => BuyBuilding();

        PriceLabel = new Label
        {
            Text = Cost.FormatCompact(),
            Dock = DockStyle.Fill,
            AutoSize = true,
            Font = new Font("Segoe UI", 12, FontStyle.Regular),
            TextAlign = ContentAlignment.MiddleLeft
        };
        PriceLabel.MouseClick += (_, _) => BuyBuilding();

        nameLayout.Controls.Add(nameLabel, 0, 0);
        nameLayout.Controls.Add(PriceLabel, 0, 1);

        OwnedLabel = new Label
        {
            Dock = DockStyle.Right,
            Text = Owned.ToString(),
            Font = new Font("Segoe UI", 28, FontStyle.Regular),
            ForeColor = Color.LightSlateGray,
            TextAlign = ContentAlignment.MiddleRight
        };
        OwnedLabel.MouseClick += (_, _) => BuyBuilding();

        layout.Controls.Add(nameLayout, 0, 0);
        layout.Controls.Add(OwnedLabel, 1, 0);

        Controls.Add(layout);

        GameData.Instance.OnPointsChanged += (s, e) =>
        {
            //Enabled = GameData.Instance.Clicks >= Cost;
            BackColor = IsEnabled() ? Color.FromArgb(102, 204, 153) : Color.FromArgb(180, 180, 180);
            ForeColor = IsEnabled() ? SystemColors.ControlText : Color.LightSlateGray;
            Cursor = IsEnabled() ? Cursors.Hand : Cursors.Arrow;
        };
    }

    private bool IsEnabled()
    {
        return GameData.Instance.Clicks >= Cost;
    }

    private void BuyBuilding()
    {
        if (!IsEnabled()) return;

        GameData.Instance.Clicks -= Cost;
        Owned++;

        GameData.Instance.Screen.RefreshUpgrades();

        GameData.Instance.CalculateIdleIncome();
        UpdateLabels();

        GameData.Instance.ClicksLabel.Text = $"Points: {GameData.Instance.Clicks.FormatCompact()}";
    }

    public void UpdateLabels()
    {
        PriceLabel.Text = Cost.FormatCompact();
        OwnedLabel.Text = Owned.ToString();
    }
}
