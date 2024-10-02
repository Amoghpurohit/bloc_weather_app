part of 'weather_bloc.dart';


sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}


final class WeatherSuccess extends WeatherState{
  final WeatherModel weatherModel;

  WeatherSuccess({required this.weatherModel});
}

final class WeatherFailure extends WeatherState{
  final String errMsg;

  WeatherFailure({required this.errMsg});
}

final class WeatherLoading extends WeatherState{}
