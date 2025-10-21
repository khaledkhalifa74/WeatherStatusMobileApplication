import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_status_app/core/utils/functions/setup_service_locator.dart';
import 'package:weather_status_app/features/weather_status/data/repos/get_weather_status_repo_impl.dart';
import 'package:weather_status_app/features/weather_status/presentation/manager/weather_status_cubit/weather_status_cubit.dart';
import 'package:weather_status_app/features/weather_status/presentation/views/widgets/search_city_view_body.dart';

class SearchCityView extends StatelessWidget {
  const SearchCityView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return WeatherStatusCubit(getIt.get<GetWeatherStatusRepoImpl>())..getFavoriteCities();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SearchCityViewBody(),
      ),
    );
  }
}
