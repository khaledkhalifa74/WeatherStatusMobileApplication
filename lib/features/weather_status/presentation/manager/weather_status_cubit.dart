import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_status_app/features/weather_status/data/models/weather_model.dart';
import 'package:weather_status_app/features/weather_status/data/repos/get_weather_status_repo_impl.dart';
import 'package:weather_status_app/features/weather_status/presentation/manager/weather_status_states.dart';

class WeatherStatusCubit extends Cubit<WeatherStatusStates> {
  WeatherStatusCubit() : super(WeatherStatusInitial());

  static WeatherStatusCubit get(context) => BlocProvider.of(context);

  WeatherModel? weatherModel;

  // Future<void> getWeatherStatus({required String cityName}) async {
  //   try {
  //     emit(StartLoadingGetWeatherState());
  //     weatherModel = await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
  //     if(weatherModel != null){
  //       emit(StopLoadingGetWeatherState());
  //       emit(GetWeatherSuccessState(weatherModel!));
  //     }
  //   } catch (e) {
  //     emit(GetWeatherFailureState(errorMessage: e.toString()));
  //     emit(StopLoadingGetWeatherState());
  //   }
  // }
}