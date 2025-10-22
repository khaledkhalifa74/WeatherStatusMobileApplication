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

// get favorite cities
class StartLoadingGetFavoriteCitiesState extends WeatherStatusState {}
class StopLoadingGetFavoriteCitiesState extends WeatherStatusState {}
class GetFavoriteCitiesSuccessState extends WeatherStatusState {
  final List<String> cities;
  GetFavoriteCitiesSuccessState(this.cities);
}
class GetFavoriteCitiesFailureState extends WeatherStatusState {
  final String errorMessage;
  GetFavoriteCitiesFailureState({required this.errorMessage});
}

// add city to favorites
class StartLoadingAddCityToFavoriteState extends WeatherStatusState {}
class StopLoadingAddCityToFavoriteState extends WeatherStatusState {}
class AddCityToFavoriteSuccessState extends WeatherStatusState {
  final bool isAdded;
  AddCityToFavoriteSuccessState(this.isAdded);
}
class AddCityToFavoriteFailureState extends WeatherStatusState {
  final String errorMessage;
  AddCityToFavoriteFailureState({required this.errorMessage});
}

// remove city from favorites
class StartLoadingRemoveCityFromFavoriteState extends WeatherStatusState {}
class StopLoadingRemoveCityFromFavoriteState extends WeatherStatusState {}
class RemoveCityFromFavoriteSuccessState extends WeatherStatusState {
  final bool isRemoved;
  RemoveCityFromFavoriteSuccessState(this.isRemoved);
}
class RemoveCityFromFavoriteFailureState extends WeatherStatusState {
  final String errorMessage;
  RemoveCityFromFavoriteFailureState({required this.errorMessage});
}

// check isFavorite
class StartLoadingCheckIsFavoriteState extends WeatherStatusState {}
class StopLoadingCheckIsFavoriteState extends WeatherStatusState {}
class CheckIsFavoriteSuccessState extends WeatherStatusState {
  final bool isFavorite;
  CheckIsFavoriteSuccessState(this.isFavorite);
}
class CheckIsFavoriteFailureState extends WeatherStatusState {
  final String errorMessage;
  CheckIsFavoriteFailureState({required this.errorMessage});
}