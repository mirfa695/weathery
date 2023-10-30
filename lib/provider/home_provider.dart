import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weathery/model_class/weather_class.dart';
import 'package:weathery/services/api_services.dart';

import '../services/location_service.dart';

class HomeProvider extends ChangeNotifier {
  Position? currentPosition;
  Weather? weatherData;
  dynamic? allData;
  Future GetPosition(BuildContext context) async {
    final hasPermission = await handleLocationPermission(context);
    Position postion = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = position;
      print(currentPosition);
      notifyListeners();
      return currentPosition;
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future getData(BuildContext context) async {
    try {
      await GetPosition(context);
      print(currentPosition?.latitude);
      weatherData = (await ApiService().getWeather(
          currentPosition?.latitude.toString()??'20.5937',
          currentPosition?.longitude.toString()??'78.9629'));
      notifyListeners();
    } catch (e) {
      print(e);
    }
    //print(weatherData!.main);
  }

  Future getAll(BuildContext context) async {
    try {
      await GetPosition(context);
      allData = await ApiService().getAll(currentPosition?.latitude.toString()??"20.5937",
          currentPosition?.longitude.toString()??'78.9629');
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
