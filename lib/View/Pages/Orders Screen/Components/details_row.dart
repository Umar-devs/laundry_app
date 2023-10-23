import 'package:flutter/material.dart';

import '../../../../Utils/constants.dart';
import '../../Components/reusable_text.dart';


class DetailsRow extends StatelessWidget {
  const DetailsRow({super.key, required this.title, required this.detail});

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReusableText(

            fontSize: screenWidth * 0.035,
            weight: FontWeight.w400,
            clr: themeColor, lbl:title ,),
        ReusableText(

            fontSize: screenWidth * 0.035,
            weight: FontWeight.w500,
            clr: themeColor, lbl: detail,),
      ],
    );
  }
}
