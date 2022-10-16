import 'package:geolocator/geolocator.dart';

class AppLocation {
  var longitude, latitude;

  Future<void> getLocation() async {
    try {
      // dialog to get access to the location permission
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      print(permission);

      ///get location if allow
      /// await means first complete the task then assign the value to variable
      Position location = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      //user app lon and lat
      longitude = location.longitude;
      latitude = location.latitude;

      print(location);



    } catch (exception) {
      print(exception);
    }
  }
}


