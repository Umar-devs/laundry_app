
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../Utils/toast_message.dart';
import '../../View/Pages/Authentication/Login/login_screen.dart';
import '../../View/Pages/Home Screen/Components/bottom_nav_bar.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  RxBool showWidget = false.obs;
  void signUp(signUpEmailController, signUpPasswordController, name,
      Widget nextScreen) async {
    try {
      final UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
        email: signUpEmailController.text.toString(),
        password: signUpPasswordController.text.toString(),
      );
      if (userCredential.user != null) {
        final String userUid = userCredential.user!.uid;
        final databaseRef =
            FirebaseDatabase.instance.ref().child('users').child(userUid);
        await databaseRef.set({
          'firstName': name,
        });
      }
      showWidget.toggle();
      await Future.delayed(const Duration(seconds: 2));
      Get.to(const LoginScreen(),
          duration: const Duration(milliseconds: 1200),
          transition: Transition.fadeIn);
    } catch (error) {
      Utils().toastMessage(error.toString());
    }
  }

  void login(String email, String password) {
    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Utils().toastMessage(value.user!.email.toString());

      Get.offAll(const MyBottomNavBar(),
          duration: const Duration(milliseconds: 1200),
          transition: Transition.fadeIn);
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utils().toastMessage(error.toString());
    });
  }

  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult =
  //       await FacebookAuth.i.login(permissions: ['email', 'public_profile']);
  //
  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //
  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    return await auth.signInWithCredential(credential);
  }
}
