import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import '../../Controller/Package Selected/fetch_package_selected.dart';
import '../../Utils/toast_message.dart';

void fetchPackage() async {
  try {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final String userUid = user.uid;
      final databaseRef =
          FirebaseDatabase.instance.ref().child('Package').child(userUid);

      // Attach a listener to the database reference to listen for changes
      databaseRef.onValue.listen((event) {
        // Use the DataSnapshot from the Event
        DataSnapshot snapshot = event.snapshot;
        final FetchPackageSelectedController fetchPackageSelectedController =
            Get.put(FetchPackageSelectedController());
        final Map<dynamic, dynamic>? userData =
            snapshot.value as Map<dynamic, dynamic>?;
        if (userData != null) {
          final String package = userData['Package'] ?? '';
          fetchPackageSelectedController.controlValue(package);
        }
      });
    }
  } catch (e) {
    Utils().toastMessage(e.toString());
  }
}

void fetchPrice() async {
  try {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final String userUid = user.uid;
      final databaseRef =
          FirebaseDatabase.instance.ref().child('Price').child(userUid);

      // Attach a listener to the database reference to listen for changes
      databaseRef.onValue.listen((event) {
        // Use the DataSnapshot from the Event
        DataSnapshot snapshot = event.snapshot;
        final FetchPackageSelectedController fetchPackageSelectedController =
            Get.put(FetchPackageSelectedController());
        final Map<dynamic, dynamic>? userData =
            snapshot.value as Map<dynamic, dynamic>?;
        if (userData != null) {
          final String price = userData['Price'] ?? '';
          fetchPackageSelectedController.controlPrice(price);
        }
      });
    }
  } catch (e) {
    Utils().toastMessage(e.toString());
  }
}
