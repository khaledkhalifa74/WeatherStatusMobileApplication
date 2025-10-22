import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_status_app/core/errors/failure.dart';
import 'package:weather_status_app/features/weather_status/data/data_sources/local_data_sources/favorite_cities_local_data_source.dart';
import 'package:weather_status_app/features/weather_status/data/data_sources/remote_data_sources/weather_status_remote_data_source.dart';
import 'package:weather_status_app/features/weather_status/data/models/weather_model.dart';
import 'package:weather_status_app/features/weather_status/domain/repos/get_weather_status_repo.dart';
import 'package:weather_status_app/features/weather_status/data/repos/get_weather_status_repo_impl.dart';

// Mock Classes
class MockWeatherStatusRemoteDataSource extends Mock
    implements WeatherStatusRemoteDataSource {}

class MockFavoriteCitiesLocalDataSource extends Mock
    implements FavoriteCitiesLocalDataSource {}

void main() {
  late GetWeatherStatusRepo repo;
  late MockWeatherStatusRemoteDataSource mockRemoteDataSource;
  late MockFavoriteCitiesLocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockWeatherStatusRemoteDataSource();
    mockLocalDataSource = MockFavoriteCitiesLocalDataSource();
    repo = GetWeatherStatusRepoImpl(
      favoriteCitiesLocalDataSource: mockLocalDataSource,
      weatherStatusRemoteDataSource: mockRemoteDataSource,
    );
  });

  group('GetWeatherStatusRepoImpl Tests', () {
    const testCity = 'Cairo';

    final fakeWeatherModel = WeatherModel(
      cityName: testCity,
      temp: 28.5,
      humidity: 45,
      windSpeed: 15,
      visibility: 10,
      weatherCondition: 'Sunny',
      image: '//cdn.weatherapi.com/icon.png',
      forecast: [],
      date: DateTime.parse('2025-10-22'),
    );

    test('should return WeatherModel when API call is successful', () async {
      // Arrange
      when(() => mockRemoteDataSource.getWeatherStatus(cityName: testCity))
          .thenAnswer((_) async => fakeWeatherModel);

      // Act
      final result = await repo.getWeatherStatus(cityName: testCity);

      // Assert
      expect(result, Right(fakeWeatherModel));
      verify(() => mockRemoteDataSource.getWeatherStatus(cityName: testCity)).called(1);
    });

    test('should return ServerFailure when API throws DioException', () async {
      // Arrange
      when(() => mockRemoteDataSource.getWeatherStatus(cityName: testCity))
          .thenThrow(DioException(
        requestOptions: RequestOptions(path: '/forecast.json'),
        type: DioExceptionType.connectionError,
      ));

      // Act
      final result = await repo.getWeatherStatus(cityName: testCity);

      // Assert
      expect(result.isLeft(), true);
      expect(
        result.fold((failure) => failure, (r) => null),
        isA<ServerFailure>(),
      );
      verify(() => mockRemoteDataSource.getWeatherStatus(cityName: testCity)).called(1);
    });

    test('should return ServerFailure when API throws generic exception', () async {
      // Arrange
      when(() => mockRemoteDataSource.getWeatherStatus(cityName: testCity))
          .thenThrow(Exception('Unexpected Error'));

      // Act
      final result = await repo.getWeatherStatus(cityName: testCity);

      // Assert
      expect(result.isLeft(), true);
      expect(
        result.fold((failure) => failure, (r) => null),
        isA<ServerFailure>(),
      );
      verify(() => mockRemoteDataSource.getWeatherStatus(cityName: testCity)).called(1);
    });
  });
}
