import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../../Utils/toast_message.dart';

UserNameController controller = Get.put(UserNameController());
String? fetchAndSetUserName(String userName,String? getUserName)  {
  try {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final String userUid = user.uid;
      final databaseRef =
          FirebaseDatabase.instance.ref().child('users').child(userUid);

      // Attach a listener to the database reference to listen for changes
      databaseRef.onValue.listen((event) {
        // Use the DataSnapshot from the Event
        DataSnapshot snapshot = event.snapshot;

        final Map<dynamic, dynamic>? userData =
            snapshot.value as Map<dynamic, dynamic>?;
        if (userData != null) {
          final String firstName = userData['firstName'] ?? '';
          final String lastName = userData['lastName'] ?? '';

          userName = controller.setUserName(userName, firstName, lastName);

        }
      });
    }
  } catch (e) {
    Utils().toastMessage('Error fetching user data: $e');
  }
  return getUserName;
}

class UserNameController extends GetxController {
  String setUserName(String userName, String firstName, String lastName) {
    userName = '$firstName $lastName';
    return userName;
  }
}
