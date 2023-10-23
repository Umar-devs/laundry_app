import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../../../Utils/constants.dart';
import '../../Components/reusable_text.dart';

class AboutBtn extends StatelessWidget {
  const AboutBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.defaultDialog(
            backgroundColor: Colors.white,
            title: 'About us',
            titleStyle: GoogleFonts.headlandOne(
                fontSize: screenWidth * 0.04,
                color: themeColor,
                fontWeight: FontWeight.w700),
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ReusableText(
                weight: FontWeight.w400,
                fontSize: screenWidth * 0.025,
                alignTxt: TextAlign.start,
                lbl:
                    'Ready Set Fold redefines laundry for you. We prioritize convenience, quality, and saving you time. Our expert team ensures your garments receive top-notch care. Customize your wash through our user-friendly app. We \'re reliable and adaptable.',
                clr: Colors.black,
              ),
            ),
            confirm: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: screenHeight * 0.03,
                  width: screenWidth * 0.2,
                  decoration: BoxDecoration(
                      color: themeColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: ReusableText(
                      weight: FontWeight.w500,
                      fontSize: screenWidth * 0.03,
                      lbl: 'Ok',
                      clr: Colors.white,
                    ),
                  ),
                ),
              ),
            ));
      },
      child: Container(
        height: screenHeight * 0.03,
        width: screenWidth * 0.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: themeColor,
                  offset: Offset(0.1, 0.1),
                  blurRadius: 0.5,
                  spreadRadius: 0.1)
            ],
            border: Border.all(color: themeColor, width: 1)),
        child: Center(
          child: ReusableText(
              weight: FontWeight.w500,
              fontSize: screenWidth * 0.03,
              lbl: 'About'),
        ),
      ),
    );
  }
}
