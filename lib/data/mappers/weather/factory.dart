part of weather_mappers;

abstract class WeatherMapper {
  Mapper<WeatherModel, WeatherData> get getWeather;
}

@LazySingleton(as: WeatherMapper)
class RealMapperFactory implements WeatherMapper {
  @override
  Mapper<WeatherModel, WeatherData> get getWeather => getIt<GetWeatherMapper>();
}
