import 'package:flutter/material.dart';

import '../../../../../Utils/constants.dart';
import '../../../Components/reusable_text.dart';
import '../../Login/login_screen.dart';
import 'package:get/get.dart';
class ReferenceToLoginScreenRow extends StatelessWidget {
  const ReferenceToLoginScreenRow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ReusableText(
            weight: FontWeight.w500,
            fontSize: screenWidth * 0.03,
            lbl: 'Already have an account?'),
        GestureDetector(
            onTap: () {
              Get.to(const LoginScreen(),
                  transition: Transition.leftToRight,
                  duration:  const Duration(milliseconds: 700));
            },
            child: ReusableText(
              weight: FontWeight.w600,
              fontSize: screenWidth * 0.035,
              lbl: '  Login',
              clr: const Color(0xff063585),
            ))
      ],
    );
  }
}
