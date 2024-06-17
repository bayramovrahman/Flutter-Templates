import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Contacts", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Contacts Page", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
      ),
    );
  }
}