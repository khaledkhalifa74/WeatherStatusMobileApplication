import 'package:flutter/material.dart';
import 'package:weather_status_app/features/WeatherStatus/presentation/views/widgets/enter_city_view_body.dart';

class EnterCityView extends StatelessWidget {
  const EnterCityView({super.key});
  static String id = "EnterCityView";
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
       // backgroundColor: kBGColor,
        body: EnterCityViewBody(),
      ),
    );
  }
}
