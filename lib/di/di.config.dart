// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:weather_app_zvoove/data/mappers/weather/weather_mappers.dart'
    as _i4;
import 'package:weather_app_zvoove/data/network/api/api_network.dart' as _i5;
import 'package:weather_app_zvoove/data/repositories/weather.dart' as _i7;
import 'package:weather_app_zvoove/features/weather/weather.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final httpClientModule = _$HttpClientModule();
    gh.lazySingleton<_i3.Client>(() => httpClientModule.httpClient);
    gh.lazySingleton<_i4.GetWeatherMapper>(() => const _i4.GetWeatherMapper());
    gh.factory<_i5.WeatherApi>(
      () => _i5.WeatherApi(client: gh<_i3.Client>()),
      instanceName: 'WeatherApi',
    );
    gh.lazySingleton<_i6.WeatherLocalDataSource>(
        () => _i7.RealWeatherLocalDataSource());
    gh.lazySingleton<_i4.WeatherMapper>(() => _i4.RealMapperFactory());
    gh.lazySingleton<_i6.WeatherRemoteDataSource>(() =>
        _i7.RealWeatherRemoteDataSource(
            weatherApi: gh<_i5.WeatherApi>(instanceName: 'WeatherApi')));
    gh.lazySingleton<_i6.WeatherRepository>(() => _i7.RealWeatherRepository(
          localDataSource: gh<_i6.WeatherLocalDataSource>(),
          remoteDataSource: gh<_i6.WeatherRemoteDataSource>(),
          weatherMapper: gh<_i4.WeatherMapper>(),
        ));
    gh.factory<_i5.AppApi>(
      () => _i5.AppApi(client: gh<_i3.Client>()),
      instanceName: 'AppApi',
    );
    gh.lazySingleton<_i6.WeatherCubit>(
        () => _i6.WeatherCubit(repository: gh<_i6.WeatherRepository>()));
    return this;
  }
}

class _$HttpClientModule extends _i5.HttpClientModule {}
