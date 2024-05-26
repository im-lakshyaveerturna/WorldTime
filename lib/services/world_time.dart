import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // Location name for UI
  String time = ""; // Cureent time in the selected location
  String flag; // URL to an asset flag icon
  String url; // location URL for api endpoint
  bool isDaytime; //True for daytime, False for nighttime

  WorldTime({ required this.location, required this.flag, required this.url, required this.isDaytime });

  Future<void> getTime() async {

    try {
      // make the request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // get properties from json
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));


      // set the time property
      time = DateFormat.jm().format(now);
      isDaytime = now.hour > 6 && now.hour < 20 ? true:false;


    }

    catch (e) {

      print('ERROR:$e');

    }
  }

}
