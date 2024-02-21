part of weather_page;
class WeatherDisplay extends StatelessWidget {
  const WeatherDisplay({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final WeatherData weather;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              "${weather.temperature.toStringAsFixed(1)} °",
              style: const TextStyle(
                fontSize: 46,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              weather.condition.name.capitalize(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
        SvgPicture.asset(
          'assets/${weather.condition.getSvgName()}',
          semanticsLabel: 'Weather Icon',
          height: 144,
          width: 144,
        )
      ],
    );
  }
}