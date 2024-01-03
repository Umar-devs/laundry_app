import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_app/Utils/toast_message.dart';
import '../../../../Services/Schedule Services/seve_time_slot.dart';
import '../../../../Utils/constants.dart';
import '../../Components/custom_btn.dart';
import '../../Components/reusable_text.dart';
import '../Reusable Components/time_slot.dart';
import '../Reusable Components/top_cross_icon_bottom_sheet.dart';
import 'calendar.dart';

class SchedulePickUpBottomSheetContent extends StatefulWidget {
  const SchedulePickUpBottomSheetContent({super.key});

  @override
  State<SchedulePickUpBottomSheetContent> createState() =>
      _SchedulePickUpBottomSheetContentState();
}

class _SchedulePickUpBottomSheetContentState
    extends State<SchedulePickUpBottomSheetContent> {
  final List<String> timeSlots = [
    '9.00 AM-10.00 AM',
    '10.00 AM-11.00 AM',
    '11.00 AM-12.00 PM',
    '12.00 PM-1.00 PM',
    '1.00 PM-2.00 PM',
    '2.00 PM-3.00 PM',
    '3.00 PM-4.00 PM',
    '4.00 PM-5.00 PM',
    '5.00 PM-6.00 PM',
  ];

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.7,
      width: screenWidth,
      color: const Color(0xfff2f1f2),
      child: Column(
        children: [
          const TopCrossIconBottomSheet(),
          SizedBox(
            height: screenHeight * 0.015,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.07),
            child: Align(
                alignment: Alignment.centerLeft,
                child: ReusableText(
                    weight: FontWeight.w600,
                    fontSize: screenWidth * 0.04,
                    clr: Colors.black,
                    lbl: 'Time')),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          SizedBox(
              height: screenHeight * 0.05,
              width: screenWidth * 0.9,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            saveSlot(timeSlots[index]);
                          });
                        },
                        child: TimeSlot(
                          timeSlot: timeSlots[index],
                          clr: selectedIndex == index
                              ? themeColor
                              : Colors.white,
                          txtClr: selectedIndex == index
                              ? Colors.white
                              : themeColor,
                        ));
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: screenWidth * 0.02);
                  },
                  itemCount: 9)),
          SizedBox(
            height: screenHeight * 0.025,
          ),
          const Expanded(child: HomeCalendarPage()),
          SizedBox(
            height: screenHeight * 0.025,
          ),
          CustomBtn(
              btnHeight: screenHeight * 0.05,
              btnWidth: screenWidth * 0.8,
              onTapFunction: () {
                Utils().toastMessage('Details Added');
                Get.back();
              },
              txtWeight: FontWeight.w600,
              txtFontSize: screenWidth * 0.04,
              lbl: 'Confirm'),
          SizedBox(
            height: screenHeight * 0.025,
          ),
        ],
      ),
    );
  }
}
