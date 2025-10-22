import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_status_app/features/weather_status/data/data_sources/local_data_sources/favorite_cities_local_data_source.dart';
import 'package:weather_status_app/features/weather_status/data/repos/get_weather_status_repo_impl.dart';
import 'package:weather_status_app/features/weather_status/data/data_sources/remote_data_sources/weather_status_remote_data_source.dart';

// Mock Classes
class MockFavoriteCitiesLocalDataSource extends Mock
    implements FavoriteCitiesLocalDataSource {}

class MockWeatherStatusRemoteDataSource extends Mock
    implements WeatherStatusRemoteDataSource {}

void main() {
  late GetWeatherStatusRepoImpl repo;
  late MockFavoriteCitiesLocalDataSource mockLocalDataSource;
  late MockWeatherStatusRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockLocalDataSource = MockFavoriteCitiesLocalDataSource();
    mockRemoteDataSource = MockWeatherStatusRemoteDataSource();
    repo = GetWeatherStatusRepoImpl(
      favoriteCitiesLocalDataSource: mockLocalDataSource,
      weatherStatusRemoteDataSource: mockRemoteDataSource,
    );
  });

  group('Favorite Cities Repository Tests', () {
    const cityName = 'Cairo';

    test('addCityToFavorites returns Right(true) when successfully added', () async {
      // Arrange
      when(() => mockLocalDataSource.addCityToFavorites(cityName: cityName))
          .thenAnswer((_) async => true);

      // Act
      final result = await repo.addCityToFavorites(cityName: cityName);

      // Assert
      expect(result, const Right(true));
      verify(() => mockLocalDataSource.addCityToFavorites(cityName: cityName)).called(1);
    });

    test('addCityToFavorites returns Left when city already exists', () async {
      when(() => mockLocalDataSource.addCityToFavorites(cityName: cityName))
          .thenAnswer((_) async => false);

      final result = await repo.addCityToFavorites(cityName: cityName);

      expect(result.isLeft(), true);
      verify(() => mockLocalDataSource.addCityToFavorites(cityName: cityName)).called(1);
    });

    test('removeCityFromFavorites returns Right(true) when removed', () async {
      when(() => mockLocalDataSource.removeCityFromFavorites(cityName: cityName))
          .thenAnswer((_) async => true);

      final result = await repo.removeCityFromFavorites(cityName: cityName);

      expect(result, const Right(true));
      verify(() => mockLocalDataSource.removeCityFromFavorites(cityName: cityName)).called(1);
    });

    test('removeCityFromFavorites returns Left when city not found', () async {
      when(() => mockLocalDataSource.removeCityFromFavorites(cityName: cityName))
          .thenAnswer((_) async => false);

      final result = await repo.removeCityFromFavorites(cityName: cityName);

      expect(result.isLeft(), true);
    });

    test('getFavoriteCities returns list when not empty', () async {
      final cities = ['Cairo', 'Paris'];
      when(() => mockLocalDataSource.getFavoriteCities())
          .thenAnswer((_) async => cities);

      final result = await repo.getFavoriteCities();

      expect(result, Right(cities));
      verify(() => mockLocalDataSource.getFavoriteCities()).called(1);
    });

    test('getFavoriteCities returns Left when empty', () async {
      when(() => mockLocalDataSource.getFavoriteCities())
          .thenAnswer((_) async => []);

      final result = await repo.getFavoriteCities();

      expect(result.isLeft(), true);
    });

    test('isFavorite returns Right(true) when city is in favorites', () async {
      when(() => mockLocalDataSource.isFavorite(cityName: cityName))
          .thenAnswer((_) async => true);

      final result = await repo.isFavorite(cityName: cityName);

      expect(result, const Right(true));
    });

    test('isFavorite returns Left when city is not in favorites', () async {
      when(() => mockLocalDataSource.isFavorite(cityName: cityName))
          .thenAnswer((_) async => false);

      final result = await repo.isFavorite(cityName: cityName);

      expect(result.isLeft(), true);
    });
  });
}
