import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Services/Save & Fetch Package/save_package_and_price.dart';
import '../../../../Utils/constants.dart';
import '../../Components/custom_btn.dart';
import '../../Components/reusable_text.dart';
import '../../Order Proceedings/Widgets/schedule_screen.dart';
import 'attribute_row.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({
    super.key,
    required this.package,
  });
  final String package;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.6,
      width: screenWidth,
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: SizedBox(
                  height: screenHeight * 0.04,
                  width: screenWidth * 0.23,
                  child: Image.asset(
                    'assets/images/cancel icon.png',
                    fit: BoxFit.fill,
                  )),
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            ReusableText(
                weight: FontWeight.w700,
                fontSize: screenWidth * 0.05,
                lbl: package == 'Basic'
                    ? 'Basic Package'
                    : package == 'Pro'
                        ? 'Pro Package'
                        : 'Plus Package'),
            ReusableText(
                weight: FontWeight.w500,
                fontSize: screenWidth * 0.025,
                lbl: package == 'Basic'
                    ? 'Small HouseHold'
                    : package == 'Pro'
                        ? 'Medium HouseHold'
                        : 'Large HouseHold'),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            PackageAttributeRow(
              attribute: 'Wash, Dry & Iron',
              topPadding: screenHeight * 0.0,
              leftPadding: screenWidth * 0.05,
            ),
            PackageAttributeRow(
              attribute: package == 'Basic'
                  ? '2 Washes a week'
                  : package == 'Pro'
                      ? '2 Washes a week'
                      : '3 Pickups a week',
              topPadding: screenHeight * 0.015,
              leftPadding: screenWidth * 0.05,
            ),
            PackageAttributeRow(
              attribute: package == 'Basic'
                  ? '3 Jumbo Bags'
                  : package == 'Pro'
                      ? '5 Jumbo Bags'
                      : '5 Jumbo Bags',
              topPadding: screenHeight * 0.015,
              leftPadding: screenWidth * 0.05,
            ),
            PackageAttributeRow(
              attribute: 'Laundry Bags Provided',
              topPadding: screenHeight * 0.015,
              leftPadding: screenWidth * 0.05,
            ),
            PackageAttributeRow(
              attribute: 'Free Detergents',
              topPadding: 015,
              leftPadding: screenWidth * 0.05,
            ),
            PackageAttributeRow(
              attribute: 'Free Softeners',
              topPadding: 015,
              leftPadding: screenWidth * 0.05,
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenWidth * 0.05,
                ),
                ReusableText(
                  weight: FontWeight.w600,
                  fontSize: screenWidth * 0.07,
                  lbl: package == 'Basic'
                      ? '£49.99'
                      : package == 'Pro'
                          ? '£59.99'
                          : '£69.99',
                  clr: Colors.green,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      weight: FontWeight.w500,
                      fontSize: screenWidth * 0.025,
                      lbl: 'Per',
                      clr: const Color(0xff063585),
                    ),
                    ReusableText(
                      weight: FontWeight.w500,
                      fontSize: screenWidth * 0.025,
                      lbl: 'Month',
                      clr: const Color(0xff063585),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            CustomBtn(
                btnHeight: screenHeight * 0.05,
                btnWidth: screenWidth * 0.8,
                onTapFunction: () {
                  savePackage(package);
                  savePrice(
                    package == 'Basic'
                        ? '£49.99'
                        : package == 'Pro'
                            ? '£59.99'
                            : '£69.99',
                  );
                  Get.to(const ScheduleTab(),
                      duration: const Duration(milliseconds: 700),
                      transition: Transition.fadeIn);
                },
                txtWeight: FontWeight.w600,
                txtFontSize: screenWidth * 0.04,
                lbl: 'Proceed'),
          ],
        ),
      ),
    );
  }
}
