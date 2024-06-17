import 'package:flutter/material.dart';
import 'package:simple_register_template/forgot_password.dart';
import 'package:simple_register_template/login.dart';
import 'package:simple_register_template/register.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/login': (context) => const MyLoginPage(),
      '/register': (context) => const MyRegisterPage(),
      '/forgotPassword': (context) => const MyForgotPassword(),
    },
  ));
}
