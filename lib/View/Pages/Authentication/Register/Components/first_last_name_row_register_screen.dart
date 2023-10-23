import 'package:flutter/material.dart';

import '../../../../../Utils/constants.dart';
import '../../Components/txtField.dart';

class FirstLastNameRow extends StatelessWidget {
  const FirstLastNameRow(
      {super.key,
      required this.firstNameController,
      required this.secNameController});
  final TextEditingController firstNameController;
  final TextEditingController secNameController;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [


      ],
    );
  }
}
