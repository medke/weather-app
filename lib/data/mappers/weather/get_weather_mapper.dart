part of weather_mappers;

@LazySingleton()
class GetWeatherMapper extends Mapper<WeatherModel, WeatherData> {
  const GetWeatherMapper();

  @override
  WeatherData fromEntity(WeatherModel entity) {
    if(entity.main == null || entity.main?.temp == null || entity.weather == null || entity.wind == null) {
      throw const UnexpectedFailure('Invalid WeatherModel');
    }
    return WeatherData(
      temperature: (entity.main!.temp! - 273.15).round(), // convert Kelvin to Celsius
      condition: WeatherCondition.fromName(entity.weather!.first.main?.toLowerCase()),
      lastUpdated: entity.dt.toString(),
      humidity: entity.main?.humidity ?? 0,
      pressure: entity.main?.pressure ?? 0,
      wind: entity.wind?.speed ?? 0,
    );
  }

  @override
  WeatherModel toEntity(WeatherData item) {
    throw UnimplementedError();
  }
}
