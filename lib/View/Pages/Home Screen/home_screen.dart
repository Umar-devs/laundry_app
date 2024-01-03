import 'package:flutter/material.dart';
import '../../../Utils/constants.dart';
import '../Components/reusable_text.dart';
import 'Components/about_btn.dart';
import 'Components/page_view.dart';
import 'Components/plans_tabs.dart';
import 'Components/service_tabs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> packagrImages = [
    'assets/images/bronze.png',
    'assets/images/silver.png',
    'assets/images/gold.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      color: Colors.grey.shade100,
      child: SingleChildScrollView(
        physics: const PageScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  SizedBox(
                      height: screenHeight * 0.05,
                      width: screenWidth * 0.3,
                      child: Image.asset(
                        'assets/images/updated logo.png',
                        fit: BoxFit.fill,
                      )),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: AboutBtn(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            const PageViewHome(),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Align(
                alignment: Alignment.center,
                child: ReusableText(
                    weight: FontWeight.w600,
                    fontSize: screenWidth * 0.045,
                    lbl: 'Plans')),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            PlansTabs(),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Align(
                alignment: Alignment.center,
                child: ReusableText(
                    weight: FontWeight.w600,
                    fontSize: screenWidth * 0.045,
                    lbl: 'Services')),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            ServicesTabs(),
            SizedBox(
              height: screenHeight * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
