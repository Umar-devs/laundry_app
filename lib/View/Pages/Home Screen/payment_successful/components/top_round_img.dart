import 'package:flutter/material.dart';

import '../../../../../../../Utils/constants.dart';

class TopRoundImage extends StatelessWidget {
  const TopRoundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: screenWidth * 0.05),
      child: SizedBox(
        height: screenWidth * 0.31,
        width: screenWidth * 0.3,
        child: Stack(
          children: [
            Positioned(
              bottom: -3,
              right: -5,
              child: Container(
                height: screenWidth * 0.08,
                width: screenWidth * 0.33,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                        AssetImage('assets/images/Ellipse 7.png'),
                        opacity: 1,
                        fit: BoxFit.fill)),
              ),
            ),
            Positioned(
              top: 0,
              left: 5,
              child: Center(
                child: Container(
                  height: screenWidth * 0.27,
                  width: screenWidth * 0.27,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/white heavy check mark_ (1).png'),
                          fit: BoxFit.fill)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
