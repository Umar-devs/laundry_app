import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils/toast_message.dart';

Future<void> uploadImageToFirebaseStorageAndDatabase(File imageFile) async {
  final auth = FirebaseAuth.instance;
  final databaseRef = FirebaseDatabase.instance.ref();
  try {
    User? user = auth.currentUser;
    if (user == null) {
      // Handle the case when the user is not logged in
      return;
    }

    // Create a reference to the Firebase Storage bucket
    final storageRef =
        firebase_storage.FirebaseStorage.instance.ref().child('Profile');

    // Generate a unique file name using the user's UID and the current timestamp
    final String fileName = user.uid;

    // Upload the image to Firebase Storage
    final task = storageRef.child(fileName).putFile(imageFile);

    // Wait for the upload to complete
    await task;

    // Get the download URL of the uploaded image
    final imageUrl = await storageRef.child(fileName).getDownloadURL();

    // Save the image URL to the Firebase Realtime Database
    await databaseRef
        .child('users')
        .child(user.uid)
        .child('profileImage')
        .set(imageUrl).then((value) async{
      SharedPreferences preferences=await SharedPreferences.getInstance();
      preferences.setString('profileLink', imageUrl);
    });

    // The image has been successfully uploaded and its URL is saved to the database.
    Utils().toastMessage('Profile Uploaded successfully');
  } catch (e) {
    // Handle any errors that occurred during the upload process.
    Utils().toastMessage('Error: $e');
  }
}

Future<void> updateImageOnFirebaseStorageAndDatabase(File newImageFile) async {
  final auth = FirebaseAuth.instance;
  try {
    User? user = auth.currentUser;
    if (user == null) {
      // Handle the case when the user is not logged in
      return;
    }

    // Create a reference to the Firebase Storage bucket
    final storageRef =
    firebase_storage.FirebaseStorage.instance.ref().child('Profile');

    // Generate a unique file name using the user's UID and the current timestamp
    final String fileName = user.uid;

    // Get the reference to the existing image
    final existingImageRef = storageRef.child(fileName);

    // Check if the previous image exists
    final existingImageSnapshot = await existingImageRef.getDownloadURL();
    if (existingImageSnapshot != null) {
      // The previous image exists, delete it from Firebase Storage
      await existingImageRef.delete();
    }

    // Upload the new image to Firebase Storage
    final task = storageRef.child(fileName).putFile(newImageFile);

    // Wait for the upload to complete
    await task;

    // Get the download URL of the uploaded image
    final imageUrl = await storageRef.child(fileName).getDownloadURL();

    // Update the image URL in the Firebase Realtime Database
    DatabaseReference databaseRef = FirebaseDatabase.instance.ref();
    await databaseRef
        .child('users')
        .child(user.uid)
        .child('profileImage')
        .set(imageUrl)
        .then((value) async{
          Utils().toastMessage('Update successful');
          SharedPreferences preferences=await SharedPreferences.getInstance();
          preferences.setString('profileLink', imageUrl);
    });

    // The image has been successfully updated, and its URL is saved to the database.
  } catch (e) {
    Utils().toastMessage('Update unsuccessful: $e');
  }
}


// Function to display the uploaded or updated image in a CircularAvatar

// Function to display the uploaded or updated image in a CircularAvatar
Widget displayImageInCircularAvatar() {
  final auth = FirebaseAuth.instance;
  User? user = auth.currentUser;

  if (user == null) {
    // Handle the case when the user is not logged in or no image available
    return const CircleAvatar(
      backgroundColor: Colors.grey,
      radius: 50,
      child: Icon(
        Icons.person,
        size: 50,
        color: Colors.white,
      ),
    );
  }

  // Create a reference to the Firebase Storage bucket
  final storageRef =
  firebase_storage.FirebaseStorage.instance.ref().child('Profile');

  // Generate a unique file name using the user's UID
  final String fileName =
      user.uid;

  // Get the download URL of the uploaded/updated image
  Future<String?> getImageUrl() async {
    try {
      final imageUrl = await storageRef.child(fileName).getDownloadURL();
      return imageUrl;
    } catch (e) {
      if (kDebugMode) {
        print('Error getting image URL: $e');
      }
      return null;
    }
  }

  return FutureBuilder<String?>(
    future: getImageUrl(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // While waiting for the image URL, show a loading indicator
        return const CircularProgressIndicator();
      } else if (snapshot.hasError || snapshot.data == null) {
        // Handle errors when fetching the image URL
        return const CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 50,
          child: Icon(
            Icons.person,
            size: 50,
            color: Colors.white,
          ),
        );
      } else {
        // Display the image in the CircularAvatar once the URL is available
        return CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(snapshot.data!),
        );
      }
    },
  );
}
