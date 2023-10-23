
import 'package:get/get.dart';

class UserAddressController extends GetxController{
  RxString completeAddress=''.obs;
  RxString firstLane=''.obs;
  RxString secLane=''.obs;
  RxString city=''.obs;
  RxString county=''.obs;
  RxString postCode=''.obs;
  void getAddress(lanes,countryName,userPostalCode,townOrCity,lane1, lane2){
    completeAddress.value='$lanes $townOrCity\n$countryName $userPostalCode ';
    firstLane.value=lane1;
    secLane.value=lane2;
    city.value=townOrCity;
    county.value=countryName;
    postCode.value=userPostalCode;
  }

}