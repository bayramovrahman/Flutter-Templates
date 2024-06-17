import 'package:firebase_auth/firebase_auth.dart';
import 'package:register_with_firebase_authentication/pages/home_page.dart';
import 'package:register_with_firebase_authentication/pages/login.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // User is logged in
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            // User is NOT logged in
            return const LoginPage();
          }
        },
      ),
    );
  }
}
