import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:laundry_app/View/Pages/Order%20Proceedings/Widgets/summary_screen.dart';
import '../../../../Controller/User Address/user_address_controller.dart';
import '../../../../Services/User Address/fetch_user_address.dart';
import '../../../../Utils/constants.dart';
import '../../Components/custom_btn.dart';
import '../../Components/reusable_text.dart';
import '../Reusable Components/back_icon.dart';
import '../Reusable Components/dotted_img.dart';
import '../Reusable Components/location_detail_row.dart';
import '../Reusable Components/selected_image_proceeding_bar.dart';
import '../Reusable Components/unselected_top_proceeding_bar.dart';
import 'address_bottom_sheet.dart';

class AddressTab extends StatefulWidget {
  const AddressTab({super.key});

  @override
  State<AddressTab> createState() => _AddressTabState();
}

class _AddressTabState extends State<AddressTab> {
  int selectedIndex = 3;
  final UserAddressController userAddressController =
      Get.put(UserAddressController());
  final circle = const Color(0xff006ac3);
  @override
  void initState() {
    fetchUserAddress();
    super.initState();
  }

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
                  lbl: selectedIndex == 1
                      ? 'Schedule'
                      : selectedIndex == 2
                          ? 'Instruction'
                          : selectedIndex == 3
                              ? 'Address'
                              : 'Summary',
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
                  const UnselectedImage(img:   'assets/images/schedule icon.png'),
                  const DottedImage(),
                const UnselectedImage(img: 'assets/images/instruction icon.png'),
                  const DottedImage(),
                 const SelectedImg(img:  'assets/images/location white.png'),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.115,
                width: screenWidth * 0.9,
                child: GestureDetector(onTap: () {
                  Get.bottomSheet(const AddressBottomSheetContent());
                },
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          'assets/images/address icon.png',
                          height: screenHeight * 0.03,
                          width: screenWidth * 0.1,
                        ),
                        ReusableText(
                          weight: FontWeight.w600,
                          fontSize: screenWidth * 0.04,
                          lbl: 'Add New Address',
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
              Container(
                height: screenHeight * 0.4,
                width: screenWidth * 0.89,
                padding: EdgeInsets.only(
                    left: screenWidth * 0.05,
                    top: screenHeight * 0.01,
                    bottom: screenHeight * 0.01,
                    right: screenWidth * 0.05),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade100,
                          offset: const Offset(1, 1),
                          spreadRadius: 5,
                          blurRadius: 5)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ReusableText(
                        weight: FontWeight.w600,
                        fontSize: screenWidth * 0.04,
                        lbl: 'Your Address'),
                    Obx(() => LocationDetailRow(
                        title: 'Address Lane 1',
                        subTitle: userAddressController.firstLane.value)),
                    Divider(
                      color: Colors.grey.shade100,
                    ),
                    Obx(() => LocationDetailRow(
                        title: 'Address Lane 2',
                        subTitle: userAddressController.secLane.value)),
                    Divider(
                      color: Colors.grey.shade100,
                    ),
                    Obx(() => LocationDetailRow(
                        title: 'City',
                        subTitle: userAddressController.city.value)),
                    Divider(
                      color: Colors.grey.shade100,
                    ),
                    Obx(() => LocationDetailRow(
                        title: 'County',
                        subTitle: userAddressController.county.value)),
                    Divider(
                      color: Colors.grey.shade100,
                    ),
                    Obx(() => LocationDetailRow(
                        title: 'Post Code',
                        subTitle: userAddressController.postCode.value)),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: screenHeight*0.05,),
          CustomBtn(
              btnHeight: screenHeight * 0.05,
              btnWidth: screenWidth * 0.6,
              onTapFunction: () {
                Get.to(const SummaryTab(),duration: const Duration(milliseconds: 700),transition: Transition.fadeIn);
              },
              txtWeight: FontWeight.w600,
              txtFontSize: screenWidth*0.035,
              lbl: 'Proceed')
        ],
      ),
    );
  }
}
