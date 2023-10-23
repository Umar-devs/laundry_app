// Custom Bottom Nav Bar
import 'package:flutter/material.dart';

import '../../../../Utils/constants.dart';
import '../../Orders Screen/order_screen.dart';
import '../../Profile Screen/profile_screen.dart';
import '../home_screen.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({
    super.key,
    this.selectedIndex = 0,
  });
  final int selectedIndex;
  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const OrdersScreen(),
    const ProfileScreen(),
  ];
  late int _selectedIndex;
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: screenWidth * 0.18,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            offset: const Offset(1, 0), // no shadow on top and left
            blurRadius: 1,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: IconButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
              icon: _selectedIndex == 0
                  ? Image.asset(
                      'assets/images/home (1) 1.png',
                      height: screenWidth * 0.08,
                      width: screenWidth * 0.08,
                    )
                  : Image.asset(
                      'assets/images/home (1) 1 (1).png',
                      height: screenWidth * 0.08,
                      width: screenWidth * 0.08,
                    ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: 8.0,
                right: screenWidth * 0.09,
                left: screenWidth * 0.09),
            child: IconButton(
              icon: _selectedIndex == 1
                  ? Image.asset(
                      'assets/images/icon _orders_.png',
                      height: screenWidth * 0.085,
                      width: screenWidth * 0.085,
                    )
                  : Image.asset(
                      'assets/images/icon _orders_ (1).png',
                      height: screenWidth * 0.085,
                      width: screenWidth * 0.085,
                    ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
              icon: _selectedIndex == 2
                  ? Image.asset(
                      'assets/images/Profile 1.png',
                      height: screenWidth * 0.08,
                      width: screenWidth * 0.08,
                    )
                  : Image.asset(
                      'assets/images/Profile 2.png',
                      height: screenWidth * 0.08,
                      width: screenWidth * 0.08,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
