package WeatherDeskUiMockups {
    doc /* GUI-прототип WeatherDesk. Рендер: 05-ui-main.png, 05-ui-adaptive.png, 05-ui-states.png */

    enum def LayoutMode { wide; medium; compact; }
    enum def PressureUnit { mmHg; hPa; }

    part def Tile { attribute label : String; attribute value : String; attribute unit : String; }
    part def HourCard { attribute time : String; attribute icon : String; attribute temperature : Integer; }
    part def DayRow  { attribute day : String; attribute icon : String; attribute tempMin : Integer; attribute tempMax : Integer; }
    part def Banner  { attribute kind : String; attribute text : String; }

    part mainWindow {
        attribute minWidth = 400;
        attribute minHeight = 600;
        part searchBox { attribute placeholder = "Поиск города"; }
        part favoriteButton;
        part refreshButton;
        part unitSwitch { attribute unit : PressureUnit = PressureUnit::mmHg; }
        part updatedLabel { attribute text = "Обновлено в 14:32"; }
        part currentWeather {
            attribute city = "Минск, Беларусь";
            attribute temperature = "+4°C";
            attribute description = "Небольшой дождь";
            attribute minMax = "Мин +1°  Макс +6°";
            part humidity : Tile { :>> label = "Влажность"; :>> value = "87"; :>> unit = "%"; }
            part pressure : Tile { :>> label = "Давление"; :>> value = "745"; :>> unit = "мм рт. ст."; }
            part wind     : Tile { :>> label = "Ветер"; :>> value = "5"; :>> unit = "м/с"; }
        }
        part hourlyForecast {
            part now : HourCard { :>> time = "Сейчас"; :>> icon = "rain"; :>> temperature = 4; }
            part h15 : HourCard { :>> time = "15:00"; :>> icon = "rain"; :>> temperature = 4; }
            part h16 : HourCard { :>> time = "16:00"; :>> icon = "cloudy"; :>> temperature = 3; }
        }
        part weeklyForecast {
            part d0 : DayRow { :>> day = "Ср, 4 ноя"; :>> icon = "rain"; :>> tempMin = 1; :>> tempMax = 6; }
            part d1 : DayRow { :>> day = "Чт, 5 ноя"; :>> icon = "cloudy"; :>> tempMin = 0; :>> tempMax = 4; }
            part d2 : DayRow { :>> day = "Пт, 6 ноя"; :>> icon = "partly_day"; :>> tempMin = -1; :>> tempMax = 3; }
        }
        part attribution { attribute text = "Weather data by Open-Meteo.com"; }
    }

    part layoutWide    { attribute mode : LayoutMode = LayoutMode::wide;    doc /* ширина ≥ 900 px: две колонки */ }
    part layoutMedium  { attribute mode : LayoutMode = LayoutMode::medium;  doc /* 600–899 px: одна колонка, статистика справа от температуры */ }
    part layoutCompact { attribute mode : LayoutMode = LayoutMode::compact; doc /* < 600 px: одна колонка, горизонтальная прокрутка часов */ }

    part notFound      : Banner { :>> kind = "info";    :>> text = "Город не найден. Проверьте написание и повторите поиск."; }
    part cachedBanner  : Banner { :>> kind = "warning"; :>> text = "Нет подключения к интернету. Показаны сохранённые данные."; }
    part errorBanner   : Banner { :>> kind = "error";   :>> text = "Не удалось получить прогноз. Проверьте подключение к интернету."; }
    part serviceBanner : Banner { :>> kind = "error";   :>> text = "Сервис погоды временно недоступен."; }
}
