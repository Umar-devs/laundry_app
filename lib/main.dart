import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:laundry_app/View/Pages/Home%20Screen/Components/bottom_nav_bar.dart';
import 'package:laundry_app/View/Pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Stripe.publishableKey =
      'pk_test_51NaBipFStNFkbcMWNOSiZIVXiXLbE3X3t4VkU4mwJz556ByEZmCszD3A3AczCsBR78r5CK9EKIi6riOQwLqMOdoy00uVFvFb7x';
  await dotenv.load(fileName: 'assets/.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final auth=FirebaseAuth.instance.currentUser;

    return   GetMaterialApp(
      home: auth==null?const SplashScreen():const MyBottomNavBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
