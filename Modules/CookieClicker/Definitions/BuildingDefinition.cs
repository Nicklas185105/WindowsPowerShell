namespace CookieClicker.Definitions;

public abstract class BuildingDefinition : GroupBox
{
    // public string Name { get; set; }
    private Number BaseCost { get; set; }
    private Number Cost => (BaseCost * new Number("1.15").Pow(new Number(Owned.ToString()))).Ceiling();
    private Number BaseIncome { get; set; }
    public Number Income => BaseIncome * new Number(Owned.ToString());
    private int Owned { get; set; }

    private Label PriceLabel { get; set; }
    private Label OwnedLabel { get; set; }

    protected BuildingDefinition(string name, Number baseCost, Number baseIncome)
    {
        Name = name;
        BaseCost = baseCost;
        BaseIncome = baseIncome;
        Owned = 0;
        
        var layout = new TableLayoutPanel
        {
            Dock = DockStyle.Fill,
            ColumnCount = 2,
            RowCount = 1,
            Height = 90
        };
        layout.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 60F));
        layout.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 40F));
        layout.MouseClick += (_, _) => BuyBuilding();

        var nameLayout = new TableLayoutPanel
        {
            Dock = DockStyle.Fill,
            ColumnCount = 1,
            RowCount = 2,
            Height = 10
        };
        nameLayout.RowStyles.Add(new RowStyle(SizeType.Percent, 60F));
        nameLayout.RowStyles.Add(new RowStyle(SizeType.Percent, 40F));
        nameLayout.MouseClick += (_, _) => BuyBuilding();
        
        var nameLabel = new Label
        {
            Text = name,
            AutoSize = true,
            Font = new Font("Georgia", 20, FontStyle.Bold)
        };
        nameLabel.MouseClick += (_, _) => BuyBuilding();
        
        PriceLabel = new Label
        {
            Text = Cost.FormatCompact(),
            AutoSize = true,
            Font = new Font("Georgia", 12, FontStyle.Regular)
        };
        PriceLabel.MouseClick += (_, _) => BuyBuilding();
        
        nameLayout.Controls.Add(nameLabel,0,0);
        nameLayout.Controls.Add(PriceLabel,0,1);
        
        OwnedLabel = new Label
        {
            Dock = DockStyle.Right,
            Text = Owned.ToString(),
            AutoSize = true,
            Font = new Font("Georgia", 32, FontStyle.Regular),
            ForeColor = Color.LightSlateGray,
            TextAlign = ContentAlignment.MiddleRight
        };
        OwnedLabel.MouseClick += (_, _) => BuyBuilding();
        
        layout.Controls.Add(nameLayout,0,0);
        layout.Controls.Add(OwnedLabel,1,0);
        
        Controls.Add(layout);
        
        // Set the size of the control
        Height = 100;
        Padding = new Padding(10, 0,10,10);
        MouseClick += (_, _) => BuyBuilding();
    }

    private void BuyBuilding()
    {
        if (GameData.Instance.Clicks < Cost) return;
        
        GameData.Instance.Clicks -= Cost;
        Owned++;
            
        // Update idle income
            
        PriceLabel.Text = Cost.FormatCompact();
        OwnedLabel.Text = Owned.ToString();
        
        GameData.Instance.ClicksLabel.Text = $"Points: {GameData.Instance.Clicks}";
    }
}