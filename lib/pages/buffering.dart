import 'package:flutter/material.dart';
import 'package:newworldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata', isDaytime: true);
    await instance.getTime(); // Wait for the data to be fetched
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'url': instance.url,
      'isDaytime': instance.isDaytime,
    }
    );
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
            child:SpinKitRotatingCircle(
              color: Colors.white,
              size: 50.0,
            )

        )
    );

  }
}