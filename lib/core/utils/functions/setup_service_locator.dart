import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_status_app/core/utils/api_service.dart';
import 'package:weather_status_app/features/weather_status/data/data_sources/local_data_sources/favorite_cities_local_data_source.dart';
import 'package:weather_status_app/features/weather_status/data/data_sources/remote_data_sources/weather_status_remote_data_source.dart';
import 'package:weather_status_app/features/weather_status/data/repos/get_weather_status_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<GetWeatherStatusRepoImpl>(GetWeatherStatusRepoImpl(
    favoriteCitiesLocalDataSource: FavoriteCitiesLocalDataSourceImpl(),
    weatherStatusRemoteDataSource: WeatherStatusRemoteDataSourceImpl(
      getIt.get<ApiService>(),
    ),
  ));
}
