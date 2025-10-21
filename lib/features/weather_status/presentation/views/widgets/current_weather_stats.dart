import 'package:flutter/material.dart';
import 'package:weather_status_app/core/utils/colors.dart';
import 'package:weather_status_app/core/utils/styles.dart';
import 'package:weather_status_app/features/weather_status/presentation/views/widgets/weather_state_item.dart';

class CurrentWeatherStats extends StatelessWidget {
  final double temp;
  final String weatherState;
  final String humidity;
  final String wind;
  final String visibility;
  final String? image;

  const CurrentWeatherStats({super.key, required this.temp, required this.weatherState, required this.humidity, required this.wind, required this.visibility, this.image});

  @override
  Widget build(BuildContext context) {
    IconData getWeatherIcon(double temp) {
      if (temp >= 30) {
        return Icons.wb_sunny;
      } else if (temp >= 20) {
        return Icons.wb_cloudy;
      } else if (temp >= 10) {
        return Icons.cloud;
      } else {
        return Icons.ac_unit;
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Center(
            child: Column(
              children: [
                Icon(
                  getWeatherIcon(temp,),
                  size: 120,
                 color: kHintColor,
                ),
                const SizedBox(height: 16),
                Text(
                  '$temp°C',
                  style: Styles.textStyle60,
                ),
                const SizedBox(height: 4),
                Text(
                  weatherState,
                  style: Styles.textStyle24.copyWith(
                    color: kHintColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Weather Stats
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: kFilledColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: kBorderColor, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WeatherStateItem(
                  icon: Icons.water_drop_rounded,
                  value: '$humidity%',
                  label: 'Humidity',
                ),
                WeatherStateItem(
                  icon: Icons.air_rounded,
                  value: '$wind km/h',
                  label: 'Wind',
                ),
                WeatherStateItem(
                  icon: Icons.visibility_rounded,
                  value: '$visibility km',
                  label: 'Visibility',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
