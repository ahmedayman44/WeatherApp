import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Views/home_view.dart';
import 'cubits/get_weather_cubit/get_weather_cubit.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => MaterialApp(
            theme: ThemeData(
              primarySwatch: getWeatherMaterialColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition),
            ),
            debugShowCheckedModeBanner: false,
            home: HomeView()),
      ),
    );
  }
}

MaterialColor getWeatherMaterialColor(String? condition) {
  if (condition == null) {
    return Colors.red;
  }
  switch (condition) {
    case "Sunny":
    case "Clear":
      return Colors.orange;
    case "Partly cloudy":
    case "Cloudy":
    case "Overcast":
    case "Mist":
    case "Fog":
    case "Freezing fog":
      return Colors.blueGrey;

    case "Patchy light drizzle":
    case "Light drizzle":
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Patchy light rain":
    case "Light rain":
    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
    case "Light sleet":
    case "Moderate or heavy sleet":
    case "Patchy light snow":
    case "Light snow":
    case "Patchy moderate snow":
    case "Moderate snow":
    case "Patchy heavy snow":
    case "Heavy snow":
    case "Ice pellets":
    case "Light rain shower":
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
    case "Light sleet showers":
    case "Moderate or heavy sleet showers":
    case "Light snow showers":
    case "Moderate or heavy snow showers":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.blue;

    case "Thundery outbreaks possible":
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
    case "Tornado":
    case "Tropical storm":
    case "Hurricane":
    case "Severe thunderstorms":
    case "Thunderstorms":
      return Colors.deepPurple;
    case "Mixed rain and snow":
    case "Mixed rain and sleet":
    case "Mixed snow and sleet":
    case "Drizzle":
    case "Freezing rain":
    case "Showers":
    case "Snow flurries":
    case "Blowing snow":
    case "Snow":
    case "Hail":
    case "Patchy rain nearby":
    case "Sleet":
      return Colors.lightBlue;
    case "Dust":
      return Colors.orange;
    default:
      return Colors.purple;
  }
}
