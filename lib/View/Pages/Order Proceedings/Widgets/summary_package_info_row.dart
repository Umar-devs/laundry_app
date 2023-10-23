import 'package:flutter/material.dart';
import '../../../../Utils/constants.dart';
import '../../Components/reusable_text.dart';

class SummaryPackageInfoRow extends StatelessWidget {
  const SummaryPackageInfoRow({super.key, required this.title, required this.subTitle});
final String title;
final String subTitle;
  @override
  Widget build(BuildContext context) {
    return    Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        ReusableText(
            weight: FontWeight.w600,
            fontSize: screenWidth * 0.035,
            lbl:title ),
        ReusableText(
            weight: FontWeight.w500,
            fontSize: screenWidth * 0.03,
            clr: Colors.black54,
            lbl: subTitle),
      ],
    );
  }
}
