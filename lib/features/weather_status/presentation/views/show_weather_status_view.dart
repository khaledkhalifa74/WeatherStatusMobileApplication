import 'package:flutter/material.dart';
import 'package:weather_status_app/core/utils/colors.dart';
import 'package:weather_status_app/features/weather_status/presentation/views/widgets/show_weather_status_view_body.dart';

class ShowWeatherStatusView extends StatelessWidget {
  const ShowWeatherStatusView({super.key});
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final String? cityName = args?['cityName'];
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ShowWeatherStatusViewBody(
        cityName: cityName ?? 'cairo',
      ),
    );
  }
}
