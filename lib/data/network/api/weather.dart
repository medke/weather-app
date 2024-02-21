part of api_network;

const String baseWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';

@named
@injectable
class WeatherApi extends BaseApi {
  WeatherApi({
    required Client client,
  }) : super(
          client: client,
        );

  String buildUrl({required City city}) {
    return '$baseWeatherURL?lat=${city.latitude}&lon=${city.longitude}&appid=${dotenv.env['WEATHER_API_KEY']}';
  }

  Future<WeatherModel> getWeather({required City city}) async {
    printLog(">>>>>> WEATHER API REQUEST >>>>>>>>");
    printLog(city.toString());
    printLog(">>>>>>>>>>>>>>>>>>>>>>>>>>>");
    try {
      final response = await get(Uri.parse(buildUrl(city: city)), headers: {
        'Content-Type': 'application/json',
      });

      printLog(">>>>>> WEATHER API RESPONSE >>>>>>>>");
      printLog(response.body);
      printLog(">>>>>>>>>>>>>>>>>>>>>>>>>>>");

      if (response.statusCode == HttpStatus.ok) {
        final responseData = WeatherModel.fromJson(json.decode(response.body));
        return responseData;
      } else {
        printLog(">>>>>> WEATHER API HTTP ERROR >>>>>>>>");
        throw Exception('ERROR: ${response.statusCode}');
      }
    } catch (e, s) {
      printLog(">>>>>> WEATHER API APP ERROR >>>>>>>>");

      throw Exception('Error: $e $s');
    }
  }
}
