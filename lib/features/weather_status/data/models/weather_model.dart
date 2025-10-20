class WeatherModel {
  final String cityName;
  final String? image;
  final double temp;
  final String weatherCondition;
  final int? humidity;
  final double? windSpeed;

  WeatherModel(
      {required this.cityName,
        this.image,
        required this.temp,
        required this.weatherCondition,
        required this.humidity,
        required this.windSpeed
      });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      humidity: json['forecast']['forecastday'][0]['day']['avghumidity'],
      windSpeed: json['forecast']['forecastday'][0]['day']['maxwind_mph'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}