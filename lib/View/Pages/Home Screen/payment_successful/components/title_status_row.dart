import 'package:flutter/material.dart';
import '../../../../../../../Utils/constants.dart';
import '../../../Components/reusable_text.dart';

class TitleStatusRow extends StatelessWidget {
  const TitleStatusRow(
      {super.key, required this.statusOrPrice, required this.title});
  final String title;
  final String statusOrPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReusableText(
            weight: FontWeight.w300, fontSize: screenWidth * 0.0335, lbl: title),
        ReusableText(
            weight: FontWeight.w500,
            fontSize: screenWidth * 0.0335,
            lbl: statusOrPrice),
      ],
    );
  }
}
