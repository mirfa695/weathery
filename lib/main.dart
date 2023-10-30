import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weathery/provider/home_provider.dart';
import 'package:weathery/routes/route_name.dart';
import 'package:weathery/routes/route_navigation.dart';

void main(){
  runApp(
    ChangeNotifierProvider(create: (context)=>HomeProvider(), child:Main()));
}
class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(debugShowCheckedModeBanner: false,
        theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.transparent)),
       initialRoute: RouteName.homeRoute,
        onGenerateRoute: RouteNavigation.generateRoute,
      ),
    );
  }
}
