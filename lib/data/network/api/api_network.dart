library api_network;

import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app_zvoove/data/models/weather/city_model.dart';
import 'package:weather_app_zvoove/data/models/weather/weather_model.dart';
import 'package:weather_app_zvoove/utils/config.dart';

part 'app.dart';
part 'base.dart';part 'weather.dart';
