import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Controller/Auth controller/auth_controller.dart';
import '../../../../../Utils/constants.dart';
import '../../../Home Screen/Components/bottom_nav_bar.dart';

class SocialLoginRow extends StatelessWidget {
  SocialLoginRow({super.key});
  // final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      child: Row(
        children: [
          const Spacer(
            flex: 1,
          ),
          SizedBox(
            width: screenWidth * 0.06,
          ),
          Expanded(
              flex: 1,
              child: SizedBox(
                height: screenHeight * 0.05,
                width: screenWidth * 0.16,
                // child: SignInButtonBuilder(
                //   highlightColor: Colors.grey.shade200,
                //   backgroundColor: Colors.transparent,
                //   elevation: 0,
                //   onPressed: () {
                //     Get.defaultDialog(
                //         backgroundColor: Colors.grey.shade400,
                //         title: '',
                //         titleStyle: const TextStyle(fontSize: 0),
                //         content: SizedBox(
                //           height: screenHeight * 0.15,
                //           width: screenWidth * 0.5,
                //           child: const Column(
                //             children: [
                //               Spacer(),
                //               CircularProgressIndicator(
                //                 color: themeColor,
                //               ),
                //               Spacer(),
                //             ],
                //           ),
                //         ));
                //     controller.signInWithGoogle().then((value) {
                //       Get.to(const MyBottomNavBar(),
                //           transition: Transition.fadeIn,
                //           duration: const Duration(milliseconds: 700));
                //     });
                //   },
                //   text: '',
                //   image: Image.asset(
                //     'assets/images/google logo.png',
                //     fit: BoxFit.fill,
                //   ),
                // ),
              )),
          SizedBox(
            width: screenWidth * 0.03,
          ),
          Expanded(
              flex: 1,
              child: SizedBox(
                width: screenWidth * 0.18,
                height: screenHeight * 0.05,
                // child: SignInButtonBuilder(
                //   highlightColor: Colors.grey.shade200,
                //   splashColor: Colors.white,
                //   backgroundColor: Colors.transparent,
                //   elevation: 0,
                //   onPressed: () {
                //     controller.signInWithFacebook().then((value) => {
                //           Get.to(const MyBottomNavBar(),
                //               transition: Transition.fadeIn,
                //               duration: const Duration(milliseconds: 700))
                //         });
                //   },
                //   text: '',
                //   image: Image.asset(
                //     'assets/images/fb logo.png',
                //     fit: BoxFit.fill,
                //   ),
                // ),
              )),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
