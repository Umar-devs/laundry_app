import 'package:flutter/material.dart';

import '../../../../../Utils/constants.dart';
import '../../../Components/reusable_text.dart';
import 'package:get/get.dart';

import '../../Register/register.dart';
class ReferenceToRegisterScreen extends StatelessWidget {
  const ReferenceToRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ReusableText(
            weight: FontWeight.w500,
            fontSize: screenWidth * 0.03,
            lbl: 'Don`t have an account?'),
        GestureDetector(
            onTap: () {
              Get.to(const RegisterScreen(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 700));
            },
            child: ReusableText(
              weight: FontWeight.w600,
              fontSize: screenWidth * 0.035,
              lbl: '  Register',
              clr: const Color(0xff063585),
            ))
      ],
    );
  }
}
