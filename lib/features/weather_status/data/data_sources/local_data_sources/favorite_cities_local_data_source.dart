import 'package:hive/hive.dart';

abstract class FavoriteCitiesLocalDataSource{
  Future<List<String>> getFavoriteCities();
  Future<bool> addCityToFavorites({required String cityName});
  Future<bool> removeCityFromFavorites({required String cityName});
  Future<bool> isFavorite({required String cityName});
}

class FavoriteCitiesLocalDataSourceImpl extends FavoriteCitiesLocalDataSource{
  static final Box _box = Hive.box('favoritesBox');
  @override
  Future<bool> addCityToFavorites({required String cityName}) async{
    final cities = await getFavoriteCities();
    if (!cities.contains(cityName)) {
      cities.add(cityName);
      await _box.put('cities', cities);
      return true;
    }
    return false;
  }

  @override
  Future<bool> removeCityFromFavorites({required String cityName}) async{
    final cities = await getFavoriteCities();
    if (cities.contains(cityName)) {
      cities.remove(cityName);
      await _box.put('cities', cities); // update Hive box
      return true;
    }
    return false;
  }

  @override
  Future<List<String>> getFavoriteCities() async{
    final cities = await _box.get('cities', defaultValue: []);
    return List<String>.from(cities);
  }

  @override
  Future<bool> isFavorite({required String cityName}) async{
    final cities = await getFavoriteCities();
    return cities.contains(cityName);
  }
}