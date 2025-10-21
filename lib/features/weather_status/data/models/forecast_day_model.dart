class ForecastDay {
  final DateTime date;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;
  final String? icon;
  final int chanceOfRain;

  ForecastDay({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
    this.icon,
    required this.chanceOfRain,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      date: DateTime.parse(json['date']),
      maxTemp: json['day']['maxtemp_c'].toDouble(),
      minTemp: json['day']['mintemp_c'].toDouble(),
      weatherCondition: json['day']['condition']['text'],
      icon: json['day']['condition']['icon'],
      chanceOfRain: json['day']['daily_chance_of_rain'],
    );
  }
}
