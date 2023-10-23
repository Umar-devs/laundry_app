import 'package:flutter/material.dart';

import '../../../../Utils/constants.dart';

class DottedImage extends StatelessWidget {
  const DottedImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Image.asset(
        'assets/images/dotted line.png',
        height: screenHeight * 0.045,
        width: screenHeight * 0.045,
      ),
    );
  }
}
