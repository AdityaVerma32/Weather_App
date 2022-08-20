import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/pages/helping/worker.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? temp;
  String? humidity;
  String? air_speed;
  String? desc;
  String? main_desc;

  void start() async {
    worker instance = worker(location: "Deoband");
    await instance.getData();

    temp = instance.temp;
    humidity = instance.humidity;
    air_speed = instance.air_speed;
    desc = instance.Desc;
    main_desc = instance.main_desc;

    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "temp_value": temp,
      "hum_value": humidity,
      "air_value": air_speed,
      "desc_value": desc,
      "main_value": main_desc
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.blue,
        Colors.white,
        Colors.orange,
        Colors.redAccent
      ], stops: [
        0.1,
        0.6,
        0.8,
        0.9
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Center(
        child: Column(children: <Widget>[
          SizedBox(
            height: 200,
          ),
          Image.asset(
            "assets/images/clipart1294094.png",
            height: 200,
            width: 200,
          ),
          SizedBox(
            height: 20,
          ),
          const Text(
            "Weather App",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          const SpinKitThreeInOut(
            color: Colors.blue,
            size: 50.0,
          ),
        ]),
      ),
    ));
  }
}
