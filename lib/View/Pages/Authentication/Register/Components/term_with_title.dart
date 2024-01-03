import 'package:flutter/material.dart';

import '../../../../../Utils/constants.dart';
import '../../../Components/reusable_text.dart';

class TermWithTitle extends StatelessWidget {
  const TermWithTitle({super.key, required this.title, required this.term});
final String title;
final String term;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: ReusableText(
                weight: FontWeight.w700,
                fontSize: screenWidth * 0.036,
                clr: Colors.black,
                lbl: title),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: ReusableText(
                alignTxt: TextAlign.start,
                weight: FontWeight.w600,
                clr: Colors.grey,
                fontSize: screenWidth * 0.03,
                lbl:
                term),

          ),
        ],
      ),
    );
  }
}
