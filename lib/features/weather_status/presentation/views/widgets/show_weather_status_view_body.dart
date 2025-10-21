import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weather_status_app/core/utils/colors.dart';
import 'package:weather_status_app/features/weather_status/data/models/weather_model.dart';
import 'package:weather_status_app/features/weather_status/presentation/manager/weather_status_cubit/weather_status_cubit.dart';
import 'package:weather_status_app/features/weather_status/presentation/manager/weather_status_cubit/weather_status_state.dart';
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
  bool isLoading = false;
  WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherStatusCubit,WeatherStatusState>(
      listener: (context, state) {
        if(state is GetWeatherSuccessState){
          weatherModel = state.weatherModel;
        }
      },
      builder: (context, state) {
        if(state is StartLoadingGetWeatherState){
          isLoading = true;
        }else{
          isLoading = false;
        }
        return Skeletonizer(
          textBoneBorderRadius: TextBoneBorderRadius(BorderRadius.circular(4)),
          enabled: isLoading,
          effect: ShimmerEffect(
            baseColor: kBorderColor,
            highlightColor: kFilledColor,
            duration: const Duration(seconds: 2),
          ),
          containersColor: kFilledColor,
          child: Container(
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
                      cityName: weatherModel?.cityName ?? 'Not found',
                    ),
                    const SizedBox(height: 16),
                    CityInfo(
                      cityName: weatherModel?.cityName ?? 'Not found',
                    ),
                    CurrentWeatherStats(
                      temp: weatherModel?.temp ?? 0,
                      weatherState: weatherModel?.weatherCondition ?? 'Not found',
                      humidity: weatherModel?.humidity.toString() ?? '0',
                      wind: weatherModel?.windSpeed.toString() ?? '0',
                      visibility: weatherModel?.visibility.toString() ?? '0',
                      image : weatherModel?.image,
                    ),
                    const SizedBox(height: 32),
                    DaysForecast(
                      weatherModel: weatherModel,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}