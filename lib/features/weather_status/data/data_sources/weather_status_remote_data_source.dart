import 'package:weather_status_app/core/utils/api_service.dart';
import 'package:weather_status_app/features/weather_status/data/models/weather_model.dart';

abstract class WeatherStatusRemoteDataSource{
  Future<WeatherModel>getWeatherStatus({String? cityName});
}

class WeatherStatusRemoteDataSourceImpl extends WeatherStatusRemoteDataSource{
  final ApiService apiService;
  WeatherStatusRemoteDataSourceImpl(this.apiService);


  @override
  Future<WeatherModel> getWeatherStatus({String? cityName}) async{
    var response = await apiService.get(
        endPoint: '/forecast.json?key=${apiService.apiKey}&q=$cityName&days=1&aqi=no&alerts=no');
    WeatherModel weatherModel = WeatherModel.fromJson(response);
    return weatherModel;
  }
}