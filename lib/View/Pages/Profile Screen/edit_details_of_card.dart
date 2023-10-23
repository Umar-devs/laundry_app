import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_app/View/Pages/Profile%20Screen/profile_screen.dart';

import '../../../Utils/constants.dart';
import '../Authentication/Components/txtField.dart';
import '../Components/custom_btn.dart';
import '../Home Screen/Components/custom_top_container.dart';


class EditCardDetailsScreen extends StatelessWidget {
  const EditCardDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      color: Colors.white,
      child: Stack(
        children: [
          Column(
            children: [
              const CustomTopContainer(label: 'Payment Method'),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.045,vertical: screenWidth*0.045),
                child:  const TxtField(
                  label: 'Card Number',
                    errorMessage: 'please! Enter Card Number'
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.045),
                child: const TxtField(
                  label: 'Name',
                    errorMessage: 'please! Enter Name'
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.05,vertical: screenWidth*0.045),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TxtField(
                      label: 'CVV',
                      customWidth: screenWidth * 0.4,
                        errorMessage: 'please! Enter CVV'
                    ),
                    TxtField(
                      label: 'Expiry Date MM/YY',
                      customWidth: screenWidth * 0.4,
                        errorMessage: 'please! Mention Expiry Date'
                    ),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.05,),
                child: CustomBtn(
                    btnHeight: screenHeight * 0.067,
                    btnWidth: screenWidth,
                    onTapFunction: () {
                      Get.to( const ProfileScreen(),
                          transition: Transition.cupertinoDialog,
                          duration: const Duration(milliseconds: 1500));
                    },
                    txtWeight: FontWeight.bold,
                    txtFontSize: screenWidth * 0.04,
                    lbl: 'Done'),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: screenWidth * 0.18,
              width: screenWidth,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Footer.png'),
                      fit: BoxFit.cover)),
            ),
          ),
        ],
      ),
    );
  }
}
