import 'package:flutter/material.dart';
import '../../../../Utils/constants.dart';
import '../../Components/reusable_text.dart';

class CustomTopContainer extends StatelessWidget {
  const CustomTopContainer({super.key, required this.label});
final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.163,
      width: screenWidth,
      decoration: BoxDecoration(
        color:  Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0),
            offset: const Offset(0, 0), // no shadow on top and left
            blurRadius: 5,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: const Offset(0, 1), // shadow on right and bottom
            blurRadius: 2,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              const Spacer(),
              Padding(
                padding: EdgeInsets.only(top: screenWidth * 0.06),
                child: Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.1),
                  child: ReusableText(
                      weight: FontWeight.w700,
                      fontSize: screenWidth * 0.037,
                      lbl:label),
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
