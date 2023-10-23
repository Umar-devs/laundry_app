import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import '../../Controller/Date Time Controller/date_time_controller.dart';
import '../../Utils/toast_message.dart';

void fetchDate() async {
  try {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final String userId = user.uid;
      final databaseRef =
          FirebaseDatabase.instance.ref().child('PickupDate').child(userId);
      databaseRef.onValue.listen((event) {
        DataSnapshot snapshot = event.snapshot;
        final Map? userData = snapshot.value as Map<dynamic, dynamic>?;
        if (userData != null) {
          final DateTimeController dateTimeController=Get.put(DateTimeController());
          final String pickUpDate = userData['PickupDate'];
          final String pickUpDay = userData['PickupDay'];
          final String pickUpMonth = userData['PickupMonth'];
          dateTimeController.setDate(pickUpDate, pickUpDay, pickUpMonth);
        }
      });
    }
  } catch (e) {
    return Utils().toastMessage(e.toString());
  }
}


void fetchTime() async {
  try {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final String userId = user.uid;
      final databaseRef =
      FirebaseDatabase.instance.ref().child('Time').child(userId);
      databaseRef.onValue.listen((event) {
        DataSnapshot snapshot = event.snapshot;
        final Map? userData = snapshot.value as Map<dynamic, dynamic>?;
        if (userData != null) {
          final DateTimeController dateTimeController=Get.put(DateTimeController());
          final String pickUpTime = userData['Time'];
          dateTimeController.setTime(pickUpTime);
        }
      });
    }
  } catch (e) {
    return Utils().toastMessage(e.toString());
  }
}