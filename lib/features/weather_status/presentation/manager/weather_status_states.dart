import 'package:weather_status_app/features/weather_status/data/models/weather_model.dart';

abstract class WeatherStatusStates {

  WeatherStatusStates();
}

class WeatherStatusInitial extends WeatherStatusStates {}

// get weather status
class StartLoadingGetWeatherState extends WeatherStatusStates {}
class StopLoadingGetWeatherState extends WeatherStatusStates {}
class GetWeatherSuccessState extends WeatherStatusStates {
  final WeatherModel weatherModel;
  GetWeatherSuccessState(this.weatherModel);
}
class GetWeatherFailureState extends WeatherStatusStates {
  final String errorMessage;
  GetWeatherFailureState({required this.errorMessage});
}