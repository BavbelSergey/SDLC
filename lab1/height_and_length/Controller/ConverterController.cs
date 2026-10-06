using height_and_length.Model;
using height_and_length.View;

namespace height_and_length.Controller;

public class ConverterController
{
    private readonly Converter _model;
    private readonly IConverterView _view;

    public ConverterController(Converter model, IConverterView view)
    {
        _model = model;
        _view = view;
        
        _view.InputChanged += OnInputChanged;
        
        _model.ResultChanged += OnResultChanged;
    }

    private void OnInputChanged(object? sender, EventArgs e)
    {
        double? value = double.TryParse(_view.InputValue, out var v) ? v : null;

        _model.SetData(value, _view.SelectedUnit1, _view.SelectedUnit2);
    }

    private void OnResultChanged(object? sender, ConversionArgs args)
        => _view.ShowResult(args.Result);
}