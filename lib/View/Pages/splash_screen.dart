import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Utils/constants.dart';
import 'Get Started/get_started.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 2),
        () => Get.offAll(const GetStartedScreen(),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 1500)));
    return Container(
      height: Get.height,
      width: Get.width,
      color: Colors.grey.shade200,
      child: Center(
        child: FutureBuilder(
          future: Future.delayed(const Duration(milliseconds: 500)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return AnimatedContainer(
                width: 10.0,
                height: 10.0,
                duration: Duration.zero,
                child: Image.asset('assets/images/updated logo.png'),
              );
            } else {
              return AnimatedContainer(
                width: screenWidth * 0.55,
                height: screenHeight * 0.55,
                duration: const Duration(seconds: 1),
                curve: Curves.easeIn,
                child: Image.asset('assets/images/updated logo.png'),
              );
            }
          },
        ),
      ),
    );
  }
}
