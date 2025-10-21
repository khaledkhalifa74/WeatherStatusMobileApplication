import 'package:weather_status_app/features/weather_status/data/models/forecast_day_model.dart';

class WeatherModel {
  final String cityName;
  final String? image;
  final double temp;
  final String weatherCondition;
  final int humidity;
  final double windSpeed;
  final double visibility;
  final List<ForecastDay> forecast;
  final DateTime date;

  WeatherModel({
    required this.cityName,
    this.image,
    required this.temp,
    required this.weatherCondition,
    required this.humidity,
    required this.windSpeed,
    required this.visibility,
    required this.forecast,
    required this.date,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    // Parse forecast days
    List<ForecastDay> forecastList = [];
    if (json['forecast'] != null && json['forecast']['forecastday'] != null) {
      for (var day in json['forecast']['forecastday']) {
        forecastList.add(ForecastDay.fromJson(day));
      }
    }

    // Get current day data (first forecast day)
    var currentDay = json['forecast']['forecastday'][0];

    return WeatherModel(
      cityName: json['location']['name'],
      temp: currentDay['day']['avgtemp_c'].toDouble(),
      humidity: currentDay['day']['avghumidity'],
      windSpeed: currentDay['day']['maxwind_mph'].toDouble(),
      visibility: currentDay['day']['avgvis_km'].toDouble(),
      weatherCondition: currentDay['day']['condition']['text'],
      image: currentDay['day']['condition']['icon'],
      forecast: forecastList,
      date: DateTime.parse(json['location']['localtime']),
    );
  }
}