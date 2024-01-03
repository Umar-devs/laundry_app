import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utils/constants.dart';
import '../Authentication/Login/login_screen.dart';
import '../Components/custom_btn.dart';
import '../Components/reusable_text.dart';

class PageViewScreen extends StatelessWidget {
  const PageViewScreen(
      {super.key,
      required this.imgPath,
      required this.title,
      required this.pageControl,
      this.wantSkipBtn = false,
      this.wantGetStartedBtn = false});
  final String imgPath;
  final String title;
  final PageController pageControl;
  final bool wantSkipBtn;
  final bool wantGetStartedBtn;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: screenHeight * 0.05,
          ),
          wantSkipBtn
              ? Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.05),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                        onTap: () {
                          Get.to(const LoginScreen(),
                              transition: Transition.fadeIn,
                              duration: const Duration(milliseconds: 700));
                        },
                        child: ReusableText(
                            weight: FontWeight.w500,
                            fontSize: screenWidth * 0.04,
                            lbl: 'Skip')),
                  ),
                )
              : const Text(''),
          SizedBox(
            height: screenHeight * 0.15,
          ),
          Image.asset(
            imgPath,
            height: screenHeight * 0.42,
            width: screenWidth,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: ReusableText(
                weight: FontWeight.w600,
                fontSize: screenWidth * 0.035,
                clr: const Color(0xff063585),
                lbl: title),
          ),
          SizedBox(
            height: screenHeight * 0.15,
          ),
          wantGetStartedBtn
              ? CustomBtn(
                  btnHeight: screenHeight*0.05,
                  btnWidth: screenWidth * 0.8,
                  onTapFunction: () {
                    Get.to(const LoginScreen(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 700));
                  },
                  txtWeight: FontWeight.w600,
                  txtFontSize: screenWidth * 0.03,

                  lbl: 'Get Started')
              : const Text('')
        ],
      ),
    );
  }
}
