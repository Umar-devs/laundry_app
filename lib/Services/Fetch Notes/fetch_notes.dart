import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../../Controller/Notes Controller/notes_controller.dart';
import '../../Utils/toast_message.dart';

void fetchNotes() {
  final User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    try {
      String note;
      final NotesController notesController = Get.put(NotesController());
      final String userId = user.uid;
      final databaseRef =
          FirebaseDatabase.instance.ref().child('Notes').child(userId);
      databaseRef.onValue.listen((event) {
        DataSnapshot snapshot = event.snapshot;
        final Map<dynamic, dynamic> userData =
            snapshot.value as Map<dynamic, dynamic>;
        final String notes = userData['Note'];
        note = notes;
        notesController.manageNotes(note);
      });
    } catch (e) {
      return Utils().toastMessage(e.toString());
    }
  }
}
