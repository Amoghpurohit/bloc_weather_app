class WeatherModel {
  final String cod;
  final int cnt;
  final List<Forecast> list; // The list of forecasts

  WeatherModel({
    required this.cod,
    required this.cnt,
    required this.list,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      cod: map['cod'],
      cnt: map['cnt'],
      list: List<Forecast>.from(map['list'].map((x) => Forecast.fromMap(x))),
    );
  }
}

class Forecast {
  final Main main;
  final List<Weather> weather;
  final String dtTxt;
  final Wind wind;

  Forecast({
    required this.main,
    required this.weather,
    required this.dtTxt,
    required this.wind,
  });

  factory Forecast.fromMap(Map<String, dynamic> map) {
    return Forecast(
      main: Main.fromMap(map['main']),
      weather: List<Weather>.from(map['weather'].map((x) => Weather.fromMap(x))),
      dtTxt: map['dt_txt'],
      wind: Wind.fromMap(map['wind']),
    );
  }
}

class Main {
  final double temp;
  final int pressure;
  final int humidity;

  Main({required this.temp, required this.pressure, required this.humidity});

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: (map['temp'] is int) ? (map['temp'] as int).toDouble() : map['temp'],
      pressure: map['pressure'],
      humidity: map['humidity'],
    );
  }
}

class Weather {
  final String main;
  final String description;

  Weather({required this.main, required this.description});

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      main: map['main'],
      description: map['description'],
    );
  }
}

class Wind {
  final double speed;
  final double gust;

  Wind({required this.speed, required this.gust});

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: (map['speed'] is int) ? (map['speed'] as int).toDouble() : map['speed'],
      gust: (map['gust'] is int) ? (map['gust'] as int).toDouble() : map['gust'],
    );
  }
}
