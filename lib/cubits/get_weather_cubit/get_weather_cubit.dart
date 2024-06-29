import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_weather_states.dart';
import '../../models/weather_model.dart';
import '../../service/service_weather.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

   WeatherModel? weatherModel ; 

  getWeather({required String cityName}) async {
    try {
      // Logic response for change state
       weatherModel =
          await WeatherService(dio: Dio()).getNewsWeather(cityName: cityName);
      emit(WeatherSucessState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureState(
        e.toString(),
      ));
    }
  }
}
