import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../Utils/toast_message.dart';

void saveSlot(String slot){
  try{
    final User? user=FirebaseAuth.instance.currentUser;
    if(user!=null){
      final userId=user.uid;
      final databaseRef=FirebaseDatabase.instance.ref().child('Time Slot').child(userId);
      databaseRef.set({
        'Selected Slot':slot
      });
    }
  }
  catch(e){
    Utils().toastMessage(e.toString());
  }
}
void saveDropOffSlot(String slot){
  try{
    final User? user=FirebaseAuth.instance.currentUser;
    if(user!=null){
      final userId=user.uid;
      final databaseRef=FirebaseDatabase.instance.ref().child('Drop Off Time Slot').child(userId);
      databaseRef.set({
        'Slot':slot
      });
    }
  }
  catch(e){
    Utils().toastMessage(e.toString());
  }
}