import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_status_app/core/utils/colors.dart';
import 'package:weather_status_app/core/utils/styles.dart';
import 'package:weather_status_app/features/WeatherStatus/data/models/weather_model.dart';
import 'package:weather_status_app/features/WeatherStatus/presentation/manager/weather_status_cubit.dart';
import 'package:weather_status_app/features/WeatherStatus/presentation/manager/weather_status_states.dart';
import 'package:weather_status_app/core/utils/globals.dart' as globals;

class ShowWeatherStatusViewBody extends StatefulWidget {
  final WeatherModel weatherModel;
  final WeatherStatusCubit weatherStatusCubit;
  const ShowWeatherStatusViewBody({super.key, required this.weatherModel, required this.weatherStatusCubit});

  @override
  State<ShowWeatherStatusViewBody> createState() => _ShowWeatherStatusViewBodyState();
}

class _ShowWeatherStatusViewBodyState extends State<ShowWeatherStatusViewBody> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherStatusCubit,WeatherStatusStates>(
      builder: (context, state) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [kBGColor, kBG2Color],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network("https:${widget.weatherModel.image!}",width: 100),
                        Text(
                          widget.weatherModel.temp.toString(),
                          style: Styles.textStyle24,
                        ),
                        Text(
                          widget.weatherModel.weatherCondition,
                          style: Styles.textStyle24,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
