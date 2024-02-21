part of api_network;

typedef FromJsonParser<T> = T Function(Map<String, dynamic> json);

const String baseURL = 'https://';

abstract class BaseApi {
  final http.Client client;

  BaseApi({
    @factoryParam required this.client,
  });

  Future<http.Response> post(String url, {String? body, bool withHttp = false}) {
    Map<String, String> headers = {
      'Content-type': 'application/json',
    };

    printLog("<<<<<<<<< POST $baseURL$url <<<<<<<<<");
    printLog('$body');
    printLog(">>>>>>>>>>>>>>>>>>");

    String link = baseURL + url;
    return client.post(Uri.parse(link), body: body, headers: headers).then((response) {
      printLog("<<<<<<<<< POST $baseURL$url <<<<<<<<<");
      printLog(response.body);
      printLog("<<<<<<<<<<<<<<<<<<");
      return response;
    });
  }

  T processResponse<T>({
    required Response response,
    required FromJsonParser<T> parser,
  }) {
    if (response.statusCode >= HttpStatus.ok && response.statusCode <= HttpStatus.imUsed) {
      return parser.call(json.decode(response.body));
    } else {
      throw json.decode(response.body)["error"];
    }
  }
}

@module
abstract class HttpClientModule {
  @lazySingleton // or @singleton
  http.Client get httpClient => http.Client();
}
