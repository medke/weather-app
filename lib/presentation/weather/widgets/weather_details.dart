part of weather_page;

class WeatherDetailsDisplay extends StatelessWidget {
  const WeatherDetailsDisplay({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final WeatherData weather;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WeatherDetail(
          label: 'Humidity',
          value: "${weather.humidity.toString()} %",
        ),
        WeatherDetail(
          label: 'Pressure',
          value: "${weather.pressure.toString()} hPa",
        ),
        WeatherDetail(
          label: 'Wind',
          value: "${weather.wind.toStringAsFixed(1)} km/h",
        ),
      ],
    );
  }
}

class WeatherDetail extends StatelessWidget {
  const WeatherDetail({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto',
            color: Color(0xFFBEBDBD),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto',
          ),
        ),
      ],
    );
  }
}