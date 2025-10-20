import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_status_app/core/errors/failure.dart';
import 'package:weather_status_app/features/weather_status/data/data_sources/weather_status_remote_data_source.dart';
import 'package:weather_status_app/features/weather_status/data/models/weather_model.dart';
import 'package:weather_status_app/features/weather_status/domain/repos/get_weather_status_repo.dart';

class GetWeatherStatusRepoImpl extends GetWeatherStatusRepo {
  final WeatherStatusRemoteDataSource weatherStatusRemoteDataSource;

  GetWeatherStatusRepoImpl({required this.weatherStatusRemoteDataSource});


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
}