part of weather_page;

class DateDisplay extends StatelessWidget {
  const DateDisplay({
    Key? key,
    required this.now,
  }) : super(key: key);

  final DateTime now;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat.EEEE().format(now),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
          ),
        ),
        Text(
          DateFormat.Hm().format(now),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
            color: Color(0xFFBEBDBD),
          ),
        ),
      ],
    );
  }
}