import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Utils/constants.dart';
import '../../../../../Controller/Notes Controller/notes_controller.dart';
import '../../../Components/reusable_text.dart';

class NotesBox extends StatelessWidget {
   NotesBox({super.key, required this.notesValue});
  final String notesValue;
  final NotesController notesController=Get.put(NotesController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.15,
      width: screenWidth * 0.85,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(1, 1),
            spreadRadius: 1,
            blurRadius: 5
        )
      ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.01,
          ),
          ReusableText(weight: FontWeight.w600, fontSize: screenWidth * 0.037, lbl: 'Notes'),

          SizedBox(
            height: screenHeight * 0.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05),
            child:
            Align(
              alignment: Alignment.centerLeft,
              child: Obx(() => ReusableText(
                  weight: FontWeight.w400,
                  fontSize: screenWidth * 0.026,
                  alignTxt: TextAlign.left,
                  overflowEnable: false,
                  lbl: notesController.notesAdded.value), ),
            )

          )
        ],
      ),
    );
  }
}
