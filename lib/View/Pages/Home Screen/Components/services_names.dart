import 'package:flutter/material.dart';

import '../../../../Utils/constants.dart';
import '../../Components/reusable_text.dart';

class ServicesNames extends StatelessWidget {
  const ServicesNames({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.1,
      width: screenWidth * 0.9,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ReusableText(
                weight: FontWeight.w600,
                fontSize: screenWidth * 0.04,
                lbl: 'Wash');
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: screenWidth * 0.2,
            );
          },
          itemCount: 4),
    );
  }
}
