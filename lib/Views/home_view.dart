import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'search_view.dart';
import '../Widget/no_weather.dart';

import '../Widget/weather_info_widget.dart';
import '../cubits/get_weather_cubit/get_weather_cubit.dart';
import '../cubits/get_weather_cubit/get_weather_states.dart';

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
        backgroundColor: Colors.blue,
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
        } else if (state is WeatherLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherSucessState) {
          return WeatherInfo(
            weather: state.weatherModel,
          );
        } else {
          return failedData();
        }
      }),
    );
  }

  Center failedData() {
    return Center(
            child: Container(
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset("assets/images/Error data.webp"),
              const Text(
                'Can\'t connect ... check your internet',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
