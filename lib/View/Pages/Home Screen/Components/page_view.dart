import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../Utils/constants.dart';

class PageViewHome extends StatefulWidget {
  const PageViewHome({super.key});

  @override
  State<PageViewHome> createState() => _PageViewHomeState();
}

class _PageViewHomeState extends State<PageViewHome> {
  final controller = PageController();
  int pageNumber = 0;
  final List<String> images = [
    'assets/images/home img 3.png',
    'assets/images/home img 2.png',
    'assets/images/home img 1.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: screenHeight * 0.2,
          width: screenWidth * 0.9,
          child: PageView.builder(
            itemCount: images.length,
            controller: controller,
            onPageChanged: (index) {
              pageNumber = index;
            },
            dragStartBehavior: DragStartBehavior.down,
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                images[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Positioned(
            top: screenHeight * 0.085,
            left: screenWidth * 0.03,
            child: SizedBox(
              width: screenWidth * 0.84,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          pageNumber > 0 ? pageNumber-- : null;
                        });
                        if (controller.hasClients) {
                          controller.animateToPage(pageNumber,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        }
                      },
                      child: FaIcon(
                        FontAwesomeIcons.chevronCircleLeft,
                        size: screenWidth * 0.065,
                        color: Colors.white.withOpacity(0.8),
                      )),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          pageNumber < 2 ? pageNumber++ : null;
                        });
                        if (controller.hasClients) {
                          controller.animateToPage(pageNumber,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        }
                      },
                      child: FaIcon(
                        FontAwesomeIcons.chevronCircleRight,
                        size: screenWidth * 0.065,
                        color: Colors.white.withOpacity(0.8),
                      )),
                ],
              ),
            ))
      ],
    );
  }
}
