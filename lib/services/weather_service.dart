import 'dart:developer';
import 'package:dio/dio.dart';
import '../models/weather_model.dart';
class WeatherService
{
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey ='29d329f2369847af905225428232312';
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({
    required String cityName,
}) async
  {
    try
    {
      Response response = await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch(error)
    {
      final String errorMessage = error.response?.data['error']['message']??'Ops! , There is an Error , Please Try Later';
      throw Exception(errorMessage);
    } catch(error)
    {
      log(error.toString());
      throw Exception('Ops! , There is an Error , Please Try Later');
    }
  }
}