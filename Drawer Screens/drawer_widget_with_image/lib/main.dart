import 'package:flutter/material.dart';
import 'package:drawer_widget_with_image/pages/contacts_page.dart';
import 'package:drawer_widget_with_image/pages/dashboard_page.dart';
import 'package:drawer_widget_with_image/pages/events_page.dart';
import 'package:drawer_widget_with_image/pages/home_page.dart';
import 'package:drawer_widget_with_image/pages/notes_page.dart';
import 'package:drawer_widget_with_image/pages/notifications_page.dart';
import 'package:drawer_widget_with_image/pages/privacy_policy_page.dart';
import 'package:drawer_widget_with_image/pages/send_feedback_page.dart';
import 'package:drawer_widget_with_image/pages/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/dashboard': (context) => const DashboardPage(),
        '/contacts': (context) => const ContactsPage(),
        '/events': (context) => const EventsPage(),
        '/notes': (context) => const NotesPage(),
        '/settings': (context) => const SettingsPage(),
        '/notifications': (context) => const NotificationsPage(),
        '/privacy_policy': (context) => const PrivacyPolicyPage(),
        '/send_feedback': (context) => const SendFeedbackPage(),
      },
      home: const HomePage(),
    );
  }
}
