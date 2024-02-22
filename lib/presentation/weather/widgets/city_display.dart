part of weather_page;

class CityDisplay extends StatelessWidget {
  const CityDisplay({
    Key? key,
    required this.city,
  }) : super(key: key);

  final City city;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 146,
      decoration: const BoxDecoration(
        color: Color(0xFFF5F5F5),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFC0C0C0),
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined),
          Text(city.cityName),
        ],
      ),
    );
  }
}
