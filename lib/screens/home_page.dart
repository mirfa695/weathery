import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weathery/custom_widget/custom_card.dart';
import 'package:weathery/provider/home_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().GetPosition(context);
    context.read<HomeProvider>().getData(context);
    context.read<HomeProvider>().getAll(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
               'Unknown place',
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              '',
              style: TextStyle(fontSize: 15.sp),
            )
          ],
        ),
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.black,
          )
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (BuildContext context, HomeProvider value, Widget? child) {
          value.GetPosition(context);
          value.getAll(context);
          value.getData(context);
          return Container(
              width: double.infinity,
              height: 730.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: value.weatherData!.main != null
                          ? value.weatherData!.main == 'Clouds'
                              ? const AssetImage('assets/images/cloudy.jpg')
                              : value.weatherData!.main == 'rainy'
                                  ? const AssetImage('assets/images/monsoon.jpg'):value.weatherData!.main == 'Clear'?
                                    const AssetImage('assets/images/clear.jpg')
                                  : const AssetImage('assets/images/default.jpg')
                          : const AssetImage('assets/images/default.jpg'),
                      fit: BoxFit.fill)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200.h,
                  ),
                  Text(
                    '${value.allData["main"]["temp"]}°C',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp),
                  ),
                  value.weatherData != null
                      ? Text(
                          value.weatherData!.main ?? 'No data',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28.sp),
                        )
                      : const CircularProgressIndicator(),
                  Text(
                    value.weatherData!.description ?? 'No description',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 100.h,
                    child:
                        ListView(scrollDirection: Axis.horizontal, children: [
                      CustomCard(
                        heading: 'Temp: ',
                        text: '${value.allData["main"]["temp"]}°C',
                      ),
                      CustomCard(
                        heading: 'Feels like: ',
                        text: '${value.allData["main"]["feels_like"]}°C',
                      ),
                      CustomCard(
                        heading: 'Min temp',
                        text:
                            '${value.allData["main"]["temp_min"]}°C',
                      ),
                      CustomCard(
                        heading: 'Max temp',
                        text:
                            '${value.allData["main"]["temp_max"]}°C',
                      ),
                      CustomCard(
                        heading: 'Pressure',
                        text: value.allData["main"]["pressure"].toString(),
                      ),
                      CustomCard(
                        heading: 'Humidity',
                        text: value.allData["main"]["humidity"].toString(),
                      ),
                      CustomCard(
                        heading: 'Sea level',
                        text: value.allData["main"]["sea_level"].toString(),
                      ),
                      CustomCard(
                        heading: 'Ground level',
                        text: value.allData["main"]["grnd_level"].toString(),
                      )
                    ]),
                  )
                ],
              ));
        },
      ),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Text(context.read<HomeProvider>().currentPosition.toString()),
      //     ElevatedButton(onPressed: () async {
      //       await context.read<HomeProvider>().GetPosition(context);
      //
      //
      //     }, child: Text('get')),
      //   ],
      // ),
    );
  }
}
