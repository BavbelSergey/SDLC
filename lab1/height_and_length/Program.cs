using height_and_length.View;
using height_and_length.Controller;
using height_and_length.Model;

namespace height_and_length;

static class Program
{
    /// <summary>
    ///  The main entry point for the application.
    /// </summary>
    [STAThread]
    static void Main()
    {
        var model = new Converter();
        var view = new Form1();
        var controller = new ConverterController(model, view);
        Application.Run(view);
    }
}