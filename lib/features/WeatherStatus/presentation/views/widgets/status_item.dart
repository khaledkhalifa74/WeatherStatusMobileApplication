import 'package:flutter/material.dart';
import 'package:weather_status_app/core/utils/styles.dart';

class StatusItem extends StatelessWidget {
  final String statusName;
  final String statusValue;
  const StatusItem({super.key, required this.statusName, required this.statusValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          statusValue,
          style: Styles.textStyle24,
        ),
        Text(
          statusName,
          style: Styles.textStyle14,
        ),

      ],
    );
  }
}
