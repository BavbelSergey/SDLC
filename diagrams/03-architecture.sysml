package WeatherDeskArchitecture {
    doc /* Слои приложения. Зависимости направлены сверху вниз: Presentation → Application ← Infrastructure */

    package Application {
        part def City      { attribute name : String; attribute country : String;
                             attribute latitude : Real; attribute longitude : Real; attribute timezone : String; }
        part def HourlyPoint { attribute time : String; attribute temperature : Real; attribute humidity : Real;
                               attribute pressureHpa : Real; attribute windMs : Real;
                               attribute weatherCode : Integer; attribute isDay : Boolean; }
        part def DailyPoint  { attribute date : String; attribute tempMin : Real; attribute tempMax : Real;
                               attribute weatherCode : Integer; }
        part def CurrentWeather { attribute temperature : Real; attribute humidity : Real;
                                  attribute pressureHpa : Real; attribute windMs : Real;
                                  attribute weatherCode : Integer; attribute isDay : Boolean; }
        part def Forecast    { part current : CurrentWeather; part hourly : HourlyPoint[168]; part daily : DailyPoint[7]; attribute fetchedAt : String; }

        port def IWeatherProvider { doc /* Task<Forecast> GetForecastAsync(City city) */ }
        port def ICityProvider    { doc /* Task<City[]> SearchAsync(string text) */ }
        port def IStorage         { doc /* настройки, избранное, кэш прогноза */ }
        part def WeatherCodeMapper { doc /* код WMO + is_day → иконка и русский текст */ }
    }

    package Infrastructure {
        part def OpenMeteoClient    { doc /* реализует IWeatherProvider, HttpClient + System.Text.Json */ }
        part def OpenMeteoGeocoding { doc /* реализует ICityProvider */ }
        part def JsonFileStorage    { doc /* реализует IStorage, файлы в %AppData% */ }
    }

    package Presentation {
        part def MainViewModel { doc /* зависит только от интерфейсов Application */ }
        part def MainWindow    { doc /* разметка окна, адаптивные состояния */ }
        part def Converters    { doc /* иконки и форматирование единиц измерения */ }
    }
}
