import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_status_app/features/weather_status/domain/repos/get_weather_status_repo.dart';
import 'package:weather_status_app/features/weather_status/presentation/manager/weather_status_cubit/weather_status_state.dart';

class WeatherStatusCubit extends Cubit<WeatherStatusState> {
  WeatherStatusCubit(this.getWeatherStatusRepo) : super(WeatherStatusInitialState());

  static WeatherStatusCubit get(context) => BlocProvider.of(context);
  final GetWeatherStatusRepo getWeatherStatusRepo;
  bool? isFavourite = false;

  Future<void> getWeatherStatus({ required String cityName}) async{
    emit(StartLoadingGetWeatherState());
    var result = await getWeatherStatusRepo.getWeatherStatus(cityName: cityName);
    result.fold((failure) {
      emit(GetWeatherFailureState(errorMessage: failure.message));
      emit(StopLoadingGetWeatherState());
      },
          (weatherModel) {
      emit(StopLoadingGetWeatherState());
      emit(GetWeatherSuccessState(weatherModel));
      },
    );
  }

  Future<void> getFavoriteCities() async{
    emit(StartLoadingGetFavoriteCitiesState());
    var result = await getWeatherStatusRepo.getFavoriteCities();
    result.fold((failure) {
      emit(GetWeatherFailureState(errorMessage: failure.message));
      emit(StopLoadingGetFavoriteCitiesState());
    },
          (cities) {
        emit(StopLoadingGetFavoriteCitiesState());
        emit(GetFavoriteCitiesSuccessState(cities));
      },
    );
  }

  Future<void> addCityToFavorites({required String cityName}) async{
    emit(StartLoadingAddCityToFavoriteState());
    var result = await getWeatherStatusRepo.addCityToFavorites(cityName: cityName);
    result.fold((failure) {
      emit(AddCityToFavoriteFailureState(errorMessage: failure.message));
      emit(StopLoadingAddCityToFavoriteState());
      },
          (isAdded) {
        emit(StopLoadingAddCityToFavoriteState());
        emit(AddCityToFavoriteSuccessState(isAdded));
      },
    );
  }

  Future<void> isFavorite({required String cityName}) async{
    emit(StartLoadingCheckIsFavoriteState());
    var result = await getWeatherStatusRepo.isFavorite(cityName: cityName);
    result.fold((failure) {
      emit(AddCityToFavoriteFailureState(errorMessage: failure.message));
      emit(StopLoadingCheckIsFavoriteState());
    },
          (isFavorite) {
        emit(StopLoadingCheckIsFavoriteState());
        emit(CheckIsFavoriteSuccessState(isFavorite));
      },
    );
  }

}