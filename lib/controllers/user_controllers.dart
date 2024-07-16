import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserController {
  static User? user = FirebaseAuth.instance.currentUser;

  static Future<User?> loginWithGoogle() async {
    final googleAccount = await GoogleSignIn().signIn();
    final googleAuth = await googleAccount?.authentication;

    // Sign in with firebase auth
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    user = userCredential.user; // Update the user object
    return user;
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    user = null;
  }
}

// Buat production biar kalau firebase error tetap bisa masuk
// class UserController {
//   static User? user = FirebaseAuth.instance.currentUser;

//   static Future<String?> loginWithGoogle() async {
//   try {
//       final googleAccount = await GoogleSignIn().signIn();
//       final googleAuth = await googleAccount?.authentication;

//       if (googleAuth == null) {
//         throw FirebaseAuthException(
//           code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
//           message: 'Google authentication token is missing',
//         );
//       }

//       // Sign in with firebase auth
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
//       user = userCredential.user; // Update the user object
//       return null; // No error
//     } catch (e) {
//       print('Error during Google sign-in: $e');
//       return e.toString(); // Return error message
//     }
//   }
