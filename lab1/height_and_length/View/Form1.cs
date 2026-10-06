using System.ComponentModel;
using System.Globalization;

namespace height_and_length.View;

using System;
using System.Linq;
using System.Windows.Forms;

public partial class Form1 : Form, IConverterView
{
    public event EventHandler? InputChanged;

    public Form1()
    {
        InitializeComponent();
        StartPosition = FormStartPosition.CenterScreen;

        InitializeComboBox(comboBox1);
        InitializeComboBox(comboBox2);

        textBox1.KeyDown += textBox1_KeyDown;
        MouseDown += Form1_MouseDown;
    }

    private void textBox1_KeyPress(object sender, KeyPressEventArgs e)
    {
        if (char.IsDigit(e.KeyChar)) return;
        
        var sep = CultureInfo.CurrentCulture.NumberFormat.NumberDecimalSeparator[0];
        if ((e.KeyChar == '.' || e.KeyChar == ',') &&
            !textBox1.Text.Contains(sep))
        {
            e.KeyChar = sep; 
            return;
        }
        
        if (e.KeyChar == '-' && textBox1.SelectionStart == 0 && !textBox1.Text.Contains('-'))
            return;
        
        if (e.KeyChar == (char)Keys.Back) return;
        
        e.Handled = true;
    }

    private void textBox1_KeyDown(object sender, KeyEventArgs e)
    {
        if (e.KeyCode == Keys.Enter)
        {
            e.SuppressKeyPress = true;
            ActiveControl = null;
        }
    }

    private void Form1_MouseDown(object sender, MouseEventArgs e)
    {
        if (textBox1.Focused)
            ActiveControl = null;
    }

    public string InputValue => textBox1.Text;

    public Units SelectedUnit1 =>
        comboBox1.SelectedItem is UnitItem item ? item.Value : Units.Meter;

    public Units SelectedUnit2 =>
        comboBox2.SelectedItem is UnitItem item ? item.Value : Units.Meter;

    [DesignerSerializationVisibility(DesignerSerializationVisibility.Hidden)]
    public void ShowResult(double? result)
    {
        label1.Text = result.HasValue
            ? $"{result.Value:0.####}"
            : "Введите число";
    }

    private void InitializeComboBox(ComboBox comboBox)
    {
        var items = Enum.GetValues(typeof(Units))
            .Cast<Units>()
            .Select(e => new UnitItem(e, GetEnumDescription(e)))
            .ToList();

        comboBox.DataSource = items;
        comboBox.DisplayMember = nameof(UnitItem.Description);
        comboBox.ValueMember = nameof(UnitItem.Value);
    }

    private static string GetEnumDescription(Enum value)
    {
        var fi = value.GetType().GetField(value.ToString());
        var attrs = (DescriptionAttribute[])fi!.GetCustomAttributes(typeof(DescriptionAttribute), false);
        return attrs.Length > 0 ? attrs[0].Description : value.ToString();
    }

    private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        => InputChanged?.Invoke(this, EventArgs.Empty);

    private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        => InputChanged?.Invoke(this, EventArgs.Empty);

    private void textBox1_TextChanged(object sender, EventArgs e)
        => InputChanged?.Invoke(this, EventArgs.Empty);

    private record UnitItem(Units Value, string Description);
}