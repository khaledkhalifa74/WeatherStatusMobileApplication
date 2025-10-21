import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weather_status_app/core/utils/app_router.dart';
import 'package:weather_status_app/core/utils/colors.dart';
import 'package:weather_status_app/core/widgets/custom_text_form_field.dart';
import 'package:weather_status_app/features/weather_status/presentation/manager/weather_status_cubit/weather_status_cubit.dart';
import 'package:weather_status_app/features/weather_status/presentation/manager/weather_status_cubit/weather_status_state.dart';
import 'package:weather_status_app/features/weather_status/presentation/views/widgets/custom_body_decoration.dart';
import 'package:weather_status_app/features/weather_status/presentation/views/widgets/custom_header.dart';
import 'package:weather_status_app/features/weather_status/presentation/views/widgets/favorites_cities_item.dart';

class SearchCityViewBody extends StatefulWidget {
  const SearchCityViewBody({super.key});

  @override
  State<SearchCityViewBody> createState() => _SearchCityViewBodyState();
}

class _SearchCityViewBodyState extends State<SearchCityViewBody> {
  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<FormState> _searchFormKey = GlobalKey<FormState>();
  bool isLoading = false;
  List<String> favoriteCities = [];
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherStatusCubit,WeatherStatusState>(
      listener: (context, state) {
        if(state is StartLoadingGetFavoriteCitiesState){
          isLoading = true;
        }else if(state is StopLoadingGetFavoriteCitiesState){
          isLoading = false;
        }
        if(state is GetFavoriteCitiesSuccessState){
          favoriteCities = state.cities;
        }
      },
      builder: (context, state) {
        return Skeletonizer(
          enabled: isLoading,
          textBoneBorderRadius: TextBoneBorderRadius(BorderRadius.circular(4)),
          effect: ShimmerEffect(
            baseColor: kBorderColor,
            highlightColor: kFilledColor,
            duration: const Duration(seconds: 2),
          ),
          containersColor: kFilledColor,
          child: RefreshIndicator(
            color: kWhiteColor,
            onRefresh: () async {
              context.read<WeatherStatusCubit>().getFavoriteCities();
            },
            child: Container(
              decoration: customBodyDecoration(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 32,
                    horizontal: 16,
                  ),
                  child: Form(
                    key: _searchFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomHeader(),
                        CustomTextFormField(
                          controller: _searchController,
                          placeholder: 'Search city...',
                          onFieldSubmitted: (value) {
                            if(_searchFormKey.currentState!.validate()){
                              context.push(
                                  AppRouter.kShowStatusView,
                                  extra: {
                                    'cityName' : _searchController.text,
                                  }
                              );
                            }
                          },
                          suffix: IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_rounded,
                              color: kWhiteColor,
                            ),
                            onPressed: () {
                              if(_searchFormKey.currentState!.validate()){
                                context.push(
                                    AppRouter.kShowStatusView,
                                    extra: {
                                      'cityName' : _searchController.text,
                                    }
                                );
                              }
                            },
                          ),
                          prefix: Icon(
                            Icons.search_rounded,
                            color: kWhiteColor,
                          ),
                        ),
                        const SizedBox(height: 40),
                        FavoritesCitiesItem(
                          favoriteCities: favoriteCities,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
