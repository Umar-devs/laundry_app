import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:laundry_app/View/Pages/Order%20Proceedings/Widgets/schedule_bottom_sheet_content.dart';
import 'package:laundry_app/View/Pages/Order%20Proceedings/Widgets/schedule_drop_off.dart';
import '../../../../Utils/constants.dart';
import '../../Components/reusable_text.dart';
import '../Reusable Components/back_icon.dart';
import '../Reusable Components/dotted_img.dart';
import '../Reusable Components/selected_image_proceeding_bar.dart';
import '../Reusable Components/unselected_top_proceeding_bar.dart';

class ScheduleTab extends StatefulWidget {
  const ScheduleTab({super.key});

  @override
  State<ScheduleTab> createState() => _ScheduleTabState();
}

class _ScheduleTabState extends State<ScheduleTab> {
  final circle = const Color(0xff006ac3);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      color: backgroundColor,
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: Row(
              children: [
                const BackIcon(),
                SizedBox(
                  width: screenWidth * 0.25,
                ),
                ReusableText(
                  weight: FontWeight.w600,
                  fontSize: screenWidth * 0.05,
                  lbl: 'Schedule',
                  clr: const Color(0xff05307d),
                )
              ],
            ),
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          SizedBox(
            height: screenHeight * 0.06,
            width: screenWidth,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.1,
                  ),
                  const SelectedImg(img: 'assets/images/schedule white.png'),
                  const DottedImage(),
                  const UnselectedImage(
                      img: 'assets/images/instruction icon.png'),
                  const DottedImage(),
                  const UnselectedImage(img: 'assets/images/address icon.png'),
                  const DottedImage(),
                  const UnselectedImage(img: 'assets/images/summary icon.png')
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          SizedBox(
            height: screenHeight * 0.12,
            width: screenWidth * 0.9,
            child: GestureDetector(
              onTap: () {
                Get.bottomSheet(const SchedulePickUpBottomSheetContent());
              },
              child: Card(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/images/schedule box icon.png',
                      height: screenHeight * 0.05,
                      width: screenWidth * 0.08,
                    ),
                    ReusableText(
                      weight: FontWeight.w600,
                      fontSize: screenWidth * 0.04,
                      lbl: 'Schedule your Pick Up',
                      clr: const Color(0xff02348a),
                    ),
                    FaIcon(
                      FontAwesomeIcons.plus,
                      size: screenWidth * 0.055,
                      color: const Color(0xff02348a),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          SizedBox(
            height: screenHeight * 0.12,
            width: screenWidth * 0.9,
            child: GestureDetector(
              onTap: () {
                Get.bottomSheet(const ScheduleDropOffBottomSheetContent());
              },
              child: Card(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Image.asset(
                      'assets/images/schedule box icon.png',
                      height: screenHeight * 0.05,
                      width: screenWidth * 0.08,
                    ),
                    ReusableText(
                      weight: FontWeight.w600,
                      fontSize: screenWidth * 0.04,
                      lbl: 'Schedule your Drop Off',
                      clr: const Color(0xff02348a),
                    ),
                    FaIcon(
                      FontAwesomeIcons.plus,
                      size: screenWidth * 0.055,
                      color: const Color(0xff02348a),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
