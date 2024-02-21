
enum WeatherCondition {
  cloudy('cloudy'),
  sunny('sunny'),
  rainy('rainy'),
  snowy('snowy'),
  thunder('thunder');

  final String name;

  const WeatherCondition(this.name);

  // weather condition from name
  static WeatherCondition fromName(String? name) {
    switch (name) {
      case 'clouds':
        return WeatherCondition.cloudy;
      case 'clear':
        return WeatherCondition.sunny;
      case 'rainy':
        return WeatherCondition.rainy;
      case 'snowy':
        return WeatherCondition.snowy;
      case 'thunder':
        return WeatherCondition.thunder;
      default:
        return WeatherCondition.cloudy;
    }
  }

  String getSvgName() {
    switch (name) {
      case 'cloudy':
        return 'cloudy.svg';
      case 'sunny':
        return 'sunny.svg';
      case 'rainy':
        return 'weather_raining.svg';
      case 'snowy':
        return 'snowy-1.svg';
      case 'thunder':
        return 'thunder.svg';
      default:
        return 'cloudy.svg';
    }
  }
}
