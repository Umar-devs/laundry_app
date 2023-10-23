import 'package:get/get.dart';

class DateTimeController extends GetxController{
  RxString dateFetched=''.obs;
  RxString timeFetched=''.obs;
  void setDate(pickUpDate,pickUpDay,pickUpMonth){
    dateFetched.value='$pickUpDate $pickUpMonth $pickUpDay';
  }
  void setTime(pickUpTime){
    timeFetched.value=pickUpTime;
  }

}
class DropOffDateTimeController extends GetxController{
  RxString dateFetched=''.obs;
  RxString timeFetched=''.obs;
  void setDropOffDate(pickUpDate,pickUpDay,pickUpMonth){
    dateFetched.value='$pickUpDate $pickUpMonth $pickUpDay';
  }
  void setDropOffTime(pickUpTime){
    timeFetched.value=pickUpTime;
  }

}