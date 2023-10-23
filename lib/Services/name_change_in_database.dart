import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../View/Pages/Profile Screen/profile_screen.dart';

Future<void> showChangeNameDialog(userName, BuildContext context) async {
  String newName = userName;
  GetNameController getNameController = Get.put(GetNameController());
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Change Name'),
        content: TextFormField(
          initialValue: newName,
          onChanged: (value) {
            newName = value;
          },
          decoration: const InputDecoration(
            hintText: 'Enter your new name',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              final User? user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                final String userUid = user.uid;
                final databaseRef = FirebaseDatabase.instance
                    .ref()
                    .child('users')
                    .child(userUid);

                // Update the user's name in the database
                await databaseRef.set({'firstName': newName});

                // Update the userName variable in the state to reflect the change
                getNameController.updateName(newName);
              }

              // Dismiss the dialog
              Get.back();
            },
            child: const Text('Save'),
          ),
          TextButton(
            onPressed: () {
              // Dismiss the dialog without saving
              Get.back();
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}

class NameController extends GetxController {
  void nameChange(userName, newName) {
    userName = newName;
  }
}
