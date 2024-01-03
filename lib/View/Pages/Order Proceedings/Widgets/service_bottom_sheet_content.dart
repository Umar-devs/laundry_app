import 'package:flutter/material.dart';

import '../../../../Utils/constants.dart';
import '../../Components/custom_btn.dart';
import '../../Components/reusable_text.dart';
import '../../Home Screen/Components/attribute_row.dart';
import 'package:get/get.dart';

class ServiceBottomSheetContent extends StatelessWidget {
  ServiceBottomSheetContent({super.key, required this.title});
  final String title;
  final List<String> pointsWash = [
    'Expert cleaning with tailored options.',
    'Stain treatment, eco-friendly.',
    'Thorough cleaning, fabric-friendly.',
    'Different wash options, fabric-based.',
    'Specialized stain treatment.',
    'Customizable settings.',
  ];
  final List<String> pointsDry = [
    'Efficient, damage-free drying.',
    'Quick, customizable turnaround.',
    'State-of-the-art drying facilities.',
    'Multiple options, fabric-sensitive.',
    'Energy-efficient process.',
    'Quick and convenient service.',
  ];
  final List<String> pointsIron = [
    'Professional, wrinkle-free ironing.',
    'Tailored settings for fabrics.',
    'Attention to detail, polished appearance.',
    'Steam ironing for delicacy.',
    'Quality control for high standards.',
    'Option for specific preferences.',
  ];
  final List<String> pointsFold = [
    'Neat, space-saving folding.',
    'Efficient storage techniques.',
    'Folding tailored to clothing types.',
    'Attention to garment details.',
    'Customizable options.',
    'Packaging for pristine items.',
  ];
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
              attribute: title == 'Wash'
                  ? pointsWash[0]
                  : title == '  Dry'
                      ? pointsDry[0]
                      : title == 'Iron'
                          ? pointsIron[0]
                          : pointsFold[0],
              topPadding: screenHeight * 0.0,
              leftPadding: screenWidth * 0.05,
            ),
            PackageAttributeRow(
              attribute: title == 'Wash'
                  ? pointsWash[1]
                  : title == '  Dry'
                  ? pointsDry[1]
                  : title == 'Iron'
                  ? pointsIron[1]
                  : pointsFold[1],
              topPadding: screenHeight * 0.015,
              leftPadding: screenWidth * 0.05,
            ),
            PackageAttributeRow(
              attribute: title == 'Wash'
                  ? pointsWash[2]
                  : title == '  Dry'
                  ? pointsDry[2]
                  : title == 'Iron'
                  ? pointsIron[2]
                  : pointsFold[2],
              topPadding: screenHeight * 0.015,
              leftPadding: screenWidth * 0.05,
            ),
            PackageAttributeRow(
              attribute: title == 'Wash'
                  ? pointsWash[3]
                  : title == '  Dry'
                  ? pointsDry[3]
                  : title == 'Iron'
                  ? pointsIron[3]
                  : pointsFold[3],
              topPadding: screenHeight * 0.015,
              leftPadding: screenWidth * 0.05,
            ),
            PackageAttributeRow(
              attribute: title == 'Wash'
                  ? pointsWash[4]
                  : title == '  Dry'
                  ? pointsDry[4]
                  : title == 'Iron'
                  ? pointsIron[4]
                  : pointsFold[4],
              topPadding: screenHeight * 0.015,
              leftPadding: screenWidth * 0.05,
            ),
            PackageAttributeRow(
              attribute: title == 'Wash'
                  ? pointsWash[5]
                  : title == '  Dry'
                  ? pointsDry[5]
                  : title == 'Iron'
                  ? pointsIron[5]
                  : pointsFold[5],
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
              onTapFunction: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
