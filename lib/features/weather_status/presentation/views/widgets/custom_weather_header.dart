import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_status_app/core/utils/app_router.dart';
import 'package:weather_status_app/core/utils/colors.dart';

class CustomWeatherHeader extends StatelessWidget {
  final bool isFavorite;
  final String cityName;
  final void Function()? onFavoritePressed;
  const CustomWeatherHeader({super.key, required this.isFavorite, required this.cityName, this.onFavoritePressed});


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: kWhiteColor, size: 28),
          onPressed: () => context.pushReplacement(AppRouter.kSearchView),
        ),
        IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? kRedColor : kWhiteColor,
            size: 28,
          ),
          onPressed: onFavoritePressed
        ),
      ],
    );
  }
}
