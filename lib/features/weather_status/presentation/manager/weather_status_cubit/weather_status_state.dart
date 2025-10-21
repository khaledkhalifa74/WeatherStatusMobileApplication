import 'package:weather_status_app/features/weather_status/data/models/weather_model.dart';

abstract class WeatherStatusState {
  WeatherStatusState();
}

class WeatherStatusInitialState extends WeatherStatusState {}

// get weather status
class StartLoadingGetWeatherState extends WeatherStatusState {}
class StopLoadingGetWeatherState extends WeatherStatusState {}
class GetWeatherSuccessState extends WeatherStatusState {
  final WeatherModel weatherModel;
  GetWeatherSuccessState(this.weatherModel);
}
class GetWeatherFailureState extends WeatherStatusState {
  final String errorMessage;
  GetWeatherFailureState({required this.errorMessage});
}