import 'package:flutter/material.dart';

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

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lightbulb_outline, color: Colors.yellowAccent),
            SizedBox(width: 10),
            Text(
              'EnergyTrack',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue.shade800,
        unselectedItemColor: Colors.blue.shade400,
        onTap: _onItemTapped,
      ),
    );
  }
}

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
            shrinkWrap: true, // Hace que el GridView se ajuste a su contenido
            physics: NeverScrollableScrollPhysics(), // Desactiva el scroll del GridView
            children: List.generate(classroomNames.length, (index) {
              return ClassroomCard(classroomName: classroomNames[index]);
            }),
          ),
        ],
      ),
    );
  }
}

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

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        children: <Widget>[
          buildSectionTitle(context, 'Perfil'),
          buildSettingsTile(context, Icons.person, 'Ver perfil', () {}),
          buildDivider(),
          buildSectionTitle(context, 'Seguridad'),
          buildSettingsTile(context, Icons.lock, 'Ajustes de seguridad', () {}),
          buildDivider(),
          buildSectionTitle(context, 'Notificaciones'),
          buildSettingsTile(context, Icons.notifications, 'Preferencias de notificaciones', () {}),
          buildDivider(),
          buildSectionTitle(context, 'Ayuda'),
          buildSettingsTile(context, Icons.help, 'Centro de ayuda', () {}),
        ],
      ),
    );
  }

  Widget buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade700,
        ),
      ),
    );
  }

  Widget buildSettingsTile(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue.shade700),
      title: Text(title),
      onTap: onTap,
    );
  }

  Widget buildDivider() {
    return Divider(
      thickness: 1,
      color: Colors.grey.shade300,
    );
  }
}
