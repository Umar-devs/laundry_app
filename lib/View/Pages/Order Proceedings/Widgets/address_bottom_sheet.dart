import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Controller/User Address/user_address_controller.dart';
import '../../../../Services/User Address/save_address.dart';
import '../../../../Utils/constants.dart';
import '../../Authentication/Components/txtField.dart';
import '../../Components/custom_btn.dart';
import '../../Components/reusable_text.dart';
import '../Reusable Components/top_cross_icon_bottom_sheet.dart';

class AddressBottomSheetContent extends StatefulWidget {
  const AddressBottomSheetContent({super.key});

  @override
  State<AddressBottomSheetContent> createState() =>
      _AddressBottomSheetContentState();
}

class _AddressBottomSheetContentState extends State<AddressBottomSheetContent> {
  final lane1Controller = TextEditingController();

  final lane2Controller = TextEditingController();

  final cityController = TextEditingController();

  final countryController = TextEditingController();

  final postCodeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final UserAddressController userAddressController =
      Get.put(UserAddressController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
      height: screenHeight * 0.6,
      width: screenWidth,
      color: Colors.grey.shade200,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const TopCrossIconBottomSheet(),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              ReusableText(
                  weight: FontWeight.w600,
                  fontSize: screenWidth * 0.045,
                  lbl: 'Edit Address'),
              SizedBox(
                height: screenHeight * 0.015,
              ),
              TxtField(
                textEditingController: lane1Controller,
                label: 'Address Lane 1',
                errorMessage: 'Empty Field',
                fieldIcon: const Icon(Icons.add_location),
              ),
              SizedBox(
                height: screenHeight * 0.015,
              ),
              TxtField(
                textEditingController: lane2Controller,
                wantError: false,
                label: 'Address Lane 2',
                errorMessage: 'Empty Field',
                fieldIcon: const Icon(Icons.add_location),
              ),
              SizedBox(
                height: screenHeight * 0.015,
              ),
              TxtField(
                textEditingController: cityController,
                label: 'City',
                errorMessage: 'Empty Field',
                fieldIcon: const Icon(Icons.location_city),
              ),
              SizedBox(
                height: screenHeight * 0.015,
              ),
              TxtField(
                textEditingController: countryController,
                label: 'County',
                errorMessage: 'Empty Field',
                fieldIcon: const Icon(Icons.my_location_rounded),
              ),
              SizedBox(
                height: screenHeight * 0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TxtField(
                    textEditingController: postCodeController,
                    label: 'Post Code',
                    errorMessage: 'Empty Field',
                    customWidth: screenWidth * 0.45,
                  ),
                  CustomBtn(
                      btnHeight: screenHeight * 0.065,
                      btnWidth: screenWidth * 0.45,
                      onTapFunction: () {
                        setState(() {
                          if (_formKey.currentState!.validate()) {
                            saveAddress(
                                lane1Controller.text,
                                lane2Controller.text,
                                countryController.text,
                                cityController.text,
                                postCodeController.text);
                            Get.back();
                          }
                        });
                      },
                      txtWeight: FontWeight.w600,
                      txtFontSize: screenWidth * 0.035,
                      lbl: 'Save')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
