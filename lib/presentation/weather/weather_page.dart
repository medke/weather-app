part of weather_page;

class WeatherPage extends StatelessWidget {
  WeatherPage({Key? key}) : super(key: key);

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocProvider(
            create: (context) => getIt<WeatherCubit>(),
            child: BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loaded: (weather, city) => SmartRefresher(
                    header: const WaterDropHeader(),
                    controller: _refreshController,
                    onRefresh: () async {
                      await Future.delayed(const Duration(milliseconds: 1000));
                      getIt<WeatherCubit>().refresh();
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DateDisplay(now: now),
                        const SizedBox(height: 30),
                        CityDisplay(city: city),
                        const SizedBox(height: 30),
                        WeatherDisplay(weather: weather),
                        const SizedBox(height: 30),
                        const Divider(
                          color: Color(0xFFF5F5F5),
                        ),
                        const SizedBox(height: 30),
                        WeatherDetailsDisplay(weather: weather),
                        const SizedBox(height: 30),
                        const Divider(
                          color: Color(0xFFF5F5F5),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (error) {
                    print('Error: $error');

                    return Center(
                      child: Text('Error: $error'),
                    );
                  },
                  orElse: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
