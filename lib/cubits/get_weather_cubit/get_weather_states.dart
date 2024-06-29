import 'package:statless_wedget/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherSucessState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherSucessState(this.weatherModel);
}

class WeatherFailureState extends WeatherState {
  final String errMessage;

  WeatherFailureState(this.errMessage);
}
