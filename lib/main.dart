// main.dart
import 'package:flutter/material.dart';
import 'main_screen.dart';

void main() {
  runApp(EnergyTrackApp());
}

class EnergyTrackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EnergyTrack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
        ),
      ),
      home: MainScreen(),
    );
  }
}
