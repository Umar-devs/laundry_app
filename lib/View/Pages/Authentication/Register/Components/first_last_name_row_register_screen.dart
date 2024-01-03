import 'package:flutter/material.dart';


class FirstLastNameRow extends StatelessWidget {
  const FirstLastNameRow(
      {super.key,
      required this.firstNameController,
      required this.secNameController});
  final TextEditingController firstNameController;
  final TextEditingController secNameController;
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [


      ],
    );
  }
}
