import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:weathery/model_class/weather_class.dart';
import 'package:weathery/utilities/constants.dart';
class ApiService{
  Future<Weather> getWeather(String lon,String lat)async{
 final response=await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=${Conatants.apiKey}&units=metric'));
 if(response.statusCode==200){
   var decodeData=jsonDecode(response.body);
   //print(decodeData);
   //print(decodeData["weather"][0]);
    Weather data= Weather.fromJson(decodeData["weather"][0]);
  // print(data.main);
   return data;
 }
 else{throw 'error';}
}
  Future getAll(String lon,String lat)async{
    final response=await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=${Conatants.apiKey}&units=metric'));
    if(response.statusCode==200){
      var decodeData=jsonDecode(response.body);
      print(decodeData);
      print(decodeData["main"]);
      return decodeData;
    }
    else{throw 'error';}
  }
}