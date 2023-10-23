import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../Utils/constants.dart';
import '../../Components/reusable_text.dart';

class PackageAttributeRow extends StatelessWidget {
  const PackageAttributeRow(
      {super.key,
      required this.attribute,
      required this.topPadding,
      required this.leftPadding});
  final String attribute;
  final double topPadding;
  final double leftPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding, top: topPadding),
      child: Row(
        children: [
          // Spacer(),
          const FaIcon(FontAwesomeIcons.handPointRight,color: themeColor,),
          SizedBox(width: screenWidth*0.03,),
          ReusableText(
            weight: FontWeight.w600,
            fontSize: screenWidth * 0.04,
            lbl: attribute,
            // clr: Colors.grey.shade700,
          ),
        ],
      ),
    );
  }
}
