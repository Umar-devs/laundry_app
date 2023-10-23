import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../Utils/constants.dart';
import '../../Components/reusable_text.dart';

class LocationDetailRow extends StatelessWidget {
  const LocationDetailRow({super.key, required this.title, required this.subTitle});
final String title;
final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        ReusableText(
            weight: FontWeight.w500,
            fontSize: screenWidth * 0.035,
            lbl: title), ReusableText(
          weight: FontWeight.w400,
          fontSize: screenWidth * 0.03,
          lbl: subTitle,
          clr: Colors.grey,
        ),

      ],
    );
  }
}
