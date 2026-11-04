package WeatherDeskUseCases {
    part def User;
    part def Developer;
    part def WeatherDeskSubject;

    use case def FindCity {
        subject app : WeatherDeskSubject;
        actor user : User;
        objective { doc /* Найти нужный город по названию */ }
        include use case choose : ChooseCity;
    }
    use case def ChooseCity {
        include use case load : LoadForecast;
    }
    use case def LoadForecast {
        doc /* Запросить прогноз у внешнего сервиса */
    }
    use case def ShowError {
        doc /* Показать понятное сообщение об ошибке */
        extend use case base : LoadForecast;
    }
    use case def ShowCachedData {
        doc /* Показать сохранённые данные, если сеть недоступна */
        extend use case base : LoadForecast;
    }
    use case def ViewCurrentWeather { actor user : User; }
    use case def ViewHourlyForecast { actor user : User; }
    use case def ViewWeeklyForecast { actor user : User; }
    use case def SelectDay {
        doc /* Выбрать день недели и увидеть его почасовой прогноз */
        extend use case weekly : ViewWeeklyForecast;
        extend use case hourly : ViewHourlyForecast;
    }
    use case def RefreshData {
        actor user : User;
        include use case load : LoadForecast;
    }
    use case def ManageFavorites { actor user : User; }
    use case def ChangePressureUnit { actor user : User; }
    use case def ConnectAnotherProvider {
        actor developer : Developer;
        objective { doc /* Подключить другой источник данных без изменения интерфейса */ }
    }
}
