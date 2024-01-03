import 'package:flutter/material.dart';
import 'package:laundry_app/View/Pages/Get%20Started/page_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../Utils/constants.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  final pageControl = PageController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      width: screenWidth,
      color: Colors.grey.shade200,
      child: Stack(
        children: [
          PageView(
            controller: pageControl,
            children: [
              PageViewScreen(
                imgPath: 'assets/images/page view 3.png',
                title:
                    'Provide super clean and\nhygienic service',
                wantSkipBtn: true,
                pageControl: pageControl,
              ),
              PageViewScreen(
                imgPath: 'assets/images/page view 1.png',
                title: 'Provide various Laundry services\nand customize accordingly',
                wantSkipBtn: true,
                pageControl: pageControl,
              ),
              PageViewScreen(
                imgPath: 'assets/images/page view 2.png',
                title: 'Hassle free doorstep pickup and delivery with preferred scheduled slots',
                wantGetStartedBtn: true,
                pageControl: pageControl,
              ),
            ],
          ),
          Positioned(
            bottom: screenHeight * 0.17,
            right: screenWidth * 0.4,
            child: SmoothPageIndicator(
              controller: pageControl,
              count: 3,
              effect: WormEffect(
                  activeDotColor: const Color(0xff063585),
                  dotColor: Colors.white70,
                  dotHeight: 13,
                  dotWidth: 13,
                  spacing: screenWidth * 0.05,
                  // jumpScale: 2,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
