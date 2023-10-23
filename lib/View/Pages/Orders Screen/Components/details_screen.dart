
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../Utils/constants.dart';
import '../../Components/reusable_text.dart';
import 'details_row.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.status,
    required this.package,
    required this.pickDate,
    required this.pickTime,
    required this.dropDate,
    required this.dropTime,
    required this.fragrance,
    required this.detergent,
    required this.subtotal,
    required this.address,
    required this.notes,
    required this.ind,
    required this.payInt,
    required this.userID,
    required this.orderTime,
    required this.firstStatusTitle,
    required this.secStatusTitle,
    required this.firstBtnTitle,
    required this.secBtnTitle,
    this.isCancelScreen = false,
  });
  final String status;
  final String package;
  final String pickDate;
  final String pickTime;
  final String dropDate;
  final String dropTime;
  final String fragrance;
  final String detergent;
  final String subtotal;
  final String address;
  final String notes;
  final String ind;
  final String payInt;
  final String userID;
  final String orderTime;
  final String firstStatusTitle;
  final String secStatusTitle;
  final String firstBtnTitle;
  final String secBtnTitle;
  final bool isCancelScreen;
  @override
  Widget build(BuildContext context) {
    final DatabaseReference databaseReference=FirebaseDatabase.instance.ref().child('Orders List').child(ind);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: themeColor,
          leading: Padding(
            padding: EdgeInsets.only(left: 15, top: screenHeight * 0.02),
            child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.white,
                  size: screenWidth * 0.05,
                )),
          ),
          title: ReusableText(
            fontSize: screenWidth * 0.04,
            weight: FontWeight.w600,
            clr: Colors.white,
            lbl: 'Details Screen',
          ),
          centerTitle: true,
        ),
        body: Container(
          height: screenHeight,
          color: const Color(0xfff2f1f2),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                notes.isEmpty
                    ? Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                        child: Image.asset(
                          'assets/images/white heavy check mark_ (1).png',
                          width: 110,
                          height: 110,
                        ),
                      )
                    : const Text(''),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                    height: screenHeight * 0.52,
                    width: screenWidth * 0.85,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              offset: const Offset(1, 1),
                              blurRadius: 5,
                              spreadRadius: 1),
                        ],
                        borderRadius: BorderRadius.circular(7)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            ReusableText(
                              fontSize: screenWidth * 0.04,
                              weight: FontWeight.w600,
                              clr: themeColor,
                              lbl: 'Order Details',
                            ),
                            ReusableText(
                              fontSize: screenWidth * 0.02,
                              weight: FontWeight.w400,
                              clr: themeColor,
                              lbl: 'Ready Set Fold Service',
                            ),
                          ],
                        ),
                        Divider(
                          color: themeColor,
                          height: 0.5,
                          thickness: 0.5,
                          indent: screenWidth * 0.1,
                          endIndent: screenWidth * 0.1,
                        ),
                        DetailsRow(title: 'Status', detail: status),
                        Divider(
                          color: Colors.grey.shade300,
                          height: 0.5,
                          thickness: 0.2,
                        ),
                        DetailsRow(title: 'Package', detail: package),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 0.2,
                          height: 0.5,
                        ),
                        DetailsRow(title: 'Pick Date', detail: pickDate),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 0.2,
                          height: 0.5,
                        ),
                        DetailsRow(title: 'Pick Time', detail: pickTime),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 0.2,
                          height: 0.5,
                        ),
                        DetailsRow(title: 'Drop Date', detail: dropDate),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 0.2,
                          height: 0.5,
                        ),
                        DetailsRow(title: 'Drop Time', detail: dropTime),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 0.2,
                          height: 0.5,
                        ),
                        DetailsRow(title: 'Fragrance', detail: fragrance),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 0.2,
                          height: 0.5,
                        ),
                        DetailsRow(title: 'Detergent', detail: detergent),
                        Divider(
                          color: themeColor,
                          thickness: 0.5,
                          height: 0.5,
                          indent: screenWidth * 0.1,
                          endIndent: screenWidth * 0.1,
                        ),
                        DetailsRow(title: 'Subtotal', detail: subtotal),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: screenHeight * 0.02),
                  padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                  height: screenHeight * 0.1,
                  width: screenWidth * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: ReusableText(
                          fontSize: screenWidth * 0.035,
                          weight: FontWeight.w500,
                          clr: themeColor,
                          lbl: 'Address',
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ReusableText(
                          fontSize: screenWidth * 0.027,
                          weight: FontWeight.w400,
                          clr: themeColor,
                          alignTxt: TextAlign.start,
                          lbl: address,
                        ),
                      )
                    ],
                  ),
                ),
                notes.isEmpty
                    ? SizedBox(
                        height: screenHeight * 0.01,
                      )
                    : Container(
                        margin: EdgeInsets.only(top: screenHeight * 0.02),
                        padding:
                            const EdgeInsets.only(top: 5, left: 10, right: 10),
                        height: screenHeight * 0.13,
                        width: screenWidth * 0.85,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7)),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: ReusableText(
                                fontSize: screenWidth * 0.035,
                                weight: FontWeight.w500,
                                clr: themeColor,
                                lbl: 'Notes',
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: ReusableText(
                                fontSize: screenWidth * 0.027,
                                weight: FontWeight.w400,
                                clr: themeColor,
                                lbl: notes,
                              ),
                            )
                          ],
                        ),
                      ),
             isCancelScreen?   GestureDetector(
                  onTap: (){
                    databaseReference.remove();
                    Get.back();
                  },
                  child: Container(
                    height: screenHeight * 0.05,
                    width: screenWidth * 0.3,
                    decoration: BoxDecoration(
                        color: themeColor,
                        borderRadius: BorderRadius.circular(7)),
                    child: Center(
                        child: ReusableText(
                      weight: FontWeight.w500,
                      fontSize: screenWidth * 0.03,
                      lbl: 'Delete Record',
                      clr: Colors.white,
                    )),
                  ),
                ):const SizedBox(height: 0,width: 0,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
