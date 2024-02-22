part of weather;

@lazySingleton
class WeatherCubit extends Cubit<WeatherState> {
  Timer? _timer;
  int _currentCityIndex = 0;

  WeatherCubit({
    required WeatherRepository repository,
  })  : _repository = repository,
        super(WeatherState.initial(city: cities[0])) {
    _timer = Timer.periodic(const Duration(minutes: 1), (Timer t) => _changeCity());
    getWeather();
  }

  final WeatherRepository _repository;

  void _changeCity() {
    _currentCityIndex = (_currentCityIndex + 1) % cities.length;
    final City newCity = cities[_currentCityIndex];
    emit(WeatherState.initial(city: newCity));
    getWeather();
  }

  void refresh() async {
    _timer?.cancel(); // Cancel the current timer
    _timer = Timer.periodic(const Duration(minutes: 1), (Timer t) => _changeCity()); // Start a new timer
    getWeather();
  }

  void getWeather() async {
    emit(const WeatherState.loading());
    final City city = cities[_currentCityIndex];
    final result = await _repository.getWeather(city: city);
    result.fold(
      onFailure: (failure) => emit(WeatherState.error(failure: failure)),
      onSuccess: (weatherData) => emit(WeatherState.loaded(weatherData: weatherData!, city: city)),
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
