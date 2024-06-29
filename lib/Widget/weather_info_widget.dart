import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/get_weather_cubit/get_weather_cubit.dart';
import '../main.dart';
import '../models/weather_model.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    super.key,
    required this.weather,
  });
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getWeatherMaterialColor(weatherModel.weatherCondition),
            getWeatherMaterialColor(weatherModel.weatherCondition)[400]!,
            getWeatherMaterialColor(weatherModel.weatherCondition)[300]!,
            getWeatherMaterialColor(weatherModel.weatherCondition)[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            /*  in case of use DateTime function
            'updated at ${getToString(weatherModel.date).hour}: ${getToString(weatherModel.date).minute}', */

            "updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                'https:${weatherModel.image}',
              ),
              Text(
                weatherModel.temp.toString(),
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text(
                    'Max Temp : ${weatherModel.maxtemp.round()}',
                    style: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Min Temp : ${weatherModel.mintemp.round()}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            weatherModel.weatherCondition,
            style: const TextStyle(
              fontSize: 33,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}




/* DateTime getToString(value) {
  return DateTime.parse(value);
} */
