import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../Services/Schedule Services/save_date_time.dart';
import '../../../../Utils/constants.dart';

class HomeCalendarPage extends StatefulWidget {
  const HomeCalendarPage({super.key, this.pickUp = true});
  final bool pickUp;
  @override
  State<HomeCalendarPage> createState() => _HomeCalendarPageState();
}

class _HomeCalendarPageState extends State<HomeCalendarPage> {
  // CalendarController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = CalendarController();
  }

  DateTime _selectedDay = DateTime.utc(2023, 1, 1);
  DateTime _focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * 0.9,
      height: screenHeight * 0.5,
      child: Card(
        elevation: 1,
        color: Colors.white,
        child: TableCalendar(
          calendarFormat: CalendarFormat.twoWeeks,
          calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(50)),
              selectedDecoration: const BoxDecoration(color: Colors.green),
              todayTextStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth * 0.04,
                  color: Colors.black)),
          headerStyle: HeaderStyle(
            headerMargin: EdgeInsets.only(
                left: screenWidth * 0.1, right: screenWidth * 0.1),
            formatButtonDecoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.circular(22.0),
            ),
            formatButtonTextStyle: const TextStyle(color: Colors.white),
            formatButtonShowsNext: false,
            formatButtonVisible: false,
          ),
          startingDayOfWeek: StartingDayOfWeek.monday,
          calendarBuilders: CalendarBuilders(
            selectedBuilder: (context, date, events) => Container(
                margin: const EdgeInsets.all(6.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: themeColor, borderRadius: BorderRadius.circular(50)),
                child: Text(
                  date.day.toString(),
                  style: const TextStyle(color: Colors.white),
                )),
            holidayBuilder: (context, date, events) => Container(
                margin: const EdgeInsets.all(5.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8.0)),
                child: Text(
                  date.day.toString(),
                  style: const TextStyle(color: Colors.white),
                )),
          ),
          focusedDay: _focusedDay,
          firstDay: DateTime.utc(2023, 1, 01),
          lastDay: DateTime.utc(2030, 1, 1),
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay; // update `_focusedDay` here as well
              widget.pickUp
                  ? saveDate(
                      _selectedDay.day.toString(),
                      _selectedDay.month.toString(),
                      _selectedDay.year.toString())
                  : saveDropOffDate(
                      _selectedDay.day.toString(),
                      _selectedDay.month.toString(),
                      _selectedDay.year.toString(),
                    );
              if (kDebugMode) {
                print(_selectedDay.toString());
              }
            });
          },
        ),
      ),
    );
  }
}
