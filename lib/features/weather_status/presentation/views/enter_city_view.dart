import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_status_app/features/weather_status/presentation/manager/weather_status_cubit.dart';
import 'package:weather_status_app/features/weather_status/presentation/views/widgets/enter_city_view_body.dart';

class EnterCityView extends StatelessWidget {
  const EnterCityView({super.key});
  static String id = "EnterCityView";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WeatherStatusCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: EnterCityViewBody(),
      ),
    );
  }
}
