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

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(
        json['current']['last_updated'],
      ),
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }

  getWeatherMaterialColor() {}

  getThemeColor() {}
}
