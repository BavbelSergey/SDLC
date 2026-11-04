package WeatherDeskStates {
    state def ScreenStates {
        entry action init;
        then state starting;
        state starting        { doc /* чтение настроек, выбор города */ }
        state loadingForecast { doc /* запрос к сервису, индикатор загрузки */ }
        state showingForecast { doc /* актуальные данные */ }
        state searchingCity   { doc /* подсказки поиска города */ }
        state showingCached   { doc /* данные из кэша и предупреждение */ }
        state showingError    { doc /* сообщение и кнопка «Повторить» */ }

        transition start_to_load first starting accept AppStarted then loadingForecast;
        transition load_ok       first loadingForecast accept ForecastReceived then showingForecast;
        transition load_cached   first loadingForecast accept NetworkError if cacheExists then showingCached;
        transition load_failed   first loadingForecast accept NetworkError if noCache then showingError;
        transition refresh       first showingForecast accept Refresh then loadingForecast;
        transition timer         first showingForecast accept Timer30Min then loadingForecast;
        transition type_search   first showingForecast accept SearchTextEntered then searchingCity;
        transition choose_city   first searchingCity accept CitySelected then loadingForecast;
        transition cancel_search first searchingCity accept SearchCancelled then showingForecast;
        transition cached_refresh first showingCached accept Refresh then loadingForecast;
        transition cached_search  first showingCached accept SearchTextEntered then searchingCity;
        transition retry         first showingError accept Retry then loadingForecast;
        transition error_search  first showingError accept SearchTextEntered then searchingCity;
    }
}
