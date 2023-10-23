import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../Utils/constants.dart';
import '../../Components/reusable_text.dart';

class UserDetailsTile extends StatelessWidget {
  const UserDetailsTile(
      {super.key,
      required this.title,
      this.requiredDivider = true,
      this.requiredIcon = true,
      this.onTap,
      this.fontSize,
      this.changeFontSize = false});
  final String? title;
  final bool requiredDivider;
  final bool requiredIcon;
  final VoidCallback? onTap;
  final double? fontSize;
  final bool changeFontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: ReusableText(
                    weight: FontWeight.w400,
                    clr: Colors.black,
                    fontSize: changeFontSize ? fontSize! : screenWidth * 0.033,
                    lbl: title),
              ),
              SizedBox(
                  height: screenWidth * 0.045,
                  width: screenWidth * 0.045,
                  child: requiredIcon
                      ? GestureDetector(
                          onTap: onTap,
                          child: FaIcon(
                            FontAwesomeIcons.pencilAlt,
                            color: themeColor,
                            size: screenWidth * 0.05,
                          ))
                      : null)
            ],
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
              child: requiredDivider
                  ? const Divider(
                      thickness: 0.2,
                      color: themeColor,
                    )
                  : null,
            ),
          )
        ],
      ),
    );
  }
}
