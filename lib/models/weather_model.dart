class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String weatherCondition;

  WeatherModel(
      {required this.cityName,
      required this.date,
      this.image,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.weatherCondition});

  factory WeatherModel.fromJson(Json) {
    return WeatherModel(
      cityName: Json['location']['name'],
      date: DateTime.parse(
        Json['current']['last_updated'],
      ),
      image: Json['forecast']['forecastday'][0]['day']['condition']['icon'],
      temp: Json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxtemp: Json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintemp: Json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: Json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
