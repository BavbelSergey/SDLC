using System.ComponentModel;

namespace height_and_length.Model;

public class Converter
{
    private readonly Dictionary<Units, double> _units = new()
    {
        { Units.Inch, 0.0254 },
        { Units.Meter, 1 },
        { Units.Centemetre, 0.01 },
        { Units.AmericanCockroach, 0.05 },
        { Units.HumanTongue, 0.085 },
        { Units.Yard, 0.9144 },
        { Units.GiraffeNeck, 2 },
        { Units.LongestSnake, 7.22 },
        { Units.FootballField, 100 }
    };

    private double? _value;
    private Units _from = Units.Meter;
    private Units _to = Units.Meter;

    public event EventHandler<ConversionArgs>? ResultChanged;

    public void SetData(double? value, Units from, Units to)
    {
        _value = value;
        _from = from;
        _to = to;

        Validate();
        Calculate();
        Notify();
    }

    private void Validate()
    {
        if (_value is null || double.IsNaN(_value.Value))
        {
            _value = null;
            return;
        }
        
        if (!_units.ContainsKey(_from) || !_units.ContainsKey(_to))
            throw new ArgumentException("Неизвестная единица измерения");
    }

    private void Calculate()
    {
        if (_value is null)
        {
            _result = null;
            return;
        }

        _result = _value.Value * _units[_from] / _units[_to];
    }

    private double? _result;

    private void Notify()
        => ResultChanged?.Invoke(this, new ConversionArgs(_result, _from, _to));


}