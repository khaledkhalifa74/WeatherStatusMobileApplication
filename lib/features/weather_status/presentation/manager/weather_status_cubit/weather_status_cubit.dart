import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_status_app/features/weather_status/domain/repos/get_weather_status_repo.dart';
import 'package:weather_status_app/features/weather_status/presentation/manager/weather_status_cubit/weather_status_state.dart';

class WeatherStatusCubit extends Cubit<WeatherStatusState> {
  WeatherStatusCubit(this.getWeatherStatusRepo) : super(WeatherStatusInitialState());

  static WeatherStatusCubit get(context) => BlocProvider.of(context);
  final GetWeatherStatusRepo getWeatherStatusRepo;

  Future<void> getWeatherStatus({ required String cityName}) async{
    emit(StartLoadingGetWeatherState());
    var result = await getWeatherStatusRepo.getWeatherStatus(cityName: cityName);
    result.fold((failure) {
      emit(GetWeatherFailureState(errorMessage: failure.message));
      },
          (weatherModel) {
      emit(GetWeatherSuccessState(weatherModel));
      },
    );
    emit(StopLoadingGetWeatherState());
  }

  Future<void> getFavoriteCities() async{
    emit(StartLoadingGetFavoriteCitiesState());
    var result = await getWeatherStatusRepo.getFavoriteCities();
    result.fold((failure) {
      emit(GetFavoriteCitiesFailureState(errorMessage: failure.message));
    },
          (cities) {
        emit(GetFavoriteCitiesSuccessState(cities));
      },
    );
    emit(StopLoadingGetFavoriteCitiesState());
  }

  Future<void> addCityToFavorites({required String cityName}) async{
    emit(StartLoadingAddCityToFavoriteState());
    var result = await getWeatherStatusRepo.addCityToFavorites(cityName: cityName);
    result.fold((failure) {
      emit(AddCityToFavoriteFailureState(errorMessage: failure.message));
      },
          (isAdded) {
        isAdded = !isAdded;
        emit(AddCityToFavoriteSuccessState(isAdded));
      },
    );
    emit(StopLoadingAddCityToFavoriteState());
  }

  Future<void> isFavorite({required String cityName}) async{
    emit(StartLoadingCheckIsFavoriteState());
    var result = await getWeatherStatusRepo.isFavorite(cityName: cityName);
    result.fold((failure) {
      emit(CheckIsFavoriteFailureState(errorMessage: failure.message));
    },
          (isFavorite) {
        emit(CheckIsFavoriteSuccessState(isFavorite));
      },
    );
    emit(StopLoadingCheckIsFavoriteState());
  }

  Future<void> getData({required String cityName})async{
    await getWeatherStatus(cityName: cityName);
    await isFavorite(cityName: cityName);
  }
}