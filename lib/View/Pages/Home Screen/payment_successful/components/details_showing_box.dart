import 'package:flutter/material.dart';
import 'package:laundry_app/View/Pages/Home%20Screen/payment_successful/components/title_status_row.dart';
import '../../../../../../../Utils/constants.dart';
import '../../../Components/reusable_text.dart';

class DetailsShowingBox extends StatelessWidget {
   const DetailsShowingBox(
      {super.key,
      required this.packageName,
      required this.pickDate,
      required this.pickTime,
      required this.price,
      required this.fragrance,
      required this.detergent,
      required this.dropDate,
      required this.dropTime, });
  final String packageName;

  final String pickDate;
  final String dropDate;
  final String detergent;
  final String dropTime;
  final String pickTime;
  final String price;
  final String fragrance;
  // final OrderNumberController orderNumberController=Get.put(OrderNumberController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.5,
      width: screenWidth * 0.85,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(1, 1),
                spreadRadius: 1,
                blurRadius: 5)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Align(
                  alignment: Alignment.center,
                  child:
                  ReusableText(
                      weight: FontWeight.w600,
                      fontSize: screenWidth * 0.035,
                      lbl: 'Order Details')),
              Align(
                alignment: Alignment.center,
                child: ReusableText(
                  weight: FontWeight.w500,
                  fontSize: screenWidth * 0.025,
                  lbl: 'Ready Set Fold Service',
                ),
              ),
            ],
          ),
          Divider(
            height: 1,
            thickness: 0.4,
            indent: screenWidth * 0.11,
            endIndent: screenWidth * 0.11,
            color: themeColor,
          ),
          SizedBox(
            height: screenHeight * 0.35,
            width: screenWidth * 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const TitleStatusRow(
                  statusOrPrice: 'Pending',
                  title: 'Status',
                ),
                Divider(
                  color: Colors.grey.shade50,
                ),
                TitleStatusRow(
                  statusOrPrice: packageName,
                  title: 'Package',
                ),
                Divider(
                  color: Colors.grey.shade100,
                ),
                TitleStatusRow(
                  statusOrPrice: pickDate,
                  // '$pickDate $pickMonth $pickDay',
                  title: 'Pickup Date',
                ),
                Divider(
                  color: Colors.grey.shade50,
                ),
                TitleStatusRow(
                  statusOrPrice: pickTime,
                  title: 'Pickup Time',
                ),
                Divider(
                  color: Colors.grey.shade50,
                ),
                TitleStatusRow(
                  statusOrPrice: dropDate,
                  // '$pickDate $pickMonth $pickDay',
                  title: 'Drop Off Date',
                ),
                Divider(
                  color: Colors.grey.shade50,
                ),
                TitleStatusRow(
                  statusOrPrice: dropTime,
                  title: 'Drop Off Time',
                ),
                Divider(
                  color: Colors.grey.shade50,
                ),
                TitleStatusRow(
                  statusOrPrice: fragrance,
                  title: 'Fragrance',
                ),
                Divider(
                  color: Colors.grey.shade50,
                ),
                TitleStatusRow(
                  statusOrPrice: detergent,
                  title: 'Detergent',
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 0.4,
            indent: screenWidth * 0.11,
            endIndent: screenWidth * 0.11,
            color: themeColor,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableText(
                    weight: FontWeight.w600,
                    fontSize: screenWidth * 0.035,
                    lbl: 'Subtotal'),
                ReusableText(
                    weight: FontWeight.w500,
                    fontSize: screenWidth * 0.035,
                    lbl: price),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
