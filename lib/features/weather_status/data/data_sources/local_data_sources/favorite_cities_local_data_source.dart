import 'package:hive/hive.dart';

abstract class FavoriteCitiesLocalDataSource{
  List<String> getFavoriteCities();
  Future<bool> addCityToFavorites({required String cityName});
  bool isFavorite({required String cityName});
}

class FavoriteCitiesLocalDataSourceImpl extends FavoriteCitiesLocalDataSource{
  static final Box _box = Hive.box('favoritesBox');
  @override
  Future<bool> addCityToFavorites({required String cityName}) async{
    final cities = getFavoriteCities();
    if (!cities.contains(cityName)) {
      cities.add(cityName);
      await _box.put('cities', cities);
      return true;
    }
    return false;
  }

  @override
  List<String> getFavoriteCities() {
    return List<String>.from(_box.get('cities', defaultValue: []));
  }

  @override
  bool isFavorite({required String cityName}) {
    final cities = getFavoriteCities();
    return cities.contains(cityName);
  }
}