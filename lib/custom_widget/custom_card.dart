import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
   CustomCard({
    this.text,this.heading,

    Key? key}) : super(key: key);
  String? text;
   String? heading;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white.withOpacity(.4),
    child:Center(child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
    children: [
    Text(heading??'no title'),
    SizedBox(height: 3.h,),
    Text(text??'No data')]))));
  }
}
