import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_status_app/core/utils/app_router.dart';
import 'package:weather_status_app/core/utils/colors.dart';
import 'package:weather_status_app/core/utils/styles.dart';
import 'package:weather_status_app/features/weather_status/presentation/views/widgets/favorite_city_item.dart';

class FavoritesCitiesItem extends StatelessWidget {
  final List<String> favoriteCities;
  const FavoritesCitiesItem({super.key, required this.favoriteCities});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        favoriteCities.isEmpty
            ? const NoFavoriteCitiesItem()
            : ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: favoriteCities.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return FavoriteCityItem(
                    cityName: favoriteCities[index],
                  onTap: (){
                    context.push(
                        AppRouter.kShowStatusView,
                        extra: {
                          'cityName' : favoriteCities[index],
                        }
                    );
                  },
                );
              },
            ),
      ],
    );
  }
}

class NoFavoriteCitiesItem extends StatelessWidget {
  const NoFavoriteCitiesItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
    Icon(
      Icons.favorite_border_rounded,
      size: 80,
      color: kIconColor,
    ),
    const SizedBox(height: 8),
    Text(
      'No favorite cities found',
      style: Styles.textStyle18,
    ),
    const SizedBox(height: 4),
    Text(
      'Add your favorite cities to access them quickly.',
      style: Styles.textStyle14.copyWith(
        color: kHintColor,
      ),
    ),
                ],
              );
  }
}

