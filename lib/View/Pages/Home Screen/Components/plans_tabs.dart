import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Utils/constants.dart';
import 'bottom_sheet_content.dart';

class PlansTabs extends StatelessWidget {
  PlansTabs({super.key});
  final List<String> packageNames = [
    'Basic',
    'Pro',
    'Plus',
  ];
  final List<String> packageImages = [
    'assets/images/basic.png',
    'assets/images/pro.png',
    'assets/images/plus.png',
  ];

  final List<String> prices = [
    '£49.99',
    '£59.99',
    '£69.99',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.9,
      height: screenHeight * 0.2,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.bottomSheet(
                    BottomSheetContent(package: packageNames[index]));
              },
              child: Container(
                width: screenWidth * 0.31,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow:  [
                      BoxShadow(
                          color: Colors.grey.shade50,
                          offset: const Offset(1, 1),
                          spreadRadius: 1,
                          blurRadius: 5)
                    ]),
                child: Image.asset(
                  packageImages[index],
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: screenWidth * 0.02,
            );
          },
          itemCount: 3),
    );
  }
}
