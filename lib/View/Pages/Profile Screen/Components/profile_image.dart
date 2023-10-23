// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../Utils/constants.dart';

// import '../../../../Utils/constants.dart';
// import 'package:laundary_app_final/View/Pages/Profile Screen/profile_screen.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
class ProfileImage extends StatefulWidget {
    ProfileImage({super.key, this.image});
 late  String? image;

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  Future<String?> getImageUrl() async {
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    // Create a reference to the Firebase Storage bucket
    final storageRef =
    firebase_storage.FirebaseStorage.instance.ref().child('Profile');

    // Generate a unique file name using the user's UID
    final String? fileName = user?.uid;

    try {
      final imageUrl = await storageRef.child(fileName!).getDownloadURL();
      return widget.image = imageUrl;
    } catch (e) {
      if (kDebugMode) {
        print('Error getting image URL: $e');
      }
      return null;
    }
  }
@override
void initState(){
    super.initState();
    getImageUrl();
}
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
        future: getImageUrl(),
        builder: (context, snapshot) {
          return widget.image == null
              ? snapshot.connectionState ==
              ConnectionState.waiting
              ? CircleAvatar(
            radius: screenWidth * 0.14,
            backgroundColor: Colors.white,
            child: const CircularProgressIndicator(),
          )
              : CircleAvatar(
            radius: screenWidth * 0.14,
            backgroundColor: Colors.black12,
            child: const Icon(Icons.image),
          )
              : snapshot.connectionState ==
              ConnectionState.waiting
              ? CircleAvatar(
            radius: screenWidth * 0.14,
            backgroundColor: Colors.white70,
            child: const CircularProgressIndicator(),
          )
              : CircleAvatar(
            radius: screenWidth * 0.14,
            backgroundImage: NetworkImage(widget.image!),
            backgroundColor: Colors.white,
          );
        });
  }
}
