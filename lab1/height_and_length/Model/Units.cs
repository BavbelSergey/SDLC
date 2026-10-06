using System.ComponentModel;

namespace height_and_length;

public enum Units
{
    [Description("Дюйм")]
    Inch,
    [Description("Ярд")]
    Yard,
    [Description("Сантиметр")]
    Centemetre,
    [Description("Метр")]
    Meter,
    [Description("Американский таракан")]
    AmericanCockroach,
    [Description("Шея жирафа")]
    GiraffeNeck,
    [Description("Самая длинная змея")]
    LongestSnake,
    [Description("Человеческий язык")]
    HumanTongue,
    [Description("Футбольное поле")]
    FootballField,
}