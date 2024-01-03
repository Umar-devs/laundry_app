import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Utils/constants.dart';
import '../../Components/reusable_text.dart';
import '../../Order Proceedings/Widgets/service_bottom_sheet_content.dart';

class ServicesTabs extends StatelessWidget {
  ServicesTabs({super.key});
  final List<String> serviceImages = [
    'assets/images/Wash.png',
    'assets/images/Dry.png',
    'assets/images/Iron.png',
    'assets/images/Fold.png',
  ];

  final List<String> titles = [
    'Wash',
    '  Dry',
    'Iron',
    'Fold',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.9,
      height: screenHeight * 0.22,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.bottomSheet(
                    ServiceBottomSheetContent(title: titles[index]));
              },
              child: Container(
                  width: screenWidth * 0.375,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 7,
                          spreadRadius: 1,
                          offset: const Offset(1, 1))
                    ],
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: screenHeight * 0.22,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: AssetImage(
                                      serviceImages[index],
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                          Positioned(
                            top: screenHeight * 0.014,
                            left: screenWidth * 0.125,
                            child: Text(
                              titles[index],
                              style: GoogleFonts.amaranth(
                                  fontWeight: FontWeight.w700,
                                  fontSize: screenWidth * 0.05,
                                  color: Colors.white),
                            ),
                          ),
                          Positioned(
                            bottom: screenHeight * 0.017,
                            left: screenWidth * 0.08,
                            child: Container(
                              height: screenHeight * 0.025,
                              width: screenWidth * 0.22,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: ReusableText(
                                    weight: FontWeight.w500,
                                    fontSize: screenWidth * 0.023,
                                    clr: themeColor,
                                    lbl: 'Read more'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: screenWidth * 0.02,
            );
          },
          itemCount: 4),
    );
  }
}
