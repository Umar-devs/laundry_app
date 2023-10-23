import 'package:flutter/material.dart';

import '../../../../Utils/constants.dart';
import '../../Components/custom_btn.dart';
import '../../Components/reusable_text.dart';
import '../../Home Screen/Components/attribute_row.dart';
import 'package:get/get.dart';
class ServiceBottomSheetContent extends StatelessWidget {
   const ServiceBottomSheetContent({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.5,
      width: screenWidth,
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: SizedBox(
                  height: screenHeight * 0.04,
                  width: screenWidth * 0.23,
                  child: Image.asset(
                    'assets/images/cancel icon.png',
                    fit: BoxFit.fill,
                  )),
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            ReusableText(
                weight: FontWeight.w700,
                fontSize: screenWidth * 0.05,
                lbl: '$title Service'),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            PackageAttributeRow(
              attribute: 'Dummy Data',
              topPadding: screenHeight * 0.0,
              leftPadding: screenWidth * 0.05,
            ),
            PackageAttributeRow(
              attribute: 'Dummy Data',
              topPadding: screenHeight * 0.015,
              leftPadding: screenWidth * 0.05,
            ),
            PackageAttributeRow(
              attribute: 'Dummy Data',
              topPadding: screenHeight * 0.015,
              leftPadding: screenWidth * 0.05,
            ),
            PackageAttributeRow(
              attribute: 'Dummy Data',
              topPadding: screenHeight * 0.015,
              leftPadding: screenWidth * 0.05,
            ),
            PackageAttributeRow(
              attribute: 'Dummy Data',
              topPadding: screenHeight * 0.015,
              leftPadding: screenWidth * 0.05,
            ),
            PackageAttributeRow(
              attribute: 'Dummy Data',
              topPadding: screenHeight * 0.015,
              leftPadding: screenWidth * 0.05,
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            CustomBtn(
              btnHeight: screenHeight * 0.05,
              btnWidth: screenWidth * 0.8,
              txtWeight: FontWeight.w600,
              txtFontSize: screenWidth * 0.04,
              lbl: 'Proceed',
              onTapFunction: () {},
            ),
          ],
        ),
      ),
    );
  }
}
