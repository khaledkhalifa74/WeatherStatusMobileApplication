import 'package:flutter/material.dart';
import 'package:weather_status_app/core/utils/colors.dart';
import 'package:weather_status_app/core/widgets/custom_text_form_field.dart';
import 'package:weather_status_app/features/weather_status/presentation/views/widgets/custom_header.dart';
import 'package:weather_status_app/features/weather_status/presentation/views/widgets/favorites_cities_item.dart';

class SearchCityViewBody extends StatefulWidget {
  const SearchCityViewBody({super.key});

  @override
  State<SearchCityViewBody> createState() => _SearchCityViewBodyState();
}

class _SearchCityViewBodyState extends State<SearchCityViewBody> {
  final TextEditingController _searchController = TextEditingController();
  bool isLoading = false;
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [kFirstGradientBodyColor, kSecondGradientBodyColor],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHeader(),
            CustomTextFormField(
              controller: _searchController,
              placeholder: 'Search city...',
              onFieldSubmitted: (value) {
                // if (value.isNotEmpty) {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => WeatherDetailPage(cityName: value),
                //     ),
                //   );
                // }
              },
              suffix: IconButton(
                icon: const Icon(
                    Icons.arrow_forward_rounded,
                    color: kWhiteColor,
                ),
                onPressed: () {
                  if (_searchController.text.isNotEmpty) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => WeatherDetailPage(
                    //       cityName: _searchController.text,
                    //     ),
                    //   ),
                    // );
                  }
                },
              ),
               prefix: Icon(
                   Icons.search_rounded,
                   color: kWhiteColor,
               ),
            ),
            const SizedBox(height: 40),
            const FavoritesCitiesItem(),
          ],
        ),
      ),
    );
  }
}
