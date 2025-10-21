import 'package:go_router/go_router.dart';
import 'package:weather_status_app/features/weather_status/presentation/views/search_city_view.dart';

abstract class AppRouter {
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    initialLocation: kSearchView,
    routes: [
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchCityView(),
      ),
    ],
  );
}
