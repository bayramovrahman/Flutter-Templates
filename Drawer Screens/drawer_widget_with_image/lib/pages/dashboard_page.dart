import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Dashboard", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Dashboard Page", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
      ),
    );
  }
}