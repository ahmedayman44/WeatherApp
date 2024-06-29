import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statless_wedget/Views/search_view.dart';
import 'package:statless_wedget/Widget/no_weather.dart';

import 'package:statless_wedget/Widget/weather_info_widget.dart';
import 'package:statless_wedget/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:statless_wedget/cubits/get_weather_cubit/get_weather_states.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.blue , 
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(
              color: Colors.white,
              size: 30,
              Icons.search,
            ),
          ),
        ],
      ),
      body:
          BlocBuilder<GetWeatherCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherInitialState) {
          return const NoWeather();
        } else if (state is WeatherSucessState) {
          return WeatherInfo(
            weather: state.weatherModel,
          );
        } else {
          return const Text(
            'oops there is an error !',
            style: TextStyle(fontSize: 25),
          );
        }
      }),
    );
  }
}