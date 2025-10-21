import 'package:flutter/material.dart';
import 'package:weather_status_app/core/utils/colors.dart';
import 'package:weather_status_app/core/utils/styles.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          'Weather Status',
          style: Styles.textStyle26.copyWith(
            color: kWhiteColor
          ),
        ),
        const SizedBox(height: 32),
        Text(
          'Find your city',
          style: Styles.textStyle18.copyWith(
            color: kHintColor
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
