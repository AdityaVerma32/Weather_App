import 'dart:math';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Map info = ModalRoute.of(context)!.settings.arguments as Map;

    List city_names = [
      "Delhi",
      "London",
      "Ukrain",
      "Uttar Pradesh",
      "Mumbai",
      "Kolkata"
    ];

    var _random = new Random();

    var city = city_names[_random.nextInt(city_names.length)];

    return Scaffold(
      // appBar: PreferredSize(
      //     preferredSize: Size.fromHeight(0),
      //     child: AppBar(
      //       backgroundColor: Colors.red,
      //     )),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.blue,
          Color.fromARGB(255, 154, 214, 241),
        ], stops: [
          0.1,
          0.9,
        ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        child: Column(
          children: <Widget>[
            search_container(city),
            first_container(),
            temperature_row(),
            two_containers(),
            sized_Box(15.0, 0.0),
            const Text(
              "Made By Aditya Verma",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            sized_Box(10.0, 0.0),
            const Text(
              "Data Taken From OpenWeather",
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      )),
    );
  }
}

Container search_container(var city) {
  return Container(
    //search Container
    padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    decoration: BoxDecoration(
        color: Colors.black38, borderRadius: BorderRadius.circular(30)),
    child: Row(
      children: [
        sized_Box(0.0, 10.0),
        GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        sized_Box(0.0, 10.0),
        Expanded(
            child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search $city ...",
              hintStyle: const TextStyle(color: Colors.white)),
        ))
      ],
    ),
  );
}

Row first_container() {
  return Row(
    children: [
      Expanded(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.symmetric(horizontal: 15),
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                const Icon(
                  Icons.home_max_outlined,
                  size: 40,
                ),
                sized_Box(0.0, 20.0),
                Column(
                  //First block
                  children: const [
                    Text(
                      "Scattered Clouds",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text("In Deoband")
                  ],
                )
              ],
            )),
      ),
    ],
  );
}

Row temperature_row() {
  return Row(
    children: [
      Expanded(
        child: Container(
          //second column
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                WeatherIcons.thermometer,
                size: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "32",
                    style: TextStyle(fontSize: 90),
                  ),
                  Text(
                    "°C",
                    style: TextStyle(fontSize: 40),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ],
  );
}

Row two_containers() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Expanded(
        child: Container(
          //Third Container
          height: 200,
          margin: EdgeInsets.fromLTRB(15, 0, 5, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withOpacity(0.5)),
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Row(
              children: [
                Icon(
                  WeatherIcons.day_cloudy_windy,
                  size: 25,
                ),
              ],
            ),
            sized_Box(20.0, 0.0),
            Text(
              "20.9",
              style: TextStyle(fontSize: 40),
            ),
            Text("Km/h"),
          ]),
        ),
      ),
      Expanded(
        child: Container(
          height: 200,
          margin: EdgeInsets.fromLTRB(5, 0, 15, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withOpacity(0.5)),
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Row(
              children: [
                Icon(
                  WeatherIcons.humidity,
                  size: 25,
                ),
              ],
            ),
            sized_Box(20.0, 0.0),
            Text(
              "66",
              style: TextStyle(fontSize: 40),
            ),
            Text("Percent"),
          ]),
        ),
      )
    ],
  );
}

SizedBox sized_Box(var h, var w) {
  return SizedBox(height: h, width: w);
}
