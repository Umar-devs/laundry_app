import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Utils/constants.dart';

class TopCrossIconBottomSheet extends StatelessWidget {
  const TopCrossIconBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return           GestureDetector(
      onTap: () {
        Get.back();
      },
      child: SizedBox(
          height: screenHeight * 0.038,
          width: screenWidth * 0.2,
          child: Image.asset(
            'assets/images/cancel icon.png',
            fit: BoxFit.fill,
          )),
    )
    ;
  }
}
