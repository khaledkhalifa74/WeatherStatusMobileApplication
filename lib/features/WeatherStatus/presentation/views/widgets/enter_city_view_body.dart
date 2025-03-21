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
import 'package:weather_status_app/features/WeatherStatus/presentation/manager/weather_status_cubit.dart';
import 'package:weather_status_app/features/WeatherStatus/presentation/manager/weather_status_states.dart';
import 'package:weather_status_app/core/utils/globals.dart' as globals;
import 'package:weather_status_app/features/WeatherStatus/presentation/views/show_weather_status_view.dart';

class EnterCityViewBody extends StatefulWidget {
  const EnterCityViewBody({super.key});

  @override
  State<EnterCityViewBody> createState() => _EnterCityViewBodyState();
}

class _EnterCityViewBodyState extends State<EnterCityViewBody> {
  final _enterCityFormKey = GlobalKey<FormState>();
  TextEditingController cityController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    cityController.dispose();
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
          globals.navigatorKey.currentState!.pushNamed(ShowWeatherStatusView.id,arguments: {
            'weatherStatusCubit' : weatherStatusCubit,
            'weatherModel': weatherStatusCubit.weatherModel
          });
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
        return Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [kBGColor, kBG2Color],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Form(
              key: _enterCityFormKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                          SvgPicture.asset(AssetsData.sunImage, height: 150),
                          const SizedBox(height: 16),
                          Text(
                            'Enter your city now to get its weather status',
                            textAlign: TextAlign.center,
                            style: Styles.textStyle24.copyWith(color: kWhiteColor),
                          ),
                          const SizedBox(height: 32),
                          TextFormFieldWithTitle(
                            controller: cityController,
                            title: 'City',
                            placeholder: 'City name',
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                  isLoading
                      ? const CustomLoadingIndicator()
                      : CustomButton(
                    text: 'Search',
                    itemCallBack: () {
                      if (_enterCityFormKey.currentState!.validate()){
                        FocusScope.of(context).unfocus();
                        weatherStatusCubit.getWeatherStatus(cityName: cityController.text);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
