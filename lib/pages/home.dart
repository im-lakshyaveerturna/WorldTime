import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map<dynamic, dynamic> data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data: ModalRoute.of(context)!.settings.arguments as Map;
    String bgimage = data['isDaytime'] ? 'morning1.jpeg':'night1.jpeg';
    Color bgColor = data['isDaytime'] ? Colors.blue:Colors.purple;

    return Scaffold(
      backgroundColor: bgColor,
      body:SafeArea(child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/$bgimage'),
              fit: BoxFit.cover,

            )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,120,0,0),
          child: Column(

              children: [

                ElevatedButton.icon(onPressed: () async{

                  dynamic result = await Navigator.pushNamed(context, '/location');
                  if (result != null) {
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag'] // Fixed typo: 'fllag' to 'flag'
                      };
                    }
                    );
                  }
                },
                    icon: Icon(Icons.edit_location,
                        color: Colors.grey),
                    label: Text('Edit Location',
                        style: TextStyle(
                          color: Colors.grey,
                        ))
                ),

                SizedBox(height:20,),
                Row( mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                        data['location'],
                        style: TextStyle(
                            fontSize:28,
                            color: Colors.white
                        )
                    )

                  ],
                ),
                SizedBox(height: 30),
                Text(data['time'],
                    style: TextStyle(
                        fontSize: 66,
                        color: Colors.white
                    )
                ),
              ]

          ),
        ),
      )
      ),
    );
  }
}
