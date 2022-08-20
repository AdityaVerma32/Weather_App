import 'dart:convert';

import 'package:http/http.dart' as http;

class worker {
  worker({this.location}) {
    location = this.location;
  }

  String? location;
  String? temp;
  String? humidity;
  String? air_speed;
  String? Desc;
  String? main_desc;

  //METHOD= ALL THE DETAILS
  Future<void> getData() async {
    // get Data
    try {
      var endpoint = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=a8245945a87d81768e5c1d4898abf750&units=metric");
      var response = await http.get(endpoint);
      Map data = jsonDecode(response.body);

      //getting temp,humidity
      Map temp_data = data["main"];
      double gettemp = temp_data["temp"];
      double gethumidity = temp_data["humidity"];

      //getting description
      List weather_data = data["weather"];
      Map weather_main_data = weather_data[0];
      String getDesc = weather_main_data["description"];
      String getmain_desc = weather_main_data["main"];

      //getting wind information
      Map wind_info = data["wind"];
      double getair_speed = wind_info["speed"];

      //assigning values
      temp = gettemp.toString();
      humidity = gethumidity.toString();
      Desc = getDesc;
      main_desc = getmain_desc;
      air_speed = getair_speed.toString();
    } catch (e) {
      temp = "Error Occured";
      humidity = "Error Occured";
      Desc = "Error Occured";
      main_desc = "Error Occured";
      air_speed = "Error Occured";
    }
  }
}

worker instance = worker(location: "deoband");
