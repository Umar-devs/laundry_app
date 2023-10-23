import 'package:flutter/material.dart';

import '../../../../Utils/constants.dart';

class UnselectedImage extends StatelessWidget {
  const UnselectedImage({super.key, required this.img});
final String img;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: screenHeight * 0.055,
          width: screenWidth * 0.12,
          decoration: BoxDecoration(
              color: const Color(0xfff2f1f2),
              border: Border.all(color: const Color(0xfff2f1f2), width: 1),
              borderRadius: BorderRadius.circular(50)),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 1.8, right: 0, top: 2.2, bottom: 0),
          child: Container(
            height: screenHeight * 0.05,
            width: screenWidth * 0.11,
            decoration: BoxDecoration(
                color: const Color(0xffd8e3f6),
                borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: Image.asset(
                img,
                height: screenHeight * 0.02,
                width: screenHeight * 0.04,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
