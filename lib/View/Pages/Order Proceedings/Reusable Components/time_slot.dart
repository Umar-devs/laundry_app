import 'package:flutter/material.dart';

import '../../../../Utils/constants.dart';
import '../../Components/reusable_text.dart';

class TimeSlot extends StatelessWidget {
  const TimeSlot({super.key, required this.timeSlot, required this.clr, required this.txtClr});
final String timeSlot;
final Color clr;
final Color txtClr;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.05,
      width: screenWidth * 0.35,
      decoration: BoxDecoration(
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.shade300,
        //     blurRadius: 5,
        //     spreadRadius: 1,
        //     offset: Offset(1, 1)
        //   )
        // ],
          color: clr,
          borderRadius:
          BorderRadius.circular(5)),
      child: Center(
          child: ReusableText(
            weight: FontWeight.w600,
            fontSize: screenWidth * 0.03,
            lbl: timeSlot,
            clr: txtClr,
          )),
    );
  }
}
