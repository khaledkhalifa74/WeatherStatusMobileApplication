import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_status_app/features/weather_status/domain/repos/get_weather_status_repo.dart';
import 'package:weather_status_app/features/weather_status/presentation/manager/search_city_cubit/search_city_state.dart';

class SearchCityCubit extends Cubit<SearchCityState> {
  SearchCityCubit(this.getWeatherStatusRepo) : super(SearchCityInitialState());

  static SearchCityCubit get(context) => BlocProvider.of(context);
  final GetWeatherStatusRepo getWeatherStatusRepo;

  Future<void> getWeatherStatus({String? cityName}) async{
   //   emit(FeaturedBooksLoading());
  //  emit(FeaturedBooksPaginationLoading());
    var result = await getWeatherStatusRepo.getWeatherStatus(cityName: cityName);
    result.fold((failure) {
       // failure
      },
          (weatherModel) {
       // success
      },
    );
  }

}