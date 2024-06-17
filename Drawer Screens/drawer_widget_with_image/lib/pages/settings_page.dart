import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Settings", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Settings Page", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
      ),
    );
  }
}