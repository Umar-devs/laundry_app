import 'package:get/get.dart';

class NotesController extends GetxController{
  RxString notesAdded=''.obs;
  void manageNotes(note){
    notesAdded.value=note;
  }
}