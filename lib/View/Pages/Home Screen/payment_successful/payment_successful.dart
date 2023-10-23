import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Controller/Package Selected/fetch_package_selected.dart';
import '../../../../Controller/Date Time Controller/date_time_controller.dart';
import '../../../../Controller/Fragrance&Detergent Controller/fetch_fragrance_detergent.dart';
import '../../../../Controller/Notes Controller/notes_controller.dart';
import '../../../../Controller/User Address/user_address_controller.dart';
import '../../../../Controller/save_pay_intent.dart';
import '../../../../Services/Fetch Notes/fetch_notes.dart';
import '../../../../Services/Manage Orders/place_orders.dart';
import '../../../../Services/Schedule Services/fetch_date_time.dart';
import '../../../../Services/Set & Fetch Detergents And Fragrances/fetch_fragrance_detergent.dart';
import '../../../../Utils/constants.dart';
import '../../Components/custom_btn.dart';
import '../../Components/reusable_text.dart';
import '../Components/bottom_nav_bar.dart';
import 'components/details_showing_box.dart';
import 'components/notes_box.dart';
import 'components/top_round_img.dart';

class PaymentSuccessfulScreen extends StatefulWidget {
  const PaymentSuccessfulScreen({super.key});

  @override
  State<PaymentSuccessfulScreen> createState() =>
      _PaymentSuccessfulScreenState();
}

class _PaymentSuccessfulScreenState extends State<PaymentSuccessfulScreen> {
  @override
  void initState() {
    super.initState();
    fetchDateTime();
    fetchFragrance();
    fetchDetergent();
    fetchDropOffDateTime();
    fetchNotes();
    fetchPackageSelectedController.packageName.value == "Basic"
        ? price = '£49.99'
        : fetchPackageSelectedController.packageName.value == "Pro"
            ? price = '£59.99'
            : price = '£69.99';
  }

  final FetchPackageSelectedController fetchPackageSelectedController =
      Get.put(FetchPackageSelectedController());
  final FragranceDetergentController fragranceDetergentController =
      Get.put(FragranceDetergentController());
  final DropOffDateTimeController dropOffDateTimeController =
      Get.put(DropOffDateTimeController());
  final NotesController notesController = Get.put(NotesController());
  final DateTimeController dateTimeController = Get.put(DateTimeController());
  final SavePayIntentController payIntentController=Get.put(SavePayIntentController());
  String price = '';
  String order = '';
  final UserAddressController userAddressController=Get.put(UserAddressController());
  @override
  Widget build(BuildContext context) {
    OrderService().placeOrder(
        fetchPackageSelectedController.packageName.value,
        fragranceDetergentController.fragrance.value,
        fragranceDetergentController.detergent.value,
        dateTimeController.timeFetched.value,
        dateTimeController.dateFetched.value,
        dropOffDateTimeController.dateFetched.value,
        dropOffDateTimeController.timeFetched.value,
        notesController.notesAdded.value,
        payIntentController.payIntent.value,
        userAddressController.completeAddress.value,
        price);
    return Container(
      height: screenHeight,
      width: screenWidth,
      color: const Color(0xfff2f1f2),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const PageScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.01,
            ),
            const TopRoundImage(),
            ReusableText(
              weight: FontWeight.w600,
              fontSize: screenWidth * 0.045,
              lbl: 'Payment Successful',
              clr: themeColor,
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Obx(() => DetailsShowingBox(
                  packageName: fetchPackageSelectedController.packageName.value,
                  pickDate: dateTimeController.dateFetched.value,
                  pickTime: dateTimeController.timeFetched.value,
                  price: price,
                  fragrance: fragranceDetergentController.fragrance.value,
                  detergent: fragranceDetergentController.detergent.value,
                  dropDate: dropOffDateTimeController.dateFetched.value,
                  dropTime: dropOffDateTimeController.timeFetched.value,
                )),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            NotesBox(
              notesValue: notesController.notesAdded.value,
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            CustomBtn(
              btnHeight: screenHeight * 0.05,
              btnWidth: screenWidth * 0.5,
              onTapFunction: () {
                Get.to(const MyBottomNavBar(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 700));
              },
              txtWeight: FontWeight.w600,
              txtFontSize: screenWidth * 0.035,
              lbl: 'Home',
            )
          ],
        ),
      ),
    );
  }
}
