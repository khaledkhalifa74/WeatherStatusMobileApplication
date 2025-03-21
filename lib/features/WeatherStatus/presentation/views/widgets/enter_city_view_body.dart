import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_status_app/core/utils/assets.dart';
import 'package:weather_status_app/core/utils/colors.dart';
import 'package:weather_status_app/core/utils/styles.dart';
import 'package:weather_status_app/core/widgets/custom_button.dart';
import 'package:weather_status_app/core/widgets/custom_loading_indicator.dart';
import 'package:weather_status_app/core/widgets/text_form_field_with_title.dart';

class EnterCityViewBody extends StatefulWidget {
  const EnterCityViewBody({super.key});

  @override
  State<EnterCityViewBody> createState() => _EnterCityViewBodyState();
}

class _EnterCityViewBodyState extends State<EnterCityViewBody> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Take only needed space
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
                title: 'City',
                placeholder: 'City name',
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * .1),
              isLoading
                  ? const CustomLoadingIndicator()
                  : CustomButton(
                text: 'Search',
                itemCallBack: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
