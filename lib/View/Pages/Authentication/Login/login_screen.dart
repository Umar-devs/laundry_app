import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_app/View/Pages/Home%20Screen/Components/bottom_nav_bar.dart';
import '../../../../Controller/Auth controller/auth_controller.dart';
import '../../../../Utils/constants.dart';
import '../../Components/reusable_text.dart';
import '../Components/txtField.dart';
import 'Components/ref_to_register_screen.dart';
import 'Components/social_login.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController controller = Get.put(AuthController());

  final loginEmailTextController = TextEditingController();

  final loginPasswordTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      color: Colors.grey.shade200,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.05),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/app icons-09.png',
                height: screenHeight * 0.17,
              ),
              Column(
                children: [
                  ReusableText(
                    weight: FontWeight.w600,
                    fontSize: screenWidth * 0.065,
                    lbl: 'Laundry',
                    clr: const Color(0xff063585),
                  ),
                  ReusableText(
                      weight: FontWeight.w500,
                      fontSize: screenWidth * 0.025,
                      clr: const Color(0xff063585),
                      lbl: 'The Laundry App'),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.073,
                ),
                child: TxtField(
                    textEditingController: loginEmailTextController,
                    label: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                    fieldIcon: Icon(
                      Icons.email,
                      size: screenWidth * 0.055,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    errorMessage: 'please! Enter Your Email'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.073,
                ),
                child: TxtField(
                    textEditingController: loginPasswordTextController,
                    label: 'Password',
                    fieldIcon: Icon(
                      Icons.lock,
                      size: screenWidth * 0.055,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    errorMessage: 'please! Enter Password'),
              ),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    controller.login(loginEmailTextController.text.toString(),
                        loginPasswordTextController.text.toString());
                    setState(() {
                      tapped = true;
                    });
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.073,
                  ),
                  height: screenHeight * 0.067,
                  width: screenWidth,
                  decoration: BoxDecoration(
                      color: themeColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: tapped == true
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : ReusableText(
                              weight: FontWeight.w600,
                              fontSize: screenWidth * 0.04,
                              lbl: 'Login',
                              clr: Colors.white,
                            )),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                    onTap: () {
                      Get.to(ForgotPasswordScreen(),
                          transition: Transition.cupertinoDialog,
                          duration: const Duration(milliseconds: 700));
                    },
                    child: ReusableText(
                        weight: FontWeight.w500,
                        fontSize: screenWidth * 0.03333,
                        clr: const Color(0xff063585),
                        lbl: 'Forgot Password?')),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.073,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: screenWidth * 0.36,
                        child: Divider(
                          color: Colors.grey.shade400,
                        )),
                    ReusableText(
                        weight: FontWeight.w500,
                        fontSize: screenWidth * 0.036,
                        clr: Colors.grey.shade500,
                        lbl: 'Or'),
                    SizedBox(
                        width: screenWidth * 0.36,
                        child: Divider(
                          color: Colors.grey.shade400,
                        )),
                  ],
                ),
              ),
              SocialLoginRow(),
              const ReferenceToRegisterScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
