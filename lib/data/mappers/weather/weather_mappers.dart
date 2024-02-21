library weather_mappers;

import 'package:injectable/injectable.dart';
import 'package:weather_app_zvoove/data/mappers/base.dart';
import 'package:weather_app_zvoove/data/models/base/result/result.dart';
import 'package:weather_app_zvoove/data/models/weather/weather_model.dart';
import 'package:weather_app_zvoove/di/di.dart';
import 'package:weather_app_zvoove/enums/weather_condition.dart';
import 'package:weather_app_zvoove/features/weather/weather.dart';

part 'factory.dart';
part 'get_weather_mapper.dart';
