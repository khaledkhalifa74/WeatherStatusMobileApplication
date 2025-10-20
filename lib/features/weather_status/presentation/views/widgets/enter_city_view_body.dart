import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_status_app/core/utils/assets.dart';
import 'package:weather_status_app/core/utils/colors.dart';
import 'package:weather_status_app/core/utils/styles.dart';
import 'package:weather_status_app/core/widgets/custom_alert.dart';
import 'package:weather_status_app/core/widgets/custom_button.dart';
import 'package:weather_status_app/core/widgets/custom_loading_indicator.dart';
import 'package:weather_status_app/core/widgets/text_form_field_with_title.dart';
import 'package:weather_status_app/features/weather_status/presentation/manager/weather_status_cubit.dart';
import 'package:weather_status_app/features/weather_status/presentation/manager/weather_status_states.dart';
import 'package:weather_status_app/features/weather_status/presentation/views/show_weather_status_view.dart';

class EnterCityViewBody extends StatefulWidget {
  const EnterCityViewBody({super.key});

  @override
  State<EnterCityViewBody> createState() => _EnterCityViewBodyState();
}

class _EnterCityViewBodyState extends State<EnterCityViewBody> {
  final _enterCityFormKey = GlobalKey<FormState>();
  final TextEditingController _searchController = TextEditingController();
  bool isLoading = false;
List<String> favoriteCities = [
  'cairo',
  'alex',
  'tokyo',
];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final weatherStatusCubit = WeatherStatusCubit.get(context);
    return BlocConsumer<WeatherStatusCubit,WeatherStatusStates>(
      listener: (context, state) {
        if(state is StartLoadingGetWeatherState){
          isLoading = true;
        }else if (state is StopLoadingGetWeatherState){
          isLoading = false;
        }

        if(state is GetWeatherSuccessState){
          // globals.navigatorKey.currentState!.pushNamed(ShowWeatherStatusView.id,arguments: {
          //   'weatherStatusCubit' : weatherStatusCubit,
          //   'weatherModel': weatherStatusCubit.weatherModel
          // });
        }else if (state is GetWeatherFailureState){
          customAlert(
              context,
              title: 'Sorry',
              message: state.errorMessage,
              isError: true,
          );
        }
      },
      builder: (context, state) {
        // return Container(
        //   height: double.infinity,
        //   width: double.infinity,
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: [kBGColor, kBG2Color],
        //       begin: Alignment.topCenter,
        //       end: Alignment.bottomCenter,
        //     ),
        //   ),
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        //     child: Form(
        //       key: _enterCityFormKey,
        //       child: Column(
        //         children: [
        //           Expanded(
        //             child: SingleChildScrollView(
        //               child: Column(
        //                 mainAxisSize: MainAxisSize.min,
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 children: [
        //                   SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        //                   SvgPicture.asset(AssetsData.sunImage, height: 150),
        //                   const SizedBox(height: 16),
        //                   Text(
        //                     'Enter your city now to get its weather status',
        //                     textAlign: TextAlign.center,
        //                     style: Styles.textStyle24.copyWith(color: kWhiteColor),
        //                   ),
        //                   const SizedBox(height: 32),
        //                   TextFormFieldWithTitle(
        //                     controller: cityController,
        //                     title: 'City',
        //                     placeholder: 'City name',
        //                   ),
        //                   const SizedBox(height: 32),
        //                 ],
        //               ),
        //             ),
        //           ),
        //           isLoading
        //               ? const CustomLoadingIndicator()
        //               : CustomButton(
        //             text: 'Search',
        //             itemCallBack: () {
        //               if (_enterCityFormKey.currentState!.validate()){
        //                 FocusScope.of(context).unfocus();
        //                 weatherStatusCubit.getWeatherStatus(cityName: cityController.text);
        //               }
        //             },
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // );
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF1B263B), Color(0xFF0D1B2A)],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Weather',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Find your city',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white60,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Search Bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      controller: _searchController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Search city...',
                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                        prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(0.7)),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.arrow_forward, color: Colors.white),
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
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      ),
                      onSubmitted: (value) {
                        // if (value.isNotEmpty) {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => WeatherDetailPage(cityName: value),
                        //     ),
                        //   );
                        // }
                      },
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Favorite Cities Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Favorite Cities',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Icon(Icons.favorite, color: Colors.red.withOpacity(0.8)),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Favorite Cities List
                  Expanded(
                    child: ListView.builder(
                      itemCount: favoriteCities.length,
                      itemBuilder: (context, index) {
                        return _buildFavoriteCityCard(favoriteCities[index], index);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  Widget _buildFavoriteCityCard(String cityName, int index) {
    final icons = [Icons.wb_sunny, Icons.cloud, Icons.nights_stay, Icons.wb_cloudy];
    final temps = ['28°C', '18°C', '22°C', '15°C'];

    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => WeatherDetailPage(cityName: cityName),
        //   ),
        // );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.15),
              Colors.white.withOpacity(0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icons[index % icons.length], color: Colors.white, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cityName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Mostly sunny',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              temps[index % temps.length],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

}