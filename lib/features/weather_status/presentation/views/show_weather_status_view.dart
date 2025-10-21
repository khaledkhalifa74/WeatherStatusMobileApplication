import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_status_app/core/utils/functions/setup_service_locator.dart';
import 'package:weather_status_app/features/weather_status/data/repos/get_weather_status_repo_impl.dart';
import 'package:weather_status_app/features/weather_status/presentation/manager/weather_status_cubit/weather_status_cubit.dart';
import 'package:weather_status_app/features/weather_status/presentation/views/widgets/show_weather_status_view_body.dart';

class ShowWeatherStatusView extends StatelessWidget {
  const ShowWeatherStatusView({super.key});
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final String? cityName = args?['cityName'];
    return BlocProvider(
      create: (BuildContext context) {
        return WeatherStatusCubit(getIt.get<GetWeatherStatusRepoImpl>())..getWeatherStatus(
          cityName:  cityName,
        );
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: ShowWeatherStatusViewBody(
          cityName: cityName ?? 'cairo',
        ),
      ),
    );
  }
}
