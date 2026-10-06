using height_and_length.Model;

namespace height_and_length.View;

public interface IConverterView
{
    string InputValue { get; }
    Units SelectedUnit1 { get; }
    Units SelectedUnit2 { get; }
    
    event EventHandler? InputChanged;
    
    void ShowResult(double? result);
}