import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:weather_app/data/repository/weather_repo.dart';
import 'package:weather_app/models/weather_model2.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepo weatherRepo;
  WeatherBloc({required this.weatherRepo}) : super(WeatherInitial()) {
    on<WeatherFetch>(_onWeatherFetched);
  }

  void _onWeatherFetched(WeatherFetch event, Emitter<WeatherState> emit) async {
    try {
      emit(WeatherLoading());

      final Either<String, WeatherModel> weatherDataResult =
          await weatherRepo.getHandledData();

      weatherDataResult.fold(
        (err) => emit(
          WeatherFailure(errMsg: err),
          
        ),
        (model) => emit(
          WeatherSuccess(weatherModel: model),
        ),
      );
    } catch (e) {
      emit(
        WeatherFailure(errMsg: 'Something went wrong'),
      );
    }
  }
}
