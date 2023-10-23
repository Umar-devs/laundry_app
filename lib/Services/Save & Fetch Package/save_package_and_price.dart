

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../Utils/toast_message.dart';

savePackage(package){
  try{
    final User? user =FirebaseAuth.instance.currentUser;
    if(user!=null){
      final userId=user.uid;
      final databaseRef=FirebaseDatabase.instance.ref().child('Package').child(userId);
      databaseRef.set({
        'Package':package,
      });
    }
  }
  catch(e){
    Utils().toastMessage(e.toString());
  }
}
savePrice(price){
  try{
    final User? user =FirebaseAuth.instance.currentUser;
    if(user!=null){
      final userId=user.uid;
      final databaseRef=FirebaseDatabase.instance.ref().child('Price').child(userId);
      databaseRef.set({
        'Price':price,
      });
    }
  }
  catch(e){
    Utils().toastMessage(e.toString());
  }
}

