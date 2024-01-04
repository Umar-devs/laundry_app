import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry_app/Utils/constants.dart';
import 'package:laundry_app/View/Pages/Authentication/Register/Components/term_with_title.dart';
import 'package:laundry_app/View/Pages/Authentication/Register/Components/terms_conditions_lists.dart';
import 'package:laundry_app/View/Pages/Components/reusable_text.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
        height: screenHeight,
        width: screenWidth,
        color: Colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Row(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: themeColor,
                        )),
                  ),
                  SizedBox(width: screenWidth*0.05,),
                  ReusableText(
                    weight: FontWeight.w700,
                    fontSize: screenWidth * 0.05,
                    lbl: 'Terms And Conditions',
                    clr: themeColor,
                  ),
                ],
              ),
              TermWithTitle(title: titlesOfTerms[0], term: termsList[0]),
              TermWithTitle(title: titlesOfTerms[1], term: termsList[1]),
              TermWithTitle(title: titlesOfTerms[2], term: termsList[2]),
              TermWithTitle(title: titlesOfTerms[3], term: termsList[3]),
              TermWithTitle(title: titlesOfTerms[4], term: termsList[4]),
              TermWithTitle(title: titlesOfTerms[5], term: termsList[5]),
              TermWithTitle(title: titlesOfTerms[6], term: termsList[6]),
              TermWithTitle(title: titlesOfTerms[7], term: termsList[7]),
              TermWithTitle(title: titlesOfTerms[8], term: termsList[8]),
              TermWithTitle(title: titlesOfTerms[9], term: termsList[9]),
              TermWithTitle(title: titlesOfTerms[10], term: termsList[10]),
              TermWithTitle(title: titlesOfTerms[11], term: termsList[11]),
            ],
          ),
        ),
      ),
    );
  }
}
