import 'package:firebase_auth/firebase_auth.dart';
import 'package:register_with_firebase_authentication/global/common/toast_message.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String userEmail, String userPassword) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        errorShowToast(message: "The mail address is already in use.");
      } else if (e.code == 'invalid-email') {
        errorShowToast(message: "Invalid e-mail address!");
      } else {
        errorShowToast(message: "An error occured ${e.code}");
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String userEmail, String userPassword) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' ||
          e.code == 'wrong-password' ||
          e.code == 'invalid-credential') {
        errorShowToast(message: "Invalid e-mail or password");
      } else if (e.code == 'invalid-email') {
        errorShowToast(message: "Invalid e-mail address!");
      } else {
        errorShowToast(message: "An error occured ${e.code}");
      }
    }
    return null;
  }
}
