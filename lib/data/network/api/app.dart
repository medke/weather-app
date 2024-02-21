part of api_network;

@named
@injectable
class AppApi extends BaseApi {
  AppApi({
    required Client client,
  }) : super(
          client: client,
        );
}
