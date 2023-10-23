import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/constants.dart';
import 'login_screen.dart';

class ForgotPasswordDoneScreen extends StatelessWidget {
  const ForgotPasswordDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(const LoginScreen(),
          transition: Transition.cupertinoDialog,
          duration:  const Duration(milliseconds: 700));
    });
    return Container(
        height: screenHeight,
        width: screenWidth,
        color: Colors.white,
        child: Center(
          child: Image.asset('assets/images/padlock 1.png'),
        ));
  }
}
