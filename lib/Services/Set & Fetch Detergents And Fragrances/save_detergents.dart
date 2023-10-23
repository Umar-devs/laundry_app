

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../Utils/toast_message.dart';


saveDetergent(detergent){
  try{
    final User? user =FirebaseAuth.instance.currentUser;
    if(user!=null){
      final userId=user.uid;
      final databaseRef=FirebaseDatabase.instance.ref().child('Detergent').child(userId);
      databaseRef.set({
        'Detergent':detergent,
      });
    }
  }catch(e){
    return Utils().toastMessage(e.toString());

  }
}