import 'package:flutter/material.dart';
import 'package:weather_status_app/core/utils/colors.dart';
import 'package:weather_status_app/core/utils/styles.dart';

class FavoriteCityItem extends StatelessWidget {
  final String cityName;
  const FavoriteCityItem({super.key, required this.cityName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            kFirstGradientFavorite,
            kSecondGradientFavorite,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: kBorderColor,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: kBlueColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.cloud, color: kWhiteColor, size: 28),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cityName,
                  style: Styles.textStyle18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
