import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_status_app/features/WeatherStatus/data/models/weather_model.dart';
import 'package:weather_status_app/features/WeatherStatus/presentation/manager/weather_status_cubit.dart';
import 'package:weather_status_app/features/WeatherStatus/presentation/views/widgets/show_weather_status_view_body.dart';

class ShowWeatherStatusView extends StatelessWidget {
  const ShowWeatherStatusView({super.key});
  static String id = "ShowWeatherStatusView";
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final WeatherStatusCubit weatherStatusCubit = args?['weatherStatusCubit'];
    final WeatherModel weatherModel = args?['weatherModel'];
    return BlocProvider.value(
      value: weatherStatusCubit,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: ShowWeatherStatusViewBody(
            weatherModel: weatherModel,
            weatherStatusCubit: weatherStatusCubit,
          ),
        ),
      ),
    );
  }
}
