import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Services/Set & Fetch Detergents And Fragrances/save_fragrances.dart';
import '../../../../Utils/constants.dart';
import '../../../../Utils/toast_message.dart';
import '../../Components/custom_btn.dart';
import '../../Components/reusable_text.dart';
import '../Reusable Components/top_cross_icon_bottom_sheet.dart';

class FragranceBottomSheetContent extends StatefulWidget {
  const FragranceBottomSheetContent({super.key});

  @override
  State<FragranceBottomSheetContent> createState() =>
      _FragranceBottomSheetContentState();
}

class _FragranceBottomSheetContentState
    extends State<FragranceBottomSheetContent> {
  int selectedIndex = -1;
  final List fragranceImages = [
    'assets/images/sensitive skin 1.png',
    'assets/images/sea breeze 1.png',
    'assets/images/summer breeze 1.png',
    'assets/images/lavender 1.png',
  ];
  final List fragranceNames = [
    'Sensitive\nSkin',
    'Sea\nBreeze',
    'Summer\nBreeze',
    'Lavender',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.5,
      width: screenWidth,
      color: const Color(0xfff2f1f2),
      child: Column(
        children: [
          const TopCrossIconBottomSheet(),
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.035, left: screenWidth * 0.05),
            child: Align(
                alignment: Alignment.centerLeft,
                child: ReusableText(
                  weight: FontWeight.w600,
                  fontSize: screenWidth * 0.04,
                  lbl: 'Fragrances',
                  clr: Colors.black,
                )),
          ),
          SizedBox(
            height: screenHeight * 0.035,
          ),
          SizedBox(
            height: screenHeight * 0.16,
            width: screenWidth * 0.93,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {

                        selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3.0, horizontal: 1),
                      child: Container(
                        width: screenWidth * 0.25,
                        decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? themeColor
                                : Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1, 1),
                                  spreadRadius: 1,
                                  blurRadius: 5)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              fragranceImages[index],
                              width: screenWidth * 0.21,
                            ),
                            ReusableText(
                              weight: FontWeight.w600,
                              fontSize: screenWidth * 0.027,
                              lbl: fragranceNames[index],
                              clr: selectedIndex == index
                                  ? Colors.white
                                  : themeColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: screenWidth * 0.05,
                  );
                },
                itemCount: 4),
          ),
          SizedBox(
            height: screenHeight * 0.06,
          ),
          CustomBtn(
              btnHeight: screenHeight * 0.05,
              btnWidth: screenWidth * 0.8,
              onTapFunction: () {
                saveFragrance(fragranceNames[selectedIndex]);
                Get.back();
                Utils().toastMessage('Details Added');
              },
              txtWeight: FontWeight.w600,
              txtFontSize: screenWidth * 0.04,
              lbl: 'Confirm')
        ],
      ),
    );
  }
}
