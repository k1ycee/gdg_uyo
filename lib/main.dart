import 'package:flutter/material.dart';
import 'package:gdg_uyo/views/create_trip.dart';
import 'package:gdg_uyo/views/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) => DashBoard(),
        '/createTrip': (context) => CreateTrip()
      },
    );
  }
}

