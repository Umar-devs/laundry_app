

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../Utils/toast_message.dart';

void saveNote(String notesMessage){
  final User? user=FirebaseAuth.instance.currentUser;
  if(user!=null){
    try{
      final String userId=user.uid;
      final databaseRef=FirebaseDatabase.instance.ref().child('Notes').child(userId);
      databaseRef.set({
        'Note':notesMessage
      }).then((value) => Utils().toastMessage('Saved Successfully!'));
    }
    catch(e){
      return Utils().toastMessage(e.toString());
    }
  }
}