import 'package:flutter/material.dart';
import 'package:weathery/routes/route_name.dart';
import 'package:weathery/screens/default_page.dart';
import 'package:weathery/screens/home_page.dart';

class RouteNavigation{
  static Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteName.homeRoute:return MaterialPageRoute(builder: (context)=>HomePage());
      default:return MaterialPageRoute(builder: (context)=>DefaultPage());
    }
  }
}