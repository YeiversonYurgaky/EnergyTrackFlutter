// home_screen.dart
import 'package:flutter/material.dart';
import 'classroom_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final classroomNames = [
      '402',
      '403',
      '404',
      '405',
      'LDS',
      'LDF',
      'LADSIF',
      'Pasillo'
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Visualiza los consumos de las iluminarias a tiempo real:',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(16.0),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(classroomNames.length, (index) {
              return ClassroomCard(classroomName: classroomNames[index]);
            }),
          ),
        ],
      ),
    );
  }
}
