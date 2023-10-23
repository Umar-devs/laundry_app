import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:get/get.dart';

import '../Utils/toast_message.dart';

class EditAddressServiceController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  saveAddress(addressLane1Controller, addressLane2Controller, countryController,
      townOrCityController,
      postalCodeController) async {
    try{
    final String userId = auth.currentUser!.uid;
    final databaseRef =
        FirebaseDatabase.instance.ref().child('Address').child(userId);
    await databaseRef.set({
      'AddressLane1': addressLane1Controller,
      'AddressLane2': addressLane2Controller,
      'Country': countryController,
      'PostalCode': postalCodeController,
      'Town r City':townOrCityController,
    });
  }
  catch(error){
      Utils().toastMessage(error.toString());
  }
  }

}
