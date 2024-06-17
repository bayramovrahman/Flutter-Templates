import 'package:flutter/material.dart';

class SendFeedbackPage extends StatefulWidget {
  const SendFeedbackPage({super.key});

  @override
  State<SendFeedbackPage> createState() => _SendFeedbackPageState();
}

class _SendFeedbackPageState extends State<SendFeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Send Feedback", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Send Feedback Page", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
      ),
    );
  }
}