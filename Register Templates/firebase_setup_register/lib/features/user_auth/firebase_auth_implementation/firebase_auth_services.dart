import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_setup_register/global/common/toast.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String userEmail, String userPassword) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        errorShowToast(message: "The mail address is already in use.");
      } else {
        errorShowToast(message: "An error occured ${e.code}");
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String userEmail, String userPassword) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        errorShowToast(message: "Invalid e-mail or password");
      } else {
        errorShowToast(message: "An error occured ${e.code}");
      }
    }
    return null;
  }
}
