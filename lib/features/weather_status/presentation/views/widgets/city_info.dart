
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_status_app/core/utils/colors.dart';
import 'package:weather_status_app/core/utils/styles.dart';

class CityInfo extends StatelessWidget {
  final String cityName;
  const CityInfo({super.key, required this.cityName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cityName,
            style: Styles.textStyle32,
          ),
          const SizedBox(height: 4),
          Text(
           DateFormat('EEEE, MMMM d, y').format(DateTime.now()),
            style: Styles.textStyle16.copyWith(
              color: kHintColor,
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
