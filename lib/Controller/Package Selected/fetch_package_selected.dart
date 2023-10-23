import 'package:get/get.dart';

class FetchPackageSelectedController extends GetxController{
  RxString packageName=''.obs;
  RxString priceOfPackage=''.obs;
  void controlValue(String selectedHouseHold){
    packageName.value=selectedHouseHold;
  }
  void controlPrice(String price){
    priceOfPackage.value=price;
  }
}