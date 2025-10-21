import 'package:flutter/material.dart';
import 'package:weather_status_app/core/utils/colors.dart';
import 'package:weather_status_app/core/utils/styles.dart';

class DayForecastItem extends StatelessWidget {
  final String day;
  final String maxTemp;
  final String minTemp;
  const DayForecastItem({super.key, required this.day, required this.maxTemp, required this.minTemp});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kFilledColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: kBorderColor,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              day,
              style: Styles.textStyle16,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '$maxTemp°',
                  style:Styles.textStyle18,
                ),
                const SizedBox(width: 8),
                Text(
                  '$minTemp°',
                  style: Styles.textStyle18.copyWith(
                    color: kHintColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
