using Timer = System.Windows.Forms.Timer;

namespace CookieClicker.UI;

internal class ToastNotification : Form
{
    private Timer _timer;

    public ToastNotification(string message, Form parentForm, int duration = 3000)
    {
        FormBorderStyle = FormBorderStyle.None;
        StartPosition = FormStartPosition.Manual;
        BackColor = Color.White;
        ForeColor = Color.Black;
        Size = new Size(300, 60);
        TopMost = true;
        ShowInTaskbar = false;

        // Determine which screen the parent form is on
        var screen = Screen.FromControl(parentForm);
        var screenBounds = screen.WorkingArea;

        // Position at bottom-right corner of that screen
        Location = new Point(screenBounds.Right - Width - 20, screenBounds.Bottom - Height - 20);

        var card = new MaterialSkin.Controls.MaterialCard
        {
            Dock = DockStyle.Fill,
            BackColor = Color.White,
            Padding = new Padding(10),
            ForeColor = Color.Black
        };

        var label = new MaterialSkin.Controls.MaterialLabel
        {
            Text = message,
            Dock = DockStyle.Fill,
            TextAlign = ContentAlignment.MiddleCenter,
            Font = new Font("Segoe UI", 10, FontStyle.Regular)
        };
        card.Controls.Add(label);
        Controls.Add(card);

        _timer = new Timer { Interval = duration };
        _timer.Tick += (s, e) =>
        {
            _timer.Stop();
            Close();
        };
    }

    protected override void OnShown(EventArgs e)
    {
        base.OnShown(e);
        _timer.Start();
    }
}

