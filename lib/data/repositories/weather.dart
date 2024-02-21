import 'package:injectable/injectable.dart';
import 'package:weather_app_zvoove/data/mappers/weather/weather_mappers.dart';
import 'package:weather_app_zvoove/data/models/base/result/result.dart';
import 'package:weather_app_zvoove/data/models/weather/city_model.dart';
import 'package:weather_app_zvoove/data/models/weather/weather_model.dart';
import 'package:weather_app_zvoove/data/network/api/api_network.dart';
import 'package:weather_app_zvoove/features/weather/weather.dart';

@LazySingleton(as: WeatherRepository)
class RealWeatherRepository implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;
  final WeatherMapper weatherMapper;

  const RealWeatherRepository({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.weatherMapper,
  });

  @override
  Future<Result<WeatherData, Failure>> getWeather({required City city}) async {
    final result = await remoteDataSource.getWeather(
      city: city,
    );
    return result.fold(
      onSuccess: (response) => SuccessResult(weatherMapper.getWeather.fromEntity(response!)),
      onFailure: (failure) => FailureResult(failure),
    );
  }
}

@LazySingleton(as: WeatherRemoteDataSource)
class RealWeatherRemoteDataSource extends WeatherRemoteDataSource {
  const RealWeatherRemoteDataSource({
    @Named('WeatherApi') required this.weatherApi,
  });

  final WeatherApi weatherApi;

  @override
  Future<Result<WeatherModel, Failure>> getWeather({
    required City city,
  }) async {
    try {
      final response = await weatherApi.getWeather(
        city: city,
      );

      return SuccessResult(response);
    } catch (e) {
      return FailureResult(UnexpectedFailure(e));
    }
  }
}

@LazySingleton(as: WeatherLocalDataSource)
class RealWeatherLocalDataSource extends WeatherLocalDataSource {}
