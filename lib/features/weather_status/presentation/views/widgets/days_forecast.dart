import 'package:flutter/material.dart';
import 'package:weather_status_app/core/utils/styles.dart';
import 'package:weather_status_app/features/weather_status/data/models/weather_model.dart';
import 'package:weather_status_app/features/weather_status/presentation/views/widgets/day_forecast_item.dart';

class DaysForecast extends StatelessWidget {
  final WeatherModel? weatherModel;
  const DaysForecast({super.key, this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 5-Day Forecast
           Text(
            '5-Day Forecast',
            style: Styles.textStyle24,
          ),
          const SizedBox(height: 16),
          DayForecastItem(
            day: 'Monday',
            maxTemp: '26',
            minTemp: '18',
          ),
          DayForecastItem(
            day: 'Friday',
            maxTemp: '29',
            minTemp: '16',
          ),
          DayForecastItem(
            day: 'Saturday',
            maxTemp: '30',
            minTemp: '18',
          )
        ],
      ),
    );
  }
}

