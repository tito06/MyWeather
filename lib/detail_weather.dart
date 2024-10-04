import 'package:flutter/material.dart';
import 'package:know_my_weather/detail_Item.dart';

class DetailWeather extends StatefulWidget {
  const DetailWeather({super.key});

  @override
  State<DetailWeather> createState() => _DetailWeatherState();
}

class _DetailWeatherState extends State<DetailWeather> {
  final List<DetailItem> items = [
    DetailItem('20°c', 'Mon', "assets/weather_small_icon.png"),
    DetailItem('22°c', 'Tue', "assets/weather_small_icon.png"),
    DetailItem('7°c', 'Wed', "assets/weather_small_icon.png"),
    DetailItem('17°c', 'Thu', "assets/weather_small_icon.png"),
    DetailItem('27°c', 'Fri', "assets/weather_small_icon.png"),
    DetailItem('17°c', 'Sat', "assets/weather_small_icon.png"),
    DetailItem('17°c', 'Sun', "assets/weather_small_icon.png"),
    DetailItem('17°c', 'Mon', "assets/weather_small_icon.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xFF1F264A),
                  Color(0xFF8D4AAC),
                ])),
            child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                items: [
                  BottomNavigationBarItem(
                      icon: Image.asset("assets/icon_location.png"), label: ""),
                  BottomNavigationBarItem(
                      icon: Image.asset("assets/icon_plus.png"), label: ""),
                  BottomNavigationBarItem(
                      icon: Image.asset("assets/icon_menu.png"), label: ""),
                ])),
        body: Container(
          padding: const EdgeInsets.fromLTRB(16, 10, 10, 0),
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF1F264A),
                  Color(0xFF8D4AAC),
                ]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                child: const Text(
                  "North America",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Max",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                  Text(
                    "24°",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "Min",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                  Text(
                    "15°",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "7-Days Forecasts",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 110,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: weeklyCard(items[index].degree,
                              items[index].perci, items[index].image));
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              airQualityCard(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [sunrisesetcard(), uvCard()],
              )
            ],
          ),
        ));
  }

  Widget weeklyCard(String name, String day, String image) {
    return Container(
      width: 40,
      height: 100,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1F264A), Color(0xFF8D4AAC)]),
        borderRadius: BorderRadius.circular(15), // Rounded corners

        boxShadow: const [
          BoxShadow(
            color: Colors.black12, // Optional shadow for the card
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
          Image.asset("assets/weather_small_icon.png"),
          Text(
            day,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget airQualityCard() {
    return Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF1F264A), Color(0xFF8D4AAC)]),
          borderRadius: BorderRadius.circular(15), // Rounded corners

          boxShadow: const [
            BoxShadow(
              color: Colors.black12, // Optional shadow for the card
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/icon_crosshairs.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Air Quality",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 20),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "2 - Low Health Risk",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                height: 1,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "See more",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 24),
                  ),
                  Image.asset("assets/icon_left.png")
                ],
              )
            ],
          ),
        ));
  }

  Widget sunrisesetcard() {
    return Container(
        width: 170,
        height: 170,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF1F264A), Color(0xFF8D4AAC)]),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.white, // Set the color of the border
            width: 1.0, // Set the width of the border
          ), // Rounded corners
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12, // Optional shadow for the card
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/icon_start.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Sunrise",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "5:20 AM",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 24),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Sunset",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "6:30 pm",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget uvCard() {
    return Container(
        width: 170,
        height: 170,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF1F264A), Color(0xFF8D4AAC)]),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.white, // Set the color of the border
            width: 1.0, // Set the width of the border
          ), // Rounded corners
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12, // Optional shadow for the card
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/icon_start.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "UV INDEX",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "4",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 24),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Moderate",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 24),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
