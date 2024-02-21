import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app_zvoove/di/di.dart';
import 'package:weather_app_zvoove/presentation/weather/weather.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies(Environment.dev);
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Roboto',
        primaryColor: const Color(0xFF222529),
      ),
      home:  WeatherPage(),
    );
  }
}
