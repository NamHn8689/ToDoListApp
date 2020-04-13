import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CalendarTabState();
}

class CalendarTabState extends State<CalendarTab> {
  CalendarController _controller;

  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  void addEvents() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 3.0),
          decoration: BoxDecoration(
              border: Border.all(width: 1.5, color: Colors.black87),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: TableCalendar(
            calendarController: _controller,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
                todayStyle: TextStyle(fontSize: 20.0, color: Colors.white),
                todayColor: Colors.deepOrangeAccent,
                selectedColor: Colors.lightBlue),
            onDaySelected: (date,events){
              print(date.toIso8601String());//////////////////////////////////
            },
          ),
        ),
        floatingActionButton: Container(
          height: 50.0,
          child: FloatingActionButton(
            onPressed: addEvents,
//        tooltip: 'Increment',
            child: Icon(
              Icons.add,
            ),
          ),
        ));
  }
}
