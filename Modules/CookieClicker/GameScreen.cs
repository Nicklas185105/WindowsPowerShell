namespace CookieClicker
{
    public class GameScreen : Form
    {
        private Panel leftPanel;
        private Panel rightPanel;

        // UI Elements for the stats panel
        private Label pointsLabel;
        private Label idleLabel;
        private Label lastSaveLabel;
        private Button clickButton;
        private Button saveButton;
        private Button loadButton;
        private Button resetButton;
        private Button exitButton;

        public GameScreen()
        {
            InitializeComponent();
        }

        private void InitializeComponent()
        {
            this.Text = "Cookie Clicker UI";
            this.Width = 1000;
            this.Height = 600;

            var layout = new TableLayoutPanel
            {
                Dock = DockStyle.Fill,
                ColumnCount = 2,
                RowCount = 1
            };
            layout.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 40F));
            layout.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 60F));

            // Left Panel
            leftPanel = new Panel
            {
                Dock = DockStyle.Fill,
                BackColor = System.Drawing.Color.LightGray
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
                ColumnCount = 1
            };
            for (int i = 0; i < 10; i++)
            {
                statsLayout.RowStyles.Add(new RowStyle(SizeType.Absolute, 40));
            }

            pointsLabel = new Label { Text = "Points: 0", Dock = DockStyle.Fill, TextAlign = System.Drawing.ContentAlignment.MiddleCenter };
            idleLabel = new Label { Text = "Idle: 0 p/s", Dock = DockStyle.Fill, TextAlign = System.Drawing.ContentAlignment.MiddleCenter };
            lastSaveLabel = new Label { Text = "Last Save: Not saved yet", Dock = DockStyle.Fill, TextAlign = System.Drawing.ContentAlignment.MiddleCenter };

            clickButton = new Button { Text = "Click Me", Dock = DockStyle.Fill };
            saveButton = new Button { Text = "Save Game", Dock = DockStyle.Fill };
            loadButton = new Button { Text = "Load Game", Dock = DockStyle.Fill };
            resetButton = new Button { Text = "Reset Game", Dock = DockStyle.Fill };
            exitButton = new Button { Text = "Quit Game", Dock = DockStyle.Fill };

            statsLayout.Controls.Add(pointsLabel);
            statsLayout.Controls.Add(idleLabel);
            statsLayout.Controls.Add(lastSaveLabel);
            statsLayout.Controls.Add(clickButton);
            statsLayout.Controls.Add(saveButton);
            statsLayout.Controls.Add(loadButton);
            statsLayout.Controls.Add(resetButton);
            statsLayout.Controls.Add(exitButton);

            statsGroup.Controls.Add(statsLayout);
            leftPanel.Controls.Add(statsGroup);

            // Right Panel
            rightPanel = new Panel
            {
                Dock = DockStyle.Fill,
                AutoScroll = true,
                BackColor = System.Drawing.Color.WhiteSmoke
            };

            var buildingsGroup = new GroupBox
            {
                Text = "Buildings",
                Dock = DockStyle.Fill
            };
            rightPanel.Controls.Add(buildingsGroup);

            // Add panels to layout
            layout.Controls.Add(leftPanel, 0, 0);
            layout.Controls.Add(rightPanel, 1, 0);

            // Add layout to form
            this.Controls.Add(layout);
        }
    }
}
