
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Controller/Auth controller/auth_controller.dart';
import '../../../../Utils/constants.dart';
import '../../../../Utils/toast_message.dart';
import '../../Components/reusable_text.dart';
import '../Components/txtField.dart';
import '../Login/login_screen.dart';
import 'Components/reference_to_login_screen_register_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthController controller = Get.put(AuthController());
  final signUpEmailTextController = TextEditingController();
  final signUpPasswordTextController = TextEditingController();
  final signUpConfirmPasswordTextController = TextEditingController();
  final nameController = TextEditingController();
  final secNameController = TextEditingController();
  // final databaseRef = FirebaseDatabase.instance.ref('firstName');
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      color: Colors.grey.shade200,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: ReusableText(
                      weight: FontWeight.w600,
                      fontSize: screenWidth * 0.065,
                      lbl: 'Laundry',
                      clr: const Color(0xff063585),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.085,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ReusableText(
                      weight: FontWeight.w600,
                      fontSize: screenHeight * 0.02,
                      lbl: 'Enter Details'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.073,
                ),
                child: TxtField(
                    label: 'Full Name*',
                    textEditingController: nameController,
                    fieldIcon: Icon(
                      Icons.person,
                      size: screenWidth * 0.055,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    errorMessage: 'please! Enter Email'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.073,
                ),
                child: TxtField(
                    label: 'Email Address*',
                    keyboardType: TextInputType.emailAddress,
                    textEditingController: signUpEmailTextController,
                    fieldIcon: Icon(
                      Icons.email,
                      size: screenWidth * 0.055,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    errorMessage: 'please! Enter Email'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.073,
                ),
                child: TxtField(
                    label: 'Set Password*',
                    textEditingController: signUpPasswordTextController,
                    fieldIcon: Icon(
                      Icons.lock,
                      size: screenWidth * 0.055,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    errorMessage: 'please! Enter Password'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.073,
                ),
                child: TxtField(
                  label: 'Re-enter Password*',
                  errorMessage: 'please! Confirm Password First',
                  fieldIcon: Icon(
                    Icons.lock,
                    size: screenWidth * 0.055,
                    color: Colors.black.withOpacity(0.4),
                  ),
                  textEditingController: signUpConfirmPasswordTextController,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.015,
                      ),
                      child: Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: CheckboxListTile(
                          checkColor: Colors.white,
                          activeColor: const Color(0xff063585),
                          title: ReusableText(
                              weight: FontWeight.w600,
                              alignTxt: TextAlign.start,
                              fontSize: screenWidth * 0.027,
                              lbl:
                                  'Accept our Terms of use and Privacy Policy'),
                          value: checkedValue,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue = newValue!;
                              if (kDebugMode) {
                                print(checkedValue.toString());
                              }
                            });
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.073,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (checkedValue != true) {
                        Utils().toastMessage(
                            'please! Accept our Terms and Conditions to proceed');
                      } else {
                        if (_formKey.currentState!.validate()) {
                          if (signUpPasswordTextController.text !=
                              signUpConfirmPasswordTextController.text) {
                            Utils().toastMessage('Password not match');
                            return;
                          }
                          setState(() {
                            tapped = true;
                          });
                          controller.signUp(
                              signUpEmailTextController,
                              signUpPasswordTextController,
                              nameController.text,
                              const LoginScreen());
                        }
                      }
                    },
                    child: Container(
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
                                lbl: 'Register',
                                clr: Colors.white,
                              ),
                      ),
                    ),
                  )),
              SizedBox(
                height: screenWidth * 0.01,
              ),
              const ReferenceToLoginScreenRow(),
              SizedBox(
                height: screenHeight * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
