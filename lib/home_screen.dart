import 'package:flutter/material.dart';
import 'package:namer_app/classroom_card.dart';
// Asegúrate de importar el DashboardScreen

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

    // Mapa de URLs de Power BI para cada aula
    final Map<String, String> powerBiUrls = {
      '402':
          'https://app.powerbi.com/view?r=eyJrIjoiMjQwYWI1MmEtNTQ1OS00ODJkLThkYWItNWIyOTA1ZTVjNWEwIiwidCI6IjRkZDEzM2ZkLWNhMmEtNDA5OC1hZTkxLTBlYWEwYzU4MjNiOCIsImMiOjR9',
      '403':
          'https://app.powerbi.com/view?r=eyJrIjoiMGZiODYxY2YtYzI2Ny00ZThhLWJjNjctMjlhZWYxNDJiZmRmIiwidCI6IjRkZDEzM2ZkLWNhMmEtNDA5OC1hZTkxLTBlYWEwYzU4MjNiOCIsImMiOjR9',
      '404':
          'https://app.powerbi.com/view?r=eyJrIjoiNzFiOTFjYmMtZmVlYy00NTc5LTkxNTEtZDYyMDM2NmZjMjA2IiwidCI6IjRkZDEzM2ZkLWNhMmEtNDA5OC1hZTkxLTBlYWEwYzU4MjNiOCIsImMiOjR9',
      '405':
          'https://app.powerbi.com/view?r=eyJrIjoiOTY5M2M4NTUtODUwNS00YzA0LWJjMjAtOWUyYWM4MWM4M2ZlIiwidCI6IjRkZDEzM2ZkLWNhMmEtNDA5OC1hZTkxLTBlYWEwYzU4MjNiOCIsImMiOjR9',
      'LDS':
          'https://app.powerbi.com/view?r=eyJrIjoiMjk1NzZmODktMzNhNC00NzljLTliZTEtNjJmNDU5NGQ2NWI4IiwidCI6IjRkZDEzM2ZkLWNhMmEtNDA5OC1hZTkxLTBlYWEwYzU4MjNiOCIsImMiOjR9',
      'LDF':
          'https://app.powerbi.com/view?r=eyJrIjoiMDUyNWQ5YTEtMGMwZi00YzViLTkxOTgtZTAwODc1NTAzODQwIiwidCI6IjRkZDEzM2ZkLWNhMmEtNDA5OC1hZTkxLTBlYWEwYzU4MjNiOCIsImMiOjR9',
      'LADSIF':
          'https://app.powerbi.com/view?r=eyJrIjoiMTgzYWQyZjItMjBkYi00ZmM1LTkyMGYtYmI5N2QzNjAzOGEwIiwidCI6IjRkZDEzM2ZkLWNhMmEtNDA5OC1hZTkxLTBlYWEwYzU4MjNiOCIsImMiOjR9',
      'Pasillo':
          'https://app.powerbi.com/view?r=eyJrIjoiZTdiZjkzNGQtZWQ0OC00N2ExLWJhMmItMzFkNzZmMjc3ZWJjIiwidCI6IjRkZDEzM2ZkLWNhMmEtNDA5OC1hZTkxLTBlYWEwYzU4MjNiOCIsImMiOjR9',
    };

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
              return ClassroomCard(
                classroomName: classroomNames[index],
                powerBiUrl: powerBiUrls[classroomNames[index]] ??
                    '', // Pasamos la URL correcta
              );
            }),
          ),
        ],
      ),
    );
  }
}
