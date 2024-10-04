import 'package:flutter/material.dart';
import 'package:know_my_weather/detail_weather.dart';
import 'package:know_my_weather/item.dart';

class TempScreen extends StatefulWidget {
  const TempScreen({super.key});

  @override
  State<TempScreen> createState() => _TempScreenState();
}

class _TempScreenState extends State<TempScreen> {
  final List<Item> items = [
    Item('20°c', '15.0', "assets/weather_small_icon.png"),
    Item('22°c', '55.0', "assets/weather_small_icon.png"),
    Item('7°c', '60', "assets/weather_small_icon.png"),
    Item('17°c', '67', "assets/weather_small_icon.png"),
  ];

  int _selectedIndex = 0;

  // Function to handle tap on BottomNavigationBar items
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate or perform other actions based on the selected index
    // For example:
    switch (index) {
      case 0:
        print("Home tapped");
        break;
      case 1:
        print("Search tapped");
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailWeather()),
        );
        break;
    }
  }

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
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          )),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF1F264A), Color(0xFF8D4AAC)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Image.asset(
                "assets/weather_icon.png",
                height: 250,
                width: 250,
              ),
            ),
            const Text(
              "19°c",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Text(
              "Precipitation",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Max:",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                Text(
                  "30°",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Min:",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                Text(
                  "10°",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset("assets/house.png"),
            Expanded(child: cardView())
          ],
        ),
      ),
    );
  }

  Widget cardView() {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF1F264A), Color(0xFF8D4AAC)]),
          borderRadius: BorderRadius.circular(10), // Rounded corners

          boxShadow: const [
            BoxShadow(
              color: Colors.black12, // Optional shadow for the card
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16), // Padding inside the card
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(13, 0, 0, 0),
                    child: const Text(
                      "Today",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: const Text(
                      "July, 20",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  )
                ]),
            const Divider(
              color: Colors.white, // Color of the line
              thickness: .5, // Thickness of the line
            ),
            SizedBox(
              height: 18,
            ),
            listWeather()
          ],
        ));
  }

  Widget listWeather() {
    return Container(
      width: double.infinity,
      height: 120,
      color: Colors.transparent,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 48, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    items[index].degree,
                    style: const TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        color: Colors.white),
                  ),
                  Image.asset(
                    items[index].image,
                    height: 45,
                    width: 45,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    items[index].perci,
                    style: const TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        color: Colors.white),
                  )
                ],
              ),
            );
          }),
    );
  }
}
