import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../View/Pages/Home Screen/Components/bottom_nav_bar.dart';
import '../View/Pages/splash_screen.dart';

class AuthService {

  AuthService(context);
  handleAuthState() {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
     Get.to(const MyBottomNavBar());

    } else {
     Get.to(const SplashScreen());


    }
  }

  signOut() async {
    FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    // await FacebookAuth.instance.logOut();
  }
}
