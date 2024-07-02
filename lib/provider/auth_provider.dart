import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rydeme/screens/home_screen.dart';
import 'package:rydeme/screens/otp_screen.dart';

class AuthProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // User cancelled the sign-in process
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign-in cancelled by user')),
        );
        return;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;

      if (googleAuth?.accessToken == null || googleAuth?.idToken == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Failed to retrieve authentication tokens')),
        );
        return;
      }

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        String? email = user.email;
        String? name = user.displayName;
        String? phoneNumber = user.phoneNumber;
        String? photoURL = user.photoURL;

        // Print user details to console (for debugging)
        print("Email: $email");
        print("Name: $name");
        print("Phone Number: $phoneNumber");
        print("Photo URL: $photoURL");

        // You can also store these details in your app state or use them in your UI
      }

      // Navigate to HomeScreen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } catch (e) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in: ${e.toString()}')),
      );
    }
  }

  Future<void> verifyPhoneNumber(
      BuildContext context, String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Navigate to the OTP screen
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OTPScreen(
                verificationId: verificationId, phoneNumber: phoneNumber),
          ),
        );
      },
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
