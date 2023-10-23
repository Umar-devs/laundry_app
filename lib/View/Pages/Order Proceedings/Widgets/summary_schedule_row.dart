import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../Utils/constants.dart';
import '../../Components/reusable_text.dart';

class SummaryScheduleRow extends StatelessWidget {
  const SummaryScheduleRow(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon});
  final String title;
  final String subTitle;
 final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: ReusableText(
              weight: FontWeight.w500,
              fontSize: screenWidth * 0.035,
              lbl: title),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ReusableText(
                weight: FontWeight.w400,
                clr: Colors.grey,
                alignTxt: TextAlign.start,
                fontSize: screenWidth * 0.03,
                overflowEnable: true,
                lbl: subTitle),
            FaIcon(
              icon,
              size: screenWidth * 0.045,
              color: themeColor,
            )
          ],
        ),
      ],
    );
  }
}
