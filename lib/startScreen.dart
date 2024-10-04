import 'package:flutter/material.dart';
import 'package:know_my_weather/tempscreen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF1F264A), Color(0xFF8D4AAC)])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/weather_icon.png",
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Weather",
            style: TextStyle(
                fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const Text(
            "Forecasts",
            style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Color(0xFFDCB131)),
          ),
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TempScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDCB131),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 20)),
              child: const Text(
                "Get Started",
                style: TextStyle(color: Color(0xFF1F264A), fontSize: 20),
              ))
        ],
      ),
    ));
  }
}
