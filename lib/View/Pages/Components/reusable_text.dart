import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Utils/constants.dart';

class ReusableText extends StatelessWidget {
  const ReusableText(
      {super.key,
      required this.weight,
      required this.fontSize,
      required this.lbl,
      this.clr = themeColor,
      this.alignTxt = TextAlign.center,
      this.overflowEnable = false});
  final FontWeight weight;
  final double fontSize;
  final String? lbl;
  final Color clr;
  final TextAlign alignTxt;
  final bool overflowEnable;
  @override
  Widget build(BuildContext context) {
    return Text(
      lbl!,
      textAlign: alignTxt,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: weight,
        decoration: TextDecoration.none,
        color: clr,
        // Handles text overflow
      ),
      overflow: overflowEnable ? TextOverflow.ellipsis : TextOverflow.clip,
    );
  }
}
