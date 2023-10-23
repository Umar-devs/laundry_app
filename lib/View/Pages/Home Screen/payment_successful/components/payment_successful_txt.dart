import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientText extends StatelessWidget {
  const GradientText(
      {super.key,
      required this.textFontSize,
      required this.title,
      required this.weight,  this.txtAlign=TextAlign.center});
  final double textFontSize;
  final String title;
  final FontWeight weight;
  final TextAlign txtAlign;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          tileMode: TileMode.repeated,
          colors: [
            Color(0xff3162DA),
            Color(0xff3697F1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(bounds);
      },
      child: Text(
        title,
        style: GoogleFonts.poppins(
            decoration: TextDecoration.none,
            fontSize: textFontSize,
            fontWeight: weight,
           ),
        textAlign: txtAlign,
      ),
    );
  }
}
