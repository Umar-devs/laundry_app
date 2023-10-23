
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:laundry_app/Utils/constants.dart';
import 'package:laundry_app/View/Pages/Components/reusable_text.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Services/upload_profile_pic.dart';
import '../../../Utils/toast_message.dart';
import 'Components/profile_image.dart';
import 'Components/user_details.dart';
import 'package:get/get.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key,  this.wantBottomNav=false});
  final bool wantBottomNav;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // final auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    fetchAndSetUserName();
  }

final GetNameController nameController=Get.put(GetNameController());
  //
  bool wantImg = false;
  File? _image;
  final picker = ImagePicker();
  Future getImageFromGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      return;
    }
  }

  String? image;
  int count = -1;
  @override
  Widget build(BuildContext context) {
    if (_image != null && count == -1) {
      count == -1
          ? {
              uploadImageToFirebaseStorageAndDatabase(_image!),
            }
          : count == 0
              ? {updateImageOnFirebaseStorageAndDatabase(_image!)}
              : null;
      count++;
    }
    return Stack(
      children: [
        Positioned(
          top: 0,
          child: Container(
            height: screenHeight,
            width: screenWidth,
            color:backgroundColor,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight*0.1,),
                  ReusableText(weight: FontWeight.w600, fontSize: screenWidth*0.06, lbl: 'Profile'),
                  //Profile
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.1),
                      child: GestureDetector(
                        onTap: () {
                          getImageFromGallery();
                          count = -1;
                        },
                        child: ProfileImage(),
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: screenWidth * 0.1),
                    child: ReusableText(
                      weight: FontWeight.w400,
                      fontSize: screenWidth * 0.035,
                      clr: Colors.black,
                      lbl: 'Tap to change profile pic',
                    ),
                  ),
                  SizedBox(
                    width: screenWidth,
                    height: screenWidth * 0.85,
                    child:
                    UserDetails( ),

                  ),

                ],
              ),
            ),
          ),
        ),

      ],
    );

  }

}
void fetchAndSetUserName() async {
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
          final String name = userData['firstName'] ?? '';

          final GetNameController nameController=Get.put(GetNameController());
          nameController.updateName(name);
        }
      });
    }
  } catch (e) {
    Utils().toastMessage('Error fetching user data: $e');
  }
}
class GetNameController extends GetxController{
  final RxString name=''.obs;
  void updateName(String newName){
    name.value=newName;
  }
}