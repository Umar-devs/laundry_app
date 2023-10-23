import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
// import 'package:laundary_app_final/Utils/toast_message.dart';

class TimeController extends GetxController {
  void saveTime(String time) async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final String userId = user.uid;
        final dataBaseRef =
            FirebaseDatabase.instance.ref().child('Time').child(userId);
        dataBaseRef.set({
          'Time': time,
        });
      }
    } catch (e) {
      // Utils().toastMessage(e.toString());
      print(e.toString());
    }
  }
}
