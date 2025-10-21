import 'package:dartz/dartz.dart';
import 'package:weather_status_app/core/errors/failure.dart';
import 'package:weather_status_app/features/weather_status/data/models/weather_model.dart';

abstract class GetWeatherStatusRepo{
  Future<Either< Failure,WeatherModel>> getWeatherStatus({String? cityName});

  Future<Either< Failure,List<String>>> getFavoriteCities();

  Future<Either< Failure,bool>> addCityToFavorites({required String cityName});

  Future<Either< Failure,bool>> isFavorite({required String cityName});
}