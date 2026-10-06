namespace height_and_length.View;

partial class Form1
{
    /// <summary>
    ///  Required designer variable.
    /// </summary>
    private System.ComponentModel.IContainer components = null;

    /// <summary>
    ///  Clean up any resources being used.
    /// </summary>
    /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
    protected override void Dispose(bool disposing)
    {
        if (disposing && (components != null))
        {
            components.Dispose();
        }
        base.Dispose(disposing);
    }

    #region Windows Form Designer generated code

    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {
        comboBox1 = new System.Windows.Forms.ComboBox();
        comboBox2 = new System.Windows.Forms.ComboBox();
        textBox1 = new System.Windows.Forms.TextBox();
        label1 = new System.Windows.Forms.Label();
        label2 = new System.Windows.Forms.Label();
        SuspendLayout();
        // 
        // comboBox1
        // 
        comboBox1.FormattingEnabled = true;
        comboBox1.Location = new System.Drawing.Point(182, 221);
        comboBox1.Name = "comboBox1";
        comboBox1.Size = new System.Drawing.Size(182, 28);
        comboBox1.TabIndex = 1;
        comboBox1.SelectedIndexChanged += comboBox1_SelectedIndexChanged;
        comboBox1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
        // 
        // comboBox2
        // 
        comboBox2.FormattingEnabled = true;
        comboBox2.Location = new System.Drawing.Point(578, 221);
        comboBox2.Name = "comboBox2";
        comboBox2.Size = new System.Drawing.Size(183, 28);
        comboBox2.TabIndex = 2;
        comboBox2.SelectedIndexChanged += comboBox2_SelectedIndexChanged;
        comboBox2.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
        // 
        // textBox1
        // 
        textBox1.Location = new System.Drawing.Point(44, 221);
        textBox1.Name = "textBox1";
        textBox1.PlaceholderText = "Введите число";
        textBox1.Size = new System.Drawing.Size(132, 27);
        textBox1.TabIndex = 3;
        textBox1.TextChanged += textBox1_TextChanged;
        textBox1.KeyPress += textBox1_KeyPress;
        // 
        // label1
        // 
        label1.Location = new System.Drawing.Point(471, 224);
        label1.Name = "label1";
        label1.Size = new System.Drawing.Size(101, 25);
        label1.TabIndex = 4;
        label1.Text = "Результат";
        label1.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
        // 
        // label2
        // 
        label2.Font = new System.Drawing.Font("Times New Roman", 36F, ((System.Drawing.FontStyle)(System.Drawing.FontStyle.Italic | System.Drawing.FontStyle.Underline)), System.Drawing.GraphicsUnit.Point, ((byte)204));
        label2.ForeColor = System.Drawing.Color.Red;
        label2.Location = new System.Drawing.Point(86, 61);
        label2.Name = "label2";
        label2.Size = new System.Drawing.Size(686, 104);
        label2.TabIndex = 5;
        label2.Text = "Конвертатор величин 2";
        // 
        // Form1
        // 
        AutoScaleDimensions = new System.Drawing.SizeF(8F, 20F);
        AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
        ClientSize = new System.Drawing.Size(800, 450);
        Controls.Add(label2);
        Controls.Add(label1);
        Controls.Add(textBox1);
        Controls.Add(comboBox2);
        Controls.Add(comboBox1);
        Text = "Конвертертатор величин";
        this.MouseDown += (s, e) => ClearFocus();
        label1.MouseDown += (s, e) => ClearFocus();
        label2.MouseDown += (s, e) => ClearFocus();
        comboBox1.MouseDown += (s, e) => ClearFocus();
        comboBox2.MouseDown += (s, e) => ClearFocus();
        ResumeLayout(false);
        PerformLayout();
    }

    private void ClearFocus()
    {
        if (textBox1.Focused)
        {
            ActiveControl = null;
            textBox1.SelectionLength = 0;
        }
    }
    
    private System.Windows.Forms.Label label2;

    private System.Windows.Forms.ComboBox comboBox2;

    private System.Windows.Forms.ComboBox comboBox1;
    private System.Windows.Forms.TextBox textBox1;
    private System.Windows.Forms.Label label1;
    #endregion
}
