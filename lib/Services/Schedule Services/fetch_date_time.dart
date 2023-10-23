

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../../Controller/Date Time Controller/date_time_controller.dart';
import '../../Utils/toast_message.dart';

fetchDateTime(){
  try{
    final User? user=FirebaseAuth.instance.currentUser;
    if(user!=null){
     final userId=user.uid;
     final databaseRef=FirebaseDatabase.instance.ref().child('Date').child(userId);
     databaseRef.onValue.listen((event) {
       DataSnapshot dataSnapshot=event.snapshot;
       Map<dynamic, dynamic> userData=dataSnapshot.value as Map<dynamic,dynamic>;
       String day = '';
       String month = '';
       String year = '';
       final DateTimeController dateTimeController=Get.put(DateTimeController());
       final String dayFetched = userData['Day'] ?? '';
       final String monthFetched  = userData['Month'] ?? '';
       final String yearFetched  = userData['Year'] ?? '';
       day=dayFetched;
       month=monthFetched;
       year=yearFetched;

       dateTimeController.setDate(day, month, year);
          });
    }
  }
  catch(e){
    return Utils().toastMessage(e.toString());
  }

  try{
    final User?user=FirebaseAuth.instance.currentUser;
    if(user!=null){
      final userId=user.uid;
      final databaseRef=FirebaseDatabase.instance.ref().child('Time Slot').child(userId);
      databaseRef.onValue.listen((event) {
        DataSnapshot snapshot=event.snapshot;
        Map<dynamic,dynamic>  userData=snapshot.value as Map<dynamic,dynamic>;
        String slot='';
        final DateTimeController controller=Get.put(DateTimeController());
        final String timeSlot=userData['Selected Slot']??'';
        slot=timeSlot;
        controller.setTime(slot);

      });
    }
  }
  catch(e){
    return Utils().toastMessage(e.toString());
  }
}
fetchDropOffDateTime(){
  try{
    final User? user=FirebaseAuth.instance.currentUser;
    if(user!=null){
     final userId=user.uid;
     final databaseRef=FirebaseDatabase.instance.ref().child('Drop Date').child(userId);
     databaseRef.onValue.listen((event) {
       DataSnapshot dataSnapshot=event.snapshot;
       Map<dynamic, dynamic> userData=dataSnapshot.value as Map<dynamic,dynamic>;
       String day = '';
       String month = '';
       String year = '';
       final DropOffDateTimeController dropOffDateTimeController=Get.put(DropOffDateTimeController());
       final String dayFetched = userData['Day'] ?? '';
       final String monthFetched  = userData['Month'] ?? '';
       final String yearFetched  = userData['Year'] ?? '';
       day=dayFetched;
       month=monthFetched;
       year=yearFetched;

       dropOffDateTimeController.setDropOffDate(day, month, year);
          });
    }
  }
  catch(e){
    return Utils().toastMessage(e.toString());
  }

  try{
    final User?user=FirebaseAuth.instance.currentUser;
    if(user!=null){
      final userId=user.uid;
      final databaseRef=FirebaseDatabase.instance.ref().child('Drop Off Time Slot').child(userId);
      databaseRef.onValue.listen((event) {
        DataSnapshot snapshot=event.snapshot;
        Map<dynamic,dynamic>  userData=snapshot.value as Map<dynamic,dynamic>;
        String slot='';
        final DropOffDateTimeController controller=Get.put(DropOffDateTimeController());
        final String timeSlot=userData['Slot']??'';
        slot=timeSlot;
        controller.setDropOffTime(slot);

      });
    }
  }
  catch(e){
    return Utils().toastMessage(e.toString());
  }
}