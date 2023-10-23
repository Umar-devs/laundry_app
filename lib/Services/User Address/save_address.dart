

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../Utils/toast_message.dart';

saveAddress(lane1,lane2,country,city,postCode){
  try{
    final User? user=FirebaseAuth.instance.currentUser;
    if(user!=null){
      final userId=user.uid;
      final databaseRef=FirebaseDatabase.instance.ref().child('Address').child(userId);
      databaseRef.set({
        'Lane 1':lane1,
        'Lane 2':lane2,
        'County':country,
        'City':city,
        'Post Code':postCode,
      }).then((value) => Utils().toastMessage('Address Saved'));
    }
  }
  catch(e){
    return Utils().toastMessage(e.toString());
  }
}