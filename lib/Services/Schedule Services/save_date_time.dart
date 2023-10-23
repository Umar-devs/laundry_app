

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../Utils/toast_message.dart';

saveDate(day,month,year){
  try{
final User?user=FirebaseAuth.instance.currentUser;
if(user!=null){
  final userId=user.uid;
  final databaseRef=FirebaseDatabase.instance.ref().child('Date').child(userId);
  databaseRef.set({
    'Day':day,
    'Month':month,
    'Year':year,
  });
}
  }
  catch(e){
    Utils().toastMessage(e.toString());
  }
}
saveDropOffDate(day,month,year){
  try{
final User?user=FirebaseAuth.instance.currentUser;
if(user!=null){
  final userId=user.uid;
  final databaseRef=FirebaseDatabase.instance.ref().child('Drop Date').child(userId);
  databaseRef.set({
    'Day':day,
    'Month':month,
    'Year':year,
  });
}
  }
  catch(e){
    Utils().toastMessage(e.toString());
  }
}