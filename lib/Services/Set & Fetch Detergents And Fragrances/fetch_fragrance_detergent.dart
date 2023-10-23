import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import '../../Controller/Fragrance&Detergent Controller/fetch_fragrance_detergent.dart';
import '../../Utils/toast_message.dart';

void fetchDetergent() async {
  try {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final String userUid = user.uid;
      final databaseRef =
      FirebaseDatabase.instance.ref().child('Detergent').child(userUid);

      // Attach a listener to the database reference to listen for changes
      databaseRef.onValue.listen((event) {
        // Use the DataSnapshot from the Event
        DataSnapshot snapshot = event.snapshot;
        final FragranceDetergentController fragranceDetergentController =
        Get.put(FragranceDetergentController());
        final Map<dynamic, dynamic>? userData =
        snapshot.value as Map<dynamic, dynamic>?;
        if (userData != null) {
          final String detergent = userData['Detergent'] ?? '';
          fragranceDetergentController.fetchDetergent(detergent);
        }
      });
    }
  } catch (e) {
    Utils().toastMessage(e.toString());
  }
}
void fetchFragrance() async {
  try {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final String userUid = user.uid;
      final databaseRef =
      FirebaseDatabase.instance.ref().child('Fragrances').child(userUid);

      // Attach a listener to the database reference to listen for changes
      databaseRef.onValue.listen((event) {
        // Use the DataSnapshot from the Event
        DataSnapshot snapshot = event.snapshot;
        final FragranceDetergentController fragranceDetergentController =
        Get.put(FragranceDetergentController());
        final Map<dynamic, dynamic>? userData =
        snapshot.value as Map<dynamic, dynamic>?;
        if (userData != null) {
          final String fragrance = userData['Fragrance'] ?? '';
          fragranceDetergentController.fetchFragrance(fragrance);
        }
      });
    }
  } catch (e) {
    Utils().toastMessage(e.toString());
  }
}