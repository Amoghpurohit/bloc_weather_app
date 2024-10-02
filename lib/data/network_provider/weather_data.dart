import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/secrets.dart';

class WeatherData {
  Future<Either<String, String>> getWeatherData() async {
    try {
      //String cityName = 'London';
      final resp = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey',),
      );

      return Right(resp.body);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
