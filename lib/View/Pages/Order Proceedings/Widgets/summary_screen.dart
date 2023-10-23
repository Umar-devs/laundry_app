import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:laundry_app/View/Pages/Order%20Proceedings/Widgets/summary_package_info_row.dart';
import 'package:laundry_app/View/Pages/Order%20Proceedings/Widgets/summary_schedule_row.dart';
import '../../../../Controller/Date Time Controller/date_time_controller.dart';
import '../../../../Controller/Fragrance&Detergent Controller/fetch_fragrance_detergent.dart';
import '../../../../Controller/Package Selected/fetch_package_selected.dart';
import '../../../../Controller/User Address/user_address_controller.dart';
import '../../../../Controller/payment_controller.dart';
import '../../../../Services/Save & Fetch Package/fetch_package_and_price.dart';
import '../../../../Services/Schedule Services/fetch_date_time.dart';
import '../../../../Services/Set & Fetch Detergents And Fragrances/fetch_fragrance_detergent.dart';
import '../../../../Utils/constants.dart';
import '../../../../Utils/toast_message.dart';
import '../../Components/reusable_text.dart';
import '../Reusable Components/dotted_img.dart';
import '../Reusable Components/selected_image_proceeding_bar.dart';
import '../Reusable Components/unselected_top_proceeding_bar.dart';
import 'order_pay_bar.dart';
import '../Reusable Components/back_icon.dart';

class SummaryTab extends StatefulWidget {
  const SummaryTab({super.key});

  @override
  State<SummaryTab> createState() => _SummaryTabState();
}

class _SummaryTabState extends State<SummaryTab> {
  final DateTimeController dateTimeController = Get.put(DateTimeController());
  final DropOffDateTimeController dropOffDateTimeController =
      Get.put(DropOffDateTimeController());
  final FetchPackageSelectedController fetchPackageSelectedController =
      Get.put(FetchPackageSelectedController());
  final FragranceDetergentController fragranceDetergentController =
      Get.put(FragranceDetergentController());
  final PaymentController paymentController = Get.put(PaymentController());
  final UserAddressController userAddressController =
      Get.put(UserAddressController());
  double price = 0;
  @override
  void initState() {
    fetchDateTime();
    fetchPackage();
    fetchPrice();
    fetchDetergent();
    fetchFragrance();
    fetchDropOffDateTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fetchPackageSelectedController.packageName.value == "Basic"
        ? price = 49.99
        : fetchPackageSelectedController.packageName.value == "Pro"
            ? price = 59.99
            : price = 69.99;
    return Container(
      height: screenHeight,
      width: screenWidth,
      color: backgroundColor,
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: Row(
                  children: [
                    const BackIcon(),
                    SizedBox(
                      width: screenWidth * 0.25,
                    ),
                    ReusableText(
                      weight: FontWeight.w600,
                      fontSize: screenWidth * 0.05,
                      lbl: 'Summary',
                      clr: const Color(0xff05307d),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              SizedBox(
                height: screenHeight * 0.06,
                width: screenWidth,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.1,
                      ),
                      const UnselectedImage(
                          img: 'assets/images/schedule icon.png'),
                      const DottedImage(),
                      const UnselectedImage(
                          img: 'assets/images/instruction icon.png'),
                      const DottedImage(),
                      const UnselectedImage(
                          img: 'assets/images/address icon.png'),
                      const DottedImage(),
                      const SelectedImg(
                        img: 'assets/images/summary white.png',
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
            ],
          ),
          Positioned(
              top: screenHeight * 0.25,
              left: screenWidth * 0.05,
              child: Column(
                children: [
                  Container(
                    height: screenHeight * 0.3,
                    width: screenWidth * 0.9,
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.05,
                      right: screenWidth * 0.03,
                      top: screenHeight * 0.01,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: const Offset(1, 1))
                        ],
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ReusableText(
                            weight: FontWeight.w600,
                            fontSize: screenWidth * 0.04,
                            lbl: 'Scheduling Details'),
                        Obx(() => SummaryScheduleRow(
                              title: 'Address',
                              subTitle: userAddressController.completeAddress
                                  .toString(),
                              icon: FontAwesomeIcons.home,
                            )),
                        Divider(
                          color: Colors.grey.shade200,
                        ),
                        Obx(() => SummaryScheduleRow(
                              title: 'PickUp',
                              subTitle:
                                  '${dateTimeController.dateFetched.value.toString()} At ${dateTimeController.timeFetched.value.toString()}',
                              icon: FontAwesomeIcons.clock,
                            )),
                        Divider(
                          color: Colors.grey.shade200,
                        ),
                        Obx(() => SummaryScheduleRow(
                              title: 'DropOff',
                              subTitle:
                                  '${dropOffDateTimeController.dateFetched.value.toString()} At ${dropOffDateTimeController.timeFetched.value.toString()}',
                              icon: FontAwesomeIcons.clock,
                            )),
                        SizedBox(
                          height: screenHeight * 0.01,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Container(
                    height: screenHeight * 0.27,
                    width: screenWidth * 0.9,
                    padding: EdgeInsets.only(
                        top: screenHeight * 0.01,
                        bottom: screenHeight * 0.01,
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: const Offset(1, 1))
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ReusableText(
                            weight: FontWeight.w600,
                            fontSize: screenWidth * 0.04,
                            lbl: 'Package Details'),
                        Obx(() => SummaryPackageInfoRow(
                              title: 'Package',
                              subTitle: fetchPackageSelectedController
                                  .packageName.value
                                  .toString(),
                            )),
                        Divider(
                          color: Colors.grey.shade100,
                        ),
                        Obx(() => SummaryPackageInfoRow(
                              title: 'Price',
                              subTitle: fetchPackageSelectedController
                                  .priceOfPackage.value,
                            )),
                        Divider(
                          color: Colors.grey.shade100,
                        ),
                        Obx(() => SummaryPackageInfoRow(
                              title: 'Detergent',
                              subTitle:
                                  fragranceDetergentController.detergent.value,
                            )),
                        Divider(
                          color: Colors.grey.shade100,
                        ),
                        Obx(
                          () => SummaryPackageInfoRow(
                            title: 'Fragrance',
                            subTitle:
                                fragranceDetergentController.fragrance.value,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
          Positioned(
              bottom: 0,
              child: PayOrderBar(
                // priceSelected: fetchPackageSelectedController.priceOfPackage.value,
                tap: () {
                  Utils().toastMessage('Working..');
                  paymentController.makePayment(fetchPackageSelectedController
                              .priceOfPackage.value ==
                          '£49.99'
                      ? '4999'
                      : fetchPackageSelectedController.priceOfPackage.value ==
                              '£59.99'
                          ? '5999'
                          : '6999');
                },
              ))
        ],
      ),
    );
  }
}
