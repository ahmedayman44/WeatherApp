import 'dart:developer';

import 'package:dio/dio.dart';
import '../models/weather_model.dart';

class WeatherService {
  final Dio dio;

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '1c7384efc20047b8b2c100352242802';
  WeatherService({required this.dio});
  Future<WeatherModel> getNewsWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMwssage =e.response?.data['error']['message'] ??
          'oops there is an error , try later !';
          throw Exception(errorMwssage) ; 
    }catch (e){
      log(e.toString()) ;  
      throw Exception('oops there is an error , try later !');
    }
  }
}
