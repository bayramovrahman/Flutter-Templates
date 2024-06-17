import 'package:email_validator/email_validator.dart';
import 'package:register_with_firebase_authentication/user_auth/services/firebase_auth_service.dart';
import 'package:register_with_firebase_authentication/user_auth/services/google_mail_auth_service.dart';
import 'package:register_with_firebase_authentication/widgets/my_text_fiel.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthServices _firebaseAuthServices = FirebaseAuthServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  SizedBox(
                    height: 180,
                    width: 180,
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.grey[200],
                      backgroundImage: const AssetImage(
                        'assets/images/person.png',
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Welcome back, You have been missed!',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    controller: _emailController,
                    inputType: TextInputType.emailAddress,
                    hintText: "E-mail",
                    isPasswordField: false,
                    prefixIcon: const Icon(Icons.email),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your e-mail address!";
                      } else if (!EmailValidator.validate(value)) {
                        return 'Invalid e-mail';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: _passwordController,
                    hintText: "Password",
                    isPasswordField: true,
                    prefixIcon: const Icon(Icons.lock),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password!";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/forgotPassword');
                        },
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: _signIn,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(13.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "or continue with",
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => GoogleMailAuthService().signInWithGoogle(),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.grey[200],
                          ),
                          child: Image.asset(
                            'assets/images/google.png',
                            height: 40,
                          ),
                        ),
                      ),
                      const SizedBox(width: 25.0),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.grey[200],
                        ),
                        child: Image.asset(
                          'assets/images/apple.png',
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: const Text(
                          "Register now",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    String userEmail = _emailController.text;
    String userPassword = _passwordController.text;
    await _firebaseAuthServices.signInWithEmailAndPassword(
      userEmail,
      userPassword,
    );

    if (mounted) {
      Navigator.pop(context);
    }
  }
}
