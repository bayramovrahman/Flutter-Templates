import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:register_with_firebase_authentication/pages/auth_page.dart';
import 'package:register_with_firebase_authentication/pages/forgot_password.dart';
import 'package:register_with_firebase_authentication/pages/home_page.dart';
import 'package:register_with_firebase_authentication/pages/login.dart';
import 'package:register_with_firebase_authentication/pages/register.dart';

void main() async {
  // Flutter uygulamasının widget bağlamını başlatır.
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase servisini başlatmak için Firebase.initializeApp() fonksiyonu çağrılır.
  // Bu fonksiyon asenkron çalıştığı için 'await' anahtar kelimesi ile beklenir.
  // Firebase.initializeApp(), Firebase özelliklerini kullanılabilir hale getirir.
  // options parametresi, Firebase konfigürasyon seçeneklerini içerir.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Uygulamayı başlatan runApp fonksiyonu. MyApp, uygulamanın ana widget'ını temsil eder.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Map<String, WidgetBuilder> routes = {
    '/home': (context) => const HomePage(),
    '/login': (context) => const LoginPage(),
    '/register': (context) => const RegisterPage(),
    '/forgotPassword': (context) => ForgotPasswordPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        final builder = routes[settings.name!];
        return CupertinoPageRoute(builder: builder!);
      },
      home: const AuthPage(),
    );
  }
}
