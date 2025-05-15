using MaterialSkin.Controls;

namespace CookieClicker.Definitions;

internal abstract class UpgradeDefinition : MaterialCard
{
    public int ID { get; set; }
    private int RequiredCount { get; set; }
    private Number Cost { get; set; }
    private string Description { get; set; }
    public bool IsPurchased { get; set; } = false;
    public bool IsUnlocked { get; set; } = false;
    private UpgradeType Type { get; set; }
    public BuildingDefinition Building { get; set; }

    public UpgradeDefinition(int id, string name, int requiredCount, Number cost, string description, UpgradeType type, BuildingDefinition building)
    {
        ID = id;
        Name = name;
        RequiredCount = requiredCount;
        Cost = cost;
        Description = description;
        Type = type;
        Building = building;
        Visible = false;

        Padding = new Padding(5);
        Margin = new Padding(10);
        BackColor = Color.White;
        MouseClick += (_, _) => BuyUpgrade();
        Height = 75;
        Width = 75;
        //Dock = DockStyle.Fill;

        //var layout = new TableLayoutPanel
        //{
        //    Dock = DockStyle.Fill,
        //    ColumnCount = 2,
        //    RowCount = 1,
        //    Height = 40,
        //};
        //layout.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 60F));
        //layout.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 40F));

        var title = new Label
        {
            Text = id.ToString(),
            Dock = DockStyle.Fill,
            AutoSize = true,
            Font = new Font("Segoe UI", 16, FontStyle.Bold),
            TextAlign = ContentAlignment.MiddleCenter,
        };
        Controls.Add(title);
    }

    public virtual void BuyUpgrade()
    {
        if (IsPurchased || !IsUnlocked)
        {
            return;
        }

        if (GameData.Instance.Clicks >= Cost)
        {
            GameData.Instance.Clicks -= Cost;
            Effect();
            IsPurchased = true;
            Visible = false;
            GameData.Instance.CalculateIdleIncome();
        }
    }

    public virtual void UnlockCondition()
    {
        if (Building.Owned >= RequiredCount)
        {
            IsUnlocked = true;
        }
    }

    public virtual void Effect()
    {
        if (IsPurchased || !IsUnlocked)
        {
            return;
        }
    }
}
