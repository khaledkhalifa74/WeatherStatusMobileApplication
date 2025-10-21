import 'package:flutter/material.dart';
import 'package:weather_status_app/core/utils/functions/get_day_name.dart';
import 'package:weather_status_app/core/utils/functions/get_formatted_date.dart';
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
            'Days Forecast',
            style: Styles.textStyle24,
          ),
          const SizedBox(height: 16),
          ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: weatherModel?.forecast.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final dayForecast = weatherModel?.forecast[index];
              return DayForecastItem(
                day: getDayName(dayForecast!.date),
                dateTime: getFormattedDate(dayForecast.date),
                maxTemp: dayForecast.maxTemp.toString(),
                minTemp: dayForecast.minTemp.toString(),
              );
            },
          )
        ],
      ),
    );
  }
}

