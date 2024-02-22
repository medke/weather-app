import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app_zvoove/data/models/base/result/result.dart';
import 'package:weather_app_zvoove/data/models/weather/city_model.dart';
import 'package:weather_app_zvoove/data/network/api/api_network.dart';
import 'package:weather_app_zvoove/di/di.dart';
import 'package:weather_app_zvoove/enums/weather_condition.dart';
import 'package:weather_app_zvoove/features/features.dart';

import 'main_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<WeatherRepository>(),
  MockSpec<WeatherCubit>(),
  MockSpec<WeatherApi>(),
])
void main() {
  group('weather cubits test', () {
    late final MockWeatherRepository weatherRepository;
    late final MockWeatherCubit weatherCubit;
    late final MockWeatherApi weatherApi;
    const City city = City(cityName: "Munich", latitude: 48.137154, longitude: 11.576124);
    final WeatherData weatherData = WeatherData(
      temperature: 20,
      humidity: 50,
      pressure: 1000,
      wind: 10.0,
      condition: WeatherCondition.cloudy,
      lastUpdated: '2021',
    );
    setUpAll(() {
      TestWidgetsFlutterBinding.ensureInitialized();

      weatherRepository = MockWeatherRepository();
      weatherCubit = MockWeatherCubit();
      weatherApi = MockWeatherApi();
    });
    setUp(() {
      getIt.registerLazySingleton<WeatherCubit>(() => weatherCubit, dispose: (cubit) => cubit.close());
    });
    tearDown(() {
      getIt.reset();
    });

    blocTest<WeatherCubit, WeatherState>(
      'emits [WeatherLoaded] when getWeather is successful',
      build: () {
        when(weatherRepository.getWeather(city: anyNamed('city'))).thenAnswer(
          (value) async => Future.value(
            SuccessResult(
              weatherData,
            ),
          ),
        );
        return WeatherCubit(repository: weatherRepository);
      },
      act: (cubit) async {
        cubit.getWeather();
      },
      expect: () => [
        WeatherState.loaded(
          weatherData: weatherData,
          city: city,
        ),
      ],
      verify: (_) {
        verify(weatherRepository.getWeather(city: anyNamed('city'))).called(2);
      },
    );
    blocTest<WeatherCubit, WeatherState>(
      'emits [WeatherError] when getWeather is not successful',
      build: () {
        when(weatherRepository.getWeather(city: anyNamed('city'))).thenAnswer(
          (value) async => Future.value(
            FailureResult(
              const UnexpectedFailure('error'),
            ),
          ),
        );
        return WeatherCubit(repository: weatherRepository);
      },
      act: (cubit) async {
        cubit.getWeather();
      },
      expect: () => [
        const WeatherState.error(failure: UnexpectedFailure('error')),
      ],
      verify: (_) {
        verify(weatherRepository.getWeather(city: anyNamed('city'))).called(2);
      },
    );
  });
}
