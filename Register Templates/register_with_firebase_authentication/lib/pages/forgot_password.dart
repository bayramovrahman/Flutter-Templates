import 'package:email_validator/email_validator.dart';
import 'package:register_with_firebase_authentication/widgets/my_text_fiel.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  ForgotPasswordPage({super.key});

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
                  const SizedBox(height: 150),
                  SizedBox(
                    height: 180,
                    width: 180,
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.grey[200],
                      backgroundImage:
                          const AssetImage('assets/images/mail.png'),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Don't worry, you can easily update your password!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 18,
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
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(13.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          "Send",
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Back to",
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
}
