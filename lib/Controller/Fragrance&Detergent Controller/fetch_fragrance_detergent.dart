import 'package:get/get.dart';

class FragranceDetergentController extends GetxController {
  RxString fragrance = ''.obs;
  RxString detergent = ''.obs;
  void fetchFragrance(value) {
    fragrance.value = value;
  }

  void fetchDetergent(value) {
    detergent.value = value;
  }
}
