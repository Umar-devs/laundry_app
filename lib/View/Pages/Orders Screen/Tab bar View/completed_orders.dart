// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/constants.dart';
import '../../Components/reusable_text.dart';
import '../Components/details_screen.dart';

class CompletedOrdersView extends StatefulWidget {
  const CompletedOrdersView({super.key});

  @override
  State<CompletedOrdersView> createState() => _CompletedOrdersViewState();
}

class _CompletedOrdersViewState extends State<CompletedOrdersView> {
  final DatabaseReference databaseRef =
      FirebaseDatabase.instance.ref().child('Orders List');
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final userId = user?.uid;
    return StreamBuilder(
      stream: databaseRef.orderByChild('status').equalTo('Completed').onValue,
      builder: (
          context,
          snap,
          ) {
        if (snap.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: themeColor,
            ),
          );
        } else {
          if (snap.hasData &&
              !snap.hasError &&
              snap.data?.snapshot.value != null) {
            Map<dynamic, dynamic>? data =
            snap.data?.snapshot.value as Map<dynamic, dynamic>?;
            List<Map<String, dynamic>> filteredItems = [];
            data?.forEach((index, data) {
              if (data is Map &&
                  data.containsKey('userId') &&
                  data['userId'] == userId) {
                filteredItems.add({"key": index, ...data});
              }
            });

            return filteredItems.isEmpty? Center(
                child: ReusableText(
                    weight: FontWeight.w500,
                    fontSize: screenWidth * 0.04,
                    clr: Colors.black,
                    lbl: 'No Data')): ListView.builder(
// reverse: true,
              scrollDirection: Axis.vertical,
              itemCount:filteredItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10),
                      title: Row(
                        children: [
                          ReusableText(
                            fontSize: screenWidth * 0.035,
                            weight: FontWeight.w700,
                            clr: Colors.black,
                            lbl: filteredItems[index]['package'],
                          ),
                          ReusableText(
                            fontSize: 10,
                            weight: FontWeight.w400,
                            clr: Colors.black,
                            lbl: '(${filteredItems[index]['price']})',
                          ),
                        ],
                      ),
// Text('Order Key ${item[index]['key']}'), for key
                      subtitle: ReusableText(
                        fontSize: screenWidth * 0.03,
                        weight: FontWeight.w500,
                        clr: Colors.black,
                        alignTxt: TextAlign.start,
                        lbl: filteredItems[index]['time of order place'],
                      ),
                      trailing: Container(
                        height: screenHeight * 0.035,
                        width: screenWidth * 0.2,
                        decoration: BoxDecoration(
                            color: themeColor,
                            borderRadius: BorderRadius.circular(7)),
                        child: Center(
                          child: ReusableText(
                            fontSize: screenWidth * 0.03,
                            weight: FontWeight.w500,
                            clr: Colors.white,
                            lbl: 'Details',
                          ),
                        ),
                      ),
                      onTap: () {
                        Get.to(
                            DetailScreen(
                              status: filteredItems[index]['status'],
                              package: filteredItems[index]['package'],
                              pickDate: filteredItems[index]['pickDate'],
                              pickTime: filteredItems[index]['pickTime'],
                              dropDate: filteredItems[index]['dropDate'],
                              dropTime: filteredItems[index]['dropTime'],
                              fragrance: filteredItems[index]['fragrance'],
                              detergent: filteredItems[index]['detergent'],
                              ind: filteredItems[index]['key'],
                              payInt: filteredItems[index]['datetimeEtc'],
                              notes: filteredItems[index]['notes'],
                              subtotal: filteredItems[index]['price'],
                              address: filteredItems[index]['address'],
                              userID: filteredItems[index]['userId'],
                              orderTime: filteredItems[index]
                              ['time of order place'],
                              firstStatusTitle: 'Active',
                              secStatusTitle: 'Cancel',
                              firstBtnTitle: 'Active Order',
                              secBtnTitle: 'Cancel Order',
                            ),
                            duration: const Duration(milliseconds: 700),
                            transition: Transition.fadeIn);
                      },
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
                child: ReusableText(
                  fontSize: screenWidth * 0.04,
                  weight: FontWeight.w700,
                  clr: Colors.black,
                  lbl: 'No data',
                ));
          }
        }
      },
    );
  }
}
