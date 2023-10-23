import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../Services/Save and Fetch Notes/save_notes.dart';
import '../../../../Utils/constants.dart';
import '../../Components/custom_btn.dart';
import '../../Components/reusable_text.dart';
import '../Reusable Components/back_icon.dart';
import '../Reusable Components/dotted_img.dart';
import '../Reusable Components/selected_image_proceeding_bar.dart';
import '../Reusable Components/unselected_top_proceeding_bar.dart';
import 'bottom_sheet_detergents.dart';
import 'bottom_sheet_fragrance.dart';
import 'location_screen.dart';

class InstructionsTab extends StatefulWidget {
  const InstructionsTab({super.key});

  @override
  State<InstructionsTab> createState() => _InstructionsTabState();
}

class _InstructionsTabState extends State<InstructionsTab> {
  final circle = const Color(0xff006ac3);
  final noteController = TextEditingController();

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
                  lbl: 'Instruction',
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
                  const UnselectedImage(img: 'assets/images/schedule icon.png'),
                  const DottedImage(),
                  const SelectedImg(
                    img: 'assets/images/instruction white.png',
                  ),
                  const DottedImage(),
                  const UnselectedImage(img:  'assets/images/address icon.png'),
                 const DottedImage(),
                  const UnselectedImage(img:  'assets/images/summary icon.png'),
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.12,
                width: screenWidth * 0.9,
                child: GestureDetector(
                  onTap: () {
                    Get.bottomSheet(const FragranceBottomSheetContent());
                  },
                  child: Card(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          'assets/images/fragrance icon.png',
                          height: screenHeight * 0.03,
                          width: screenWidth * 0.1,
                        ),
                        ReusableText(
                          weight: FontWeight.w600,
                          fontSize: screenWidth * 0.04,
                          lbl: 'Select Fragrance',
                          clr: const Color(0xff02348a),
                        ),
                        FaIcon(
                          FontAwesomeIcons.plus,
                          size: screenWidth * 0.055,
                          color: const Color(0xff02348a),
                        ),
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
                    Get.bottomSheet(const DetergentBottomSheetContent());
                  },
                  child: Card(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          'assets/images/detergents icon.png',
                          height: screenHeight * 0.035,
                          width: screenWidth * 0.1,
                        ),
                        ReusableText(
                          weight: FontWeight.w600,
                          fontSize: screenWidth * 0.04,
                          lbl: 'Select Detergents',
                          clr: const Color(0xff02348a),
                        ),
                        FaIcon(
                          FontAwesomeIcons.plus,
                          size: screenWidth * 0.055,
                          color: const Color(0xff02348a),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.05),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: ReusableText(
                        weight: FontWeight.w600,
                        fontSize: screenWidth * 0.04,
                        lbl: 'Additional Instructions')),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Container(
                height: screenHeight * 0.15,
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(1, 1),
                          blurRadius: 2,
                          spreadRadius: 1)
                    ]),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Card(
                      elevation: 0,
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.02),
                        child: TextFormField(
                          controller: noteController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          style:
                              const TextStyle(overflow: TextOverflow.ellipsis),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '    Type Here',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: screenHeight * 0.035,
              ),
              Align(
                alignment: Alignment.center,
                child: CustomBtn(
                    btnHeight: screenHeight * 0.05,
                    btnWidth: screenWidth * 0.6,
                    onTapFunction: () {
                      Get.to(const AddressTab(),
                          duration: const Duration(milliseconds: 700),
                          transition: Transition.fadeIn);
                      saveNote(noteController.text);
                    },
                    txtWeight: FontWeight.w600,
                    txtFontSize: screenWidth * 0.04,
                    lbl: 'Proceed'),
              )
            ],
          )
        ],
      ),
    );
  }
}
