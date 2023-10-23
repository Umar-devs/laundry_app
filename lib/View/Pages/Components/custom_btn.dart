import 'package:flutter/material.dart';
import 'package:laundry_app/View/Pages/Components/reusable_text.dart';

import '../../../Utils/constants.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    required this.btnHeight,
    required this.btnWidth,
    required this.onTapFunction,
    required this.txtWeight,
    required this.txtFontSize,
    required this.lbl,

    this.pkjScreen = false,
  });
  final double btnHeight;
  final double btnWidth;
  final VoidCallback onTapFunction;
  final FontWeight txtWeight;
  final double txtFontSize;
  final String lbl;

  final bool pkjScreen;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTapFunction,
        child: Container(
          height: btnHeight,
          width: btnWidth,
          decoration: BoxDecoration(
              color: const Color(0xff063585),
              borderRadius:
                  BorderRadius.all(Radius.circular(screenWidth * 0.02))),
          child: Center(
            child: pkjScreen
                ? Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.25),
                        child: IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/images/trolly.png')),
                      ),
                      ReusableText(
                        weight: txtWeight,
                        fontSize: txtFontSize,
                        lbl: lbl,
                        clr: Colors.white,
                      ),
                    ],
                  )
                : Align(
                    alignment: Alignment.center,
                    child: ReusableText(
                      weight: txtWeight,
                      fontSize: txtFontSize,
                      lbl: lbl,
                      clr: Colors.white,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
