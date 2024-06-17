import 'package:email_validator/email_validator.dart';
import 'package:register_with_firebase_authentication/global/common/toast_message.dart';
import 'package:register_with_firebase_authentication/user_auth/services/firebase_auth_service.dart';
import 'package:register_with_firebase_authentication/widgets/my_text_fiel.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuthServices _firebaseAuthServices = FirebaseAuthServices();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

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
                    height: 130,
                    width: 130,
                    child: CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.grey[200],
                        backgroundImage:
                            const AssetImage('assets/images/person.png')),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Sign up, discover innovations now!',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    controller: _usernameController,
                    hintText: "Username",
                    isPasswordField: false,
                    prefixIcon: const Icon(Icons.person),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your username!";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 10),
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
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters!';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: _confirmPassword,
                    hintText: "Confirm Password",
                    isPasswordField: true,
                    prefixIcon: const Icon(Icons.lock_reset),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please confirm your password!";
                      } else if (value.length < 6) {
                        return 'Please confirm your password!';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: _signUpUser,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(13.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
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
                      Container(
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
                    children: [
                      Text(
                        "Already have a membership?",
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/login',
                            (route) => false,
                          );
                        },
                        child: const Text(
                          "Sign in",
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

  void _signUpUser() async {
    // String username = _usernameController.text;
    String userEmail = _emailController.text;
    String userPassword = _passwordController.text;
    String confirmPassword = _confirmPassword.text;

    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.grey,
          ),
        );
      },
    );

    if (userPassword == confirmPassword) {
      await _firebaseAuthServices.signUpWithEmailAndPassword(
        userEmail,
        userPassword,
      );
      if (mounted) {
        Navigator.pop(context);
      }
    } else {
      errorShowToast(message: "Password don't match");
    }
    if (mounted) {
      Navigator.pop(context);
    }
  }
}
