  import 'package:flutter/material.dart';
  import 'package:weather_status_app/core/utils/colors.dart';
  import 'package:weather_status_app/core/utils/styles.dart';

  class FavoriteCityItem extends StatelessWidget {
    final String cityName;
    final void Function()? onTap;
    const FavoriteCityItem({super.key, required this.cityName, this.onTap});

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(
          bottom: 16,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Container(
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
                      color: kFilledColor,
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
            ),
          ),
        ),
      );
    }
  }
