part of weather;

abstract class WeatherRepository {
  Future<Result<WeatherData, Failure>> getWeather({
    required City city,
  });
}

abstract class WeatherLocalDataSource {
  const WeatherLocalDataSource();
}

abstract class WeatherRemoteDataSource {
  const WeatherRemoteDataSource();

  Future<Result<WeatherModel, Failure>> getWeather({
    required City city,
  });
}
