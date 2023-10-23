// import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../Utils/constants.dart';
import '../Components/reusable_text.dart';
import '../Home Screen/Components/bottom_nav_bar.dart';
import 'Tab bar View/active_orders.dart';
import 'Tab bar View/cancelled_orders.dart';
import 'Tab bar View/completed_orders.dart';


class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final DatabaseReference databaseRef =
      FirebaseDatabase.instance.ref().child('Orders List');
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 15, top: screenHeight * 0.02),
            child: GestureDetector(
                onTap: () {
                  Get.to(const MyBottomNavBar(),
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 700));
                },
                child: FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.white,
                  size: screenWidth * 0.05,
                )),
          ),
          title: ReusableText(
            weight: FontWeight.w600,
            fontSize: screenWidth * 0.04,
            lbl: 'Orders Screen',
            clr: Colors.white,
          ),
          centerTitle: true,
          backgroundColor: themeColor,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                child: ReusableText(
                    weight: FontWeight.w600,
                    fontSize: screenWidth * 0.03,
                    clr: Colors.white,
                    lbl: 'Active'),
              ),
              Tab(
                child: ReusableText(
                    weight: FontWeight.w600,
                    fontSize: screenWidth * 0.03,
                    clr: Colors.white,
                    lbl: 'Completed'),
              ),
              Tab(
                child: ReusableText(
                    weight: FontWeight.w600,
                    fontSize: screenWidth * 0.03,
                    clr: Colors.white,
                    lbl: 'Cancelled'),
              ),
            ],
          ),
        ),
        body:  const TabBarView(
          children: [
            ActiveOrdersView(),
            CompletedOrdersView(),
            CancelledOrdersView(),
          ],
        ),
      ),
    );
  }
}
