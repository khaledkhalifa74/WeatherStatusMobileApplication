import 'package:flutter/material.dart';
import 'package:weather_status_app/core/utils/colors.dart';
import 'package:weather_status_app/core/utils/styles.dart';
import 'package:weather_status_app/features/weather_status/presentation/views/widgets/favorite_city_item.dart';

class FavoritesCitiesItem extends StatelessWidget {
  const FavoritesCitiesItem({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> favoriteCities = [
      'Gaza',
      'Cairo',
      'Banha',
      'Alex',
      'Tokyo',
    ];
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Favorite cities',
                  style: Styles.textStyle18.copyWith(
                      color: kHintColor
                  )
              ),
              Icon(
                Icons.favorite,
                color: kRedColor,
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Favorite Cities List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: favoriteCities.length,
              itemBuilder: (context, index) {
                return FavoriteCityItem(
                    cityName: favoriteCities[index],
                  onTap: (){},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

