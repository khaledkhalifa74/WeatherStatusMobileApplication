import 'package:flutter/material.dart';
import 'package:weather_status_app/core/utils/colors.dart';
import 'package:weather_status_app/core/utils/styles.dart';

class LocationItem extends StatelessWidget {
  final String cityName;
  const LocationItem({
    super.key, required this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.location_on_outlined,
          color: kWhiteColor,
          size: 32,
        ),
        Text(
          cityName,
          style: Styles.textStyle32.copyWith(
              color: kWhiteColor
          ),
        ),
      ],
    );
  }
}
