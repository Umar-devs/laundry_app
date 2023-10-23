
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../Utils/toast_message.dart';

void saveFragrance(fragrance){
  try{
    final User? user=FirebaseAuth.instance.currentUser;
    if(user!=null){
      final userId=user.uid;
      final databaseRef=FirebaseDatabase.instance.ref().child('Fragrances').child(userId);
      databaseRef.set({
        'Fragrance':fragrance,
      });
    }
  }
  catch(e){
    return Utils().toastMessage(e.toString());
  }
}