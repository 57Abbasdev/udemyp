import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:udemyp/climaApp/screens/location_screen.dart';
import 'package:udemyp/climaApp/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:udemyp/climaApp/services/networking.dart';

import '../services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? lon, lat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitSpinningLines(
        color: Colors.amber,
      )),
    );
  }

  @override
  void initState() {
    super.initState();
    print("InitState");
    getLocationData();

  }

  ///app location and call api to fetch json
  getLocationData() async {
    AppLocation location = AppLocation();
    await location.getLocation();
    //37.4219744, -122.0839993

    var url =
        "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$key&units=metric";

    NetworkHelper helper = NetworkHelper(url);

    var weatherJsonData = await helper.getJsonData();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(
                  weatherJson: weatherJsonData,
                )));
  }
}
/*

  if (response.statusCode == 200) {
      //i think it is not an html content
      //but it is webpage content
      //print(response.body);

      var jsonData =jsonDecode(response.body);




    } else {
      print('Error occured' + response.statusCode.toString());
    }
 */
/*

 */
