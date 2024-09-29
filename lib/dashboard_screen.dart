// dashboard_screen.dart
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final String classroomName;

  DashboardScreen({required this.classroomName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$classroomName Dashboard'),
      ),
      body: Center(
        child: Text(
          'Aquí se mostrará el dashboard de Power BI para $classroomName',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
