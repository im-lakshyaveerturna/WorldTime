import 'package:flutter/material.dart';
import 'package:newworldtime/pages/home.dart';
import 'package:newworldtime/pages/location_selection.dart';
import 'package:newworldtime/pages/buffering.dart';

void main() {
  runApp(MaterialApp(

      initialRoute: '/',
      routes: {

        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => Location(),
      }
  )
  );
}

