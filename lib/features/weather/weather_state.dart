part of weather;

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.initial({required City city}) = _Initial;

  const factory WeatherState.loading() = _Loading;

  const factory WeatherState.loaded({required WeatherData weatherData, required City city}) = _Loaded;

  const factory WeatherState.error({required Failure failure}) = _Error;

}
