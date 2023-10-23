
import 'package:get/get.dart';

class SavePayIntentController extends GetxController{
  RxString payIntent=''.obs;
  void getPayIntent(intent){
    payIntent.value=intent;
  }
}