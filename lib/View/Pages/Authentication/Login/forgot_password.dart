
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../Utils/constants.dart';
import '../../../../Utils/toast_message.dart';
import '../../Components/custom_btn.dart';
import '../../Components/reusable_text.dart';
import '../Components/txtField.dart';
import 'done_forgot_password.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final forgotPasswordController = TextEditingController();
  // final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      color: Colors.grey.shade200,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.07),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.045,
                ),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.arrowLeft,
                          color: Color(0xff063585),
                        ))),
              ),
              // SizedBox(height: screenHeight*0.25,),
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.073,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ReusableText(
                      weight: FontWeight.w800,
                      fontSize: screenHeight * 0.02,
                      clr: const Color(0xff063585),
                      lbl: 'Reset Password?'),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.073,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ReusableText(
                    weight: FontWeight.w400,
                    fontSize: screenWidth * 0.025,
                    lbl:
                        'Don`r worry it occurs, Please enter the email \naddress linked with your account',
                    alignTxt: TextAlign.start,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenWidth * 0.05,
                  horizontal: screenWidth * 0.055,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TxtField(
                      textEditingController: forgotPasswordController,
                      label: 'Enter Your Email',
                      errorMessage: 'please! Enter Email'),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.055,
                ),
                child: CustomBtn(
                    btnHeight: screenHeight * 0.067,
                    btnWidth: screenWidth,

                    onTapFunction: () {
                      // if (_formKey.currentState!.validate()) {
                      //   auth
                      //       .sendPasswordResetEmail(
                      //           email: forgotPasswordController.text.toString())
                      //       .then((value) {
                      //     Utils().toastMessage(
                      //         'We have sent an email to account provided, check to reset password');
                      //     Future.delayed(
                      //         const Duration(seconds: 1),
                      //         () => Get.to(const ForgotPasswordDoneScreen(),
                      //             transition: Transition.fadeIn,
                      //             duration:  const Duration(milliseconds: 700)));
                      //   }).onError((error, stackTrace) {
                      //     Utils().toastMessage(error.toString());
                      //   });
                      // }
                    },
                    txtWeight: FontWeight.bold,
                    txtFontSize: screenWidth * 0.04,
                    lbl: 'Send Email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
