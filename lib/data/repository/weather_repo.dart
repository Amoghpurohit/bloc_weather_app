

import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:weather_app/data/network_provider/weather_data.dart';
import 'package:weather_app/models/weather_model2.dart';

class WeatherRepo{
  final WeatherData weatherData;

  WeatherRepo({required this.weatherData});
  
  Future<Either<String, WeatherModel>> getHandledData() async{
    try{
      final rawData = await weatherData.getWeatherData();

      final decodedData = jsonDecode(rawData.getRight().getOrElse(() => ''));   //getOrElse extracts the data within it or allows us to set a value incase the value is not present

      //Using getOrElse on Option<String>: This ensures you safely extract the string from Option<String>. If the Option is None, you provide a fallback (in this case, an empty string).
      //Check for an empty string: If the Option was None, the fallback empty string will help prevent trying to decode an invalid JSON string.

      if(decodedData['cod'] != "200"){
        return Left(decodedData['message']);
      }
      return Right(WeatherModel.fromMap(decodedData),);

    }catch(e){
      return Left(e.toString());
    }
    
  }
}