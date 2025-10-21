import 'package:flutter/material.dart';
import 'package:weather_status_app/features/weather_status/presentation/views/widgets/city_info.dart';
import 'package:weather_status_app/features/weather_status/presentation/views/widgets/current_weather_stats.dart';
import 'package:weather_status_app/features/weather_status/presentation/views/widgets/custom_body_decoration.dart';
import 'package:weather_status_app/features/weather_status/presentation/views/widgets/custom_weather_header.dart';
import 'package:weather_status_app/features/weather_status/presentation/views/widgets/days_forecast.dart';

class ShowWeatherStatusViewBody extends StatefulWidget {
  final String cityName;
  const ShowWeatherStatusViewBody({super.key, required this.cityName});


  @override
  State<ShowWeatherStatusViewBody> createState() => _ShowWeatherStatusViewBodyState();
}

class _ShowWeatherStatusViewBodyState extends State<ShowWeatherStatusViewBody> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: customBodyDecoration(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomWeatherHeader(
                  isFavorite: isFavorite,
                  onFavoritePressed: (){
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  cityName: 'Cairo',
              ),
              const SizedBox(height: 16),
              const CityInfo(cityName: 'Cairo'),
              CurrentWeatherStats(
                  temp: '25',
                  weatherState: 'Sunny',
                  humidity: '65',
                  wind: '12',
                  visibility: '9',
              ),
              const SizedBox(height: 32),
              const DaysForecast(),
            ],
          ),
        ),
      ),
    );
  }
}