part of weather;

class WeatherData {
  final int temperature;
  final int humidity;
  final int pressure;
  final double wind;
  final WeatherCondition condition;
  final String lastUpdated;

  WeatherData({
    required this.temperature,
    required this.condition,
    required this.lastUpdated,
    required this.humidity,
    required this.pressure,
    required this.wind,
  });
}