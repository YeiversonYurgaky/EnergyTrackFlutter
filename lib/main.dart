import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'welcome_screen.dart'; // Si tienes una pantalla de bienvenida

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
      home:
          WelcomeScreen(), // O WelcomeScreen si tienes la pantalla de bienvenida
    );
  }
}
