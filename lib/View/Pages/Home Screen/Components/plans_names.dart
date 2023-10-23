import 'package:flutter/material.dart';

import '../../../../Utils/constants.dart';
import '../../Components/reusable_text.dart';

class PlansNames extends StatelessWidget {
  const PlansNames({super.key});

  @override
  Widget build(BuildContext context) {
    return    Row(
      children: [
        SizedBox(
          width: screenWidth * 0.13,
        ),
        ReusableText(
            weight: FontWeight.w600,
            fontSize: screenWidth * 0.04,
            lbl: 'Basic'),
        SizedBox(
          width: screenWidth * 0.2,
        ),
        ReusableText(
            weight: FontWeight.w600,
            fontSize: screenWidth * 0.04,
            lbl: 'Pro'),
        SizedBox(
          width: screenWidth * 0.23,
        ),
        ReusableText(
            weight: FontWeight.w600,
            fontSize: screenWidth * 0.04,
            lbl: 'Plus'),
      ],
    );
  }
}
