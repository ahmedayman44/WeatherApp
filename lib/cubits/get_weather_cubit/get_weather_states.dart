import '../../models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSucessState extends WeatherState {
  WeatherModel weatherModel;

  WeatherSucessState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState {
  final String errMessage;

  WeatherFailureState(this.errMessage);
}
