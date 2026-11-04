package WeatherDeskIcons {
    doc /* Соответствие кодов WMO (weather_code Open-Meteo) иконкам интерфейса. Рендер: 06-weather-icons.png */

    enum def WeatherIcon {
        clear_day; clear_night; partly_day; partly_night; cloudy;
        fog; drizzle; rain; snow; thunder;
    }

    part def IconRule {
        attribute wmoCodes : String;
        attribute icon : WeatherIcon;
        attribute dayOnly : Boolean = false;
        attribute nightOnly : Boolean = false;
    }

    part clear_day_rule     : IconRule { :>> wmoCodes = "0";               :>> icon = WeatherIcon::clear_day;    :>> dayOnly = true; }
    part clear_night_rule   : IconRule { :>> wmoCodes = "0";               :>> icon = WeatherIcon::clear_night;  :>> nightOnly = true; }
    part partly_day_rule    : IconRule { :>> wmoCodes = "1, 2";            :>> icon = WeatherIcon::partly_day;   :>> dayOnly = true; }
    part partly_night_rule  : IconRule { :>> wmoCodes = "1, 2";            :>> icon = WeatherIcon::partly_night; :>> nightOnly = true; }
    part cloudy_rule        : IconRule { :>> wmoCodes = "3";               :>> icon = WeatherIcon::cloudy; }
    part fog_rule           : IconRule { :>> wmoCodes = "45, 48";          :>> icon = WeatherIcon::fog; }
    part drizzle_rule       : IconRule { :>> wmoCodes = "51, 53, 55, 56, 57"; :>> icon = WeatherIcon::drizzle; }
    part rain_rule          : IconRule { :>> wmoCodes = "61, 63, 65, 66, 67, 80, 81, 82"; :>> icon = WeatherIcon::rain; }
    part snow_rule          : IconRule { :>> wmoCodes = "71, 73, 75, 77, 85, 86"; :>> icon = WeatherIcon::snow; }
    part thunder_rule       : IconRule { :>> wmoCodes = "95, 96, 99";      :>> icon = WeatherIcon::thunder; }
}
