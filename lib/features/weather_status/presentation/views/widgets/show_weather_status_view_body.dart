import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_status_app/core/utils/styles.dart';
import 'package:weather_status_app/core/widgets/custom_app_bar.dart';
import 'package:weather_status_app/features/weather_status/data/models/weather_model.dart';
import 'package:weather_status_app/features/weather_status/presentation/manager/weather_status_cubit.dart';
import 'package:weather_status_app/features/weather_status/presentation/manager/weather_status_states.dart';
import 'package:weather_status_app/features/weather_status/presentation/views/widgets/location_item.dart';
import 'package:weather_status_app/features/weather_status/presentation/views/widgets/status_item.dart';

class ShowWeatherStatusViewBody extends StatefulWidget {
  final WeatherModel weatherModel;
  final WeatherStatusCubit weatherStatusCubit;
  const ShowWeatherStatusViewBody({super.key, required this.weatherModel, required this.weatherStatusCubit});


  @override
  State<ShowWeatherStatusViewBody> createState() => _ShowWeatherStatusViewBodyState();
}

class _ShowWeatherStatusViewBodyState extends State<ShowWeatherStatusViewBody> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherStatusCubit,WeatherStatusStates>(
      builder: (context, state) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   // colors: [kBGColor, kBG2Color],
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            // ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: CustomAppBar(),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .15,
                        ),
                        LocationItem(
                            cityName: widget.weatherModel.cityName,
                        ),
                        Text(
                          '${widget.weatherModel.temp.toString()}°',
                          style: Styles.textStyle32,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.weatherModel.weatherCondition,
                              style: Styles.textStyle20,
                            ),
                            Image.network("https:${widget.weatherModel.image!}"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StatusItem(
                                statusName: 'Wind speed',
                                statusValue: widget.weatherModel.windSpeed.toString(),
                            ),
                            const SizedBox(width: 24),
                            StatusItem(
                              statusName: 'Humidity',
                              statusValue: widget.weatherModel.humidity.toString(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}