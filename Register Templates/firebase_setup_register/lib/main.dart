import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_setup_register/features/app/splash_screen/splash_screen.dart';
import 'package:firebase_setup_register/features/user_auth/presentation/pages/home_page.dart';
import 'package:firebase_setup_register/features/user_auth/presentation/pages/login_page.dart';
import 'package:firebase_setup_register/features/user_auth/presentation/pages/register_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /*
    kIsWeb ifadesi, Flutter'ın web platformunda çalışıp çalışmadığını kontrol eden bir sabittir. 
    Eğer uygulama web platformunda çalışıyorsa, yani kIsWeb true ise, Firebase'in web için başlatılması gerekir.
  */
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBcJCR8iw3NT-uEJe1IWY7lbV7JelCVoPU",
        appId: "1:482390597330:web:827971cb948d90b9e8570b",
        messagingSenderId: "482390597330",
        projectId: "fir-setup-register-ddfd2",
      ),
    );
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      routes: {
        '/': (context) => const SplashScreen(child: LoginPage()),
        '/home':(context) => const HomePage(),
        '/register':(context) => const RegisterPage(),
        '/login':(context) => const LoginPage(),
      },
    );
  }
}
