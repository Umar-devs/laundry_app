import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laundry_app/View/Pages/Profile%20Screen/Components/user_details_tile.dart';
import '../../../../Services/name_change_in_database.dart';
import '../../../../Utils/constants.dart';
import '../../Authentication/Login/login_screen.dart';
import '../../Components/reusable_text.dart';
import 'package:get/get.dart';

import '../../Order Proceedings/Widgets/address_bottom_sheet.dart';
import '../profile_screen.dart';

class UserDetails extends StatelessWidget {
  UserDetails({
    super.key,
  });

  final auth = FirebaseAuth.instance;
  final GetNameController getNameController = Get.put(GetNameController());
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                auth.currentUser?.displayName == null
                    ? Obx(() => ReusableText(
                        weight: FontWeight.w400,
                        clr: Colors.black,
                        fontSize: screenWidth * 0.033,
                        lbl: getNameController.name.value))
                    : ReusableText(
                        weight: FontWeight.w400,
                        clr: Colors.black,
                        fontSize: screenWidth * 0.033,
                        lbl: auth.currentUser?.displayName),
                auth.currentUser?.displayName == null
                    ? GestureDetector(
                        onTap: () {
                          showChangeNameDialog(
                              getNameController.name.value, context);
                        },
                        child: FaIcon(
                          FontAwesomeIcons.pencilAlt,
                          color: themeColor,
                          size: screenWidth * 0.05,
                        ),
                      )
                    : const SizedBox(
                        height: 0,
                        width: 0,
                      )
              ],
            ),
          ),
        ),
        Divider(
          indent: screenWidth * 0.07,
          endIndent: screenWidth * 0.07,
          color: themeColor,
          thickness: 0.2,
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        Flexible(
          child: UserDetailsTile(
            changeFontSize: false,
            fontSize: screenWidth * 0.025,
            title: auth.currentUser!.email!,
            requiredIcon: false,
          ),
        ),
        Flexible(
          child: UserDetailsTile(
            title: 'Address',
            onTap: () {
              Get.bottomSheet(const AddressBottomSheetContent());
            },
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () async {
              // AuthService(context).signOut();
              await FirebaseAuth.instance.signOut();
              Get.offAll(
                const LoginScreen(),
                duration: const Duration(milliseconds: 1200),
                transition: Transition.cupertinoDialog,
              );
            },
            child: Container(
              margin: EdgeInsets.only(top: screenHeight * 0.07),
              height: screenHeight * 0.05,
              width: screenWidth * 0.3,
              decoration: BoxDecoration(
                  color: themeColor, borderRadius: BorderRadius.circular(7)),
              child: Center(
                child: ReusableText(
                  alignTxt: TextAlign.start,
                  weight: FontWeight.w500,
                  fontSize: screenWidth * 0.035,
                  lbl: 'Logout',
                  clr: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
