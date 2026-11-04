package WeatherDeskContext {
    doc /* Контекст приложения WeatherDesk: десктопный клиент прогноза погоды (C#, .NET) */

    part def User;                  // человек, который смотрит прогноз
    part def ForecastApi;           // Open-Meteo: GET /v1/forecast
    part def GeocodingApi;          // Open-Meteo: GET /v1/search
    part def UserFileSystem;        // %AppData%/WeatherDesk

    part def Presentation {
        part mainWindow : MainWindow;
        part viewModel  : MainViewModel;
    }
    part def Services {
        part weatherService : WeatherService;
        part cityService    : CityService;
        part localStore     : LocalStore;
    }
    part def WeatherDeskApp {
        part presentation : Presentation;
        part services     : Services;
    }

    interface def HttpsJson {
        doc /* HTTPS GET, ответ application/json, таймаут 10 секунд */
    }
    interface def FileJson {
        doc /* чтение и запись settings.json и cache.json */
    }

    part system   : WeatherDeskApp;
    part user     : User;
    part forecast : ForecastApi;
    part geocoder : GeocodingApi;
    part fs       : UserFileSystem;

    connection useApp   connect user to system.presentation.mainWindow;
    connection bind     connect system.presentation.mainWindow to system.presentation.viewModel;
    connection loadWeather connect system.presentation.viewModel to system.services.weatherService;
    connection findCity    connect system.presentation.viewModel to system.services.cityService;
    connection keepState   connect system.presentation.viewModel to system.services.localStore;
    connection getForecast : HttpsJson connect system.services.weatherService to forecast;
    connection getCities   : HttpsJson connect system.services.cityService to geocoder;
    connection files       : FileJson  connect system.services.localStore to fs;
}
