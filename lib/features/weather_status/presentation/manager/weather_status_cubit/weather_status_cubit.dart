import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_status_app/features/weather_status/domain/repos/get_weather_status_repo.dart';
import 'package:weather_status_app/features/weather_status/presentation/manager/weather_status_cubit/weather_status_state.dart';

class WeatherStatusCubit extends Cubit<WeatherStatusState> {
  WeatherStatusCubit(this.getWeatherStatusRepo) : super(WeatherStatusInitialState());

  static WeatherStatusCubit get(context) => BlocProvider.of(context);
  final GetWeatherStatusRepo getWeatherStatusRepo;
  bool? isFavourite = false;

  Future<void> getWeatherStatus({String? cityName}) async{
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

}