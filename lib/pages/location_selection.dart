import 'package:flutter/material.dart';
import 'package:newworldtime/services/world_time.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List<WorldTime> locations = [
    WorldTime(url: 'Asia/kolkata', location: 'Kolakata' , flag: 'india.png', isDaytime: true),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png', isDaytime: true),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png', isDaytime: true),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png', isDaytime: true),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png', isDaytime: true),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png', isDaytime: true),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png', isDaytime: true),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png', isDaytime: true),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png', isDaytime: true),
  ];

  void updateTime(index)async{

    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {

      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'url': instance.url,
      'isDaytime': instance.isDaytime,

    }
    );
  }

  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(

          backgroundColor: Colors.blue[900] ,
          title: Text('Select The Location',
            style: TextStyle(
              color: Colors.white,
            ),
          ),

          centerTitle: true,
          elevation: 0,

        ),

        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index ) {

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                child: Card(
                  child:ListTile(
                    onTap: () {
                      updateTime(index);
                    },
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('images/${locations[index].flag}'),
                    ),

                  ),

                ),
              );

            }
        )
    );
  }
}
