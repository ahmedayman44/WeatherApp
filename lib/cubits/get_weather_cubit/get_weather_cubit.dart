import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statless_wedget/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:statless_wedget/models/weather_model.dart';
import 'package:statless_wedget/service/service_weather.dart';

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
