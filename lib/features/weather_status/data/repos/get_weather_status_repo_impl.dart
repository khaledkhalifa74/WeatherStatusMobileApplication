import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_status_app/core/errors/failure.dart';
import 'package:weather_status_app/features/weather_status/data/data_sources/local_data_sources/favorite_cities_local_data_source.dart';
import 'package:weather_status_app/features/weather_status/data/data_sources/remote_data_sources/weather_status_remote_data_source.dart';
import 'package:weather_status_app/features/weather_status/data/models/weather_model.dart';
import 'package:weather_status_app/features/weather_status/domain/repos/get_weather_status_repo.dart';

class GetWeatherStatusRepoImpl extends GetWeatherStatusRepo {
  final WeatherStatusRemoteDataSource weatherStatusRemoteDataSource;
  final FavoriteCitiesLocalDataSource favoriteCitiesLocalDataSource;

  GetWeatherStatusRepoImpl({required this.favoriteCitiesLocalDataSource, required this.weatherStatusRemoteDataSource});


  @override
  Future<Either<Failure, WeatherModel>> getWeatherStatus({String? cityName}) async{
    try {
      WeatherModel? weatherModel;
      weatherModel = await weatherStatusRemoteDataSource.getWeatherStatus(
        cityName: cityName,
      );
      return right(weatherModel);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> addCityToFavorites({required String cityName}) async{
    var isAdded = await favoriteCitiesLocalDataSource.addCityToFavorites(cityName: cityName);
    if(isAdded){
      return right(true);
    }
    return Left(LocalDBFailure(message: 'City already exists in favorites'));
    }

  @override
  Future<Either<Failure, bool>> removeCityFromFavorites({required String cityName})async {
    var isRemoved = await favoriteCitiesLocalDataSource.removeCityFromFavorites(cityName: cityName);
    if(isRemoved){
      return right(true);
    }
    return Left(LocalDBFailure(message: 'Cannot remove this city from favorites'));
  }

  @override
  Future<Either<Failure, List<String>>> getFavoriteCities() async{
    List<String> cities;
    cities = await favoriteCitiesLocalDataSource.getFavoriteCities();
    if(cities.isNotEmpty){
      return right(cities);
    }
    return left(LocalDBFailure(message: 'There is something error, please try later'));
  }

  @override
  Future<Either<Failure, bool>> isFavorite({required String cityName}) async{
    var isFavorite = favoriteCitiesLocalDataSource.isFavorite(cityName: cityName);
    if(await isFavorite){
      return right(true);
    }
    return left(LocalDBFailure(message: 'There is something error, please try later'));
  }
}