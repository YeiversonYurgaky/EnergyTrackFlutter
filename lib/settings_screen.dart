// settings_screen.dart
import 'package:flutter/material.dart';

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
