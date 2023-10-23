import 'package:flutter/material.dart';
import '../../../../Utils/constants.dart';
import '../../Components/reusable_text.dart';

class HomeScreenBtn extends StatelessWidget {
  const HomeScreenBtn({super.key, required this.title, required this.tap});
final String title;
final VoidCallback tap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:tap,
      child: Container(
        height: screenHeight * 0.04,
        width: screenWidth * 0.35,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff3162DA),width: 1),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Shadow color
                spreadRadius: 1, // How much the shadow should spread
                blurRadius: 2, // How blurry the shadow should be
                offset: const Offset(0, 3), // Offset of the shadow
              ),
            ],
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff3162DA),
                  Color(0xff3697F1),
                ])
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ReusableText(
                weight: FontWeight.w700,
                fontSize: screenWidth * 0.03,
                clr: Colors.white,
                lbl: title),
            Image.asset(
              'assets/images/go forward.png',
              height: screenHeight * 0.07,
              width: screenWidth * 0.07,
            ),
          ],
        ),
      ),
    );
  }
}
