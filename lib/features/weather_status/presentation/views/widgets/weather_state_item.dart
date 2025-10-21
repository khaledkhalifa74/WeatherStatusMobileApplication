import 'package:flutter/material.dart';
import 'package:weather_status_app/core/utils/colors.dart';
import 'package:weather_status_app/core/utils/styles.dart';

class WeatherStateItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  const WeatherStateItem({super.key, required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: kIconColor, size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: Styles.textStyle18,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Styles.textStyle14.copyWith(
            color: kHintColor,
          ),
        ),
      ],
    );
  }
}
