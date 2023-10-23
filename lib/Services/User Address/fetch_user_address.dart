import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import '../../Controller/User Address/user_address_controller.dart';
import '../../Utils/toast_message.dart';

void fetchUserAddress() async {
  try {

    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {

      final String userUid = user.uid;
      final databaseRef =
          FirebaseDatabase.instance.ref().child('Address').child(userUid);

      // Attach a listener to the database reference to listen for changes
      databaseRef.onValue.listen((event) {
        // Use the DataSnapshot from the Event
        DataSnapshot snapshot = event.snapshot;

        final Map<dynamic, dynamic>? userData =
            snapshot.value as Map<dynamic, dynamic>?;
        if (userData != null) {
          String lanes = '';
          String countryName = '';
          String userPostalCode = '';
          String townOrCity = '';
          final UserAddressController userAddressController=Get.put(UserAddressController());
          final String firstLane = userData['Lane 1'] ?? '';
          final String secLane = userData['Lane 2'] ?? '';
          final String postalCode = userData['Post Code'] ?? '';
          final String country = userData['County'] ?? '';
          final String townCity = userData['City'] ?? '';
          lanes = '$firstLane $secLane';
          countryName = country;
          userPostalCode = postalCode;
          townOrCity = townCity;
          userAddressController.getAddress(lanes, countryName, userPostalCode, townOrCity,firstLane,secLane);
        }
      });
    }
  } catch (e) {
    Utils().toastMessage(e.toString());
  }
}
