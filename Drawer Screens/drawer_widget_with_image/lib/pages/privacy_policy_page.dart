import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Privacy Policy", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Privacy Policy Page", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
      ),
    );
  }
}