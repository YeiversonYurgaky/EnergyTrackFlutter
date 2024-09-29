// classroom_card.dart
import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class ClassroomCard extends StatelessWidget {
  final String classroomName;

  ClassroomCard({required this.classroomName});

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    if (classroomName == 'Pasillo') {
      iconData = Icons.wb_incandescent;
    } else {
      iconData = Icons.school;
    }

    return Card(
      color: Colors.blue.shade200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DashboardScreen(classroomName: classroomName),
            ),
          );
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  size: 50,
                  color: Colors.blue.shade900,
                ),
                SizedBox(height: 10),
                Text(
                  classroomName,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
