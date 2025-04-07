import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_weather_states.dart';
import '../../models/weather_model.dart';
import '../../service/service_weather.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit(this.weatherService) : super(WeatherInitialState());
  WeatherService weatherService;

  WeatherModel? weatherModel;

  getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      // Logic response for change state
   WeatherModel   weatherModel =
          await WeatherService(dio: Dio()).getNewsWeather(cityName: cityName);
      emit(WeatherSucessState(weatherModel: weatherModel));
    } catch (e) {
      emit(WeatherFailureState(
        e.toString(),
      ));
    }
  }
}
