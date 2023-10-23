import 'package:flutter/material.dart';
import '../../../../Controller/Package Selected/fetch_package_selected.dart';
import '../../../../Controller/payment_controller.dart';
import '../../../../Utils/constants.dart';
import '../../Components/custom_btn.dart';
import '../../Components/reusable_text.dart';
import 'package:get/get.dart';

class PayOrderBar extends StatefulWidget {
  PayOrderBar({super.key, required this.tap});
  final PaymentController paymentController = Get.put(PaymentController());

  final VoidCallback tap;

  @override
  State<PayOrderBar> createState() => _PayOrderBarState();
}

class _PayOrderBarState extends State<PayOrderBar> {
  final FetchPackageSelectedController fetchPackageSelectedController =
      Get.put(FetchPackageSelectedController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: screenWidth * 0.1, right: screenWidth * 0.05),
      height: screenHeight * 0.1,
      width: screenWidth,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(1, 1),
                color: Colors.grey.shade200,
                blurRadius: 3,
                spreadRadius: 2)
          ],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(
                20,
              ),
              topRight: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() => ReusableText(
              weight: FontWeight.w500,
              fontSize: screenWidth * 0.045,
              // clr: const Color(0xff3162DA),
              lbl: fetchPackageSelectedController.priceOfPackage.value)),
          CustomBtn(
              btnHeight: screenHeight * 0.05,
              btnWidth: screenWidth * 0.35,
              onTapFunction: widget.tap,
              txtWeight: FontWeight.w600,
              txtFontSize: screenWidth * 0.035,
              lbl: 'Pay Now')
        ],
      ),
    );
  }
}
