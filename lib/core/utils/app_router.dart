import 'package:go_router/go_router.dart';
import 'package:weather_status_app/features/weather_status/presentation/views/search_city_view.dart';
import 'package:weather_status_app/features/weather_status/presentation/views/show_weather_status_view.dart';

abstract class AppRouter {
  static const kSearchView = '/searchView';
  static const kShowStatusView = '/showStatusView';

  static final router = GoRouter(
    initialLocation: kSearchView,
    routes: [
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchCityView(),
      ),
      GoRoute(
        path: kShowStatusView,
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>?;
          final cityName = args?['cityName'] ?? '';

          return ShowWeatherStatusView(cityName: cityName);
        },
      ),
    ],
  );
}
