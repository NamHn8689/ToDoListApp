import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todolist_app/create_event.dart';

import 'todo_list.dart';

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

  void _addEvents() {
    final pageRoute = new MaterialPageRoute(builder: (context) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Add task'),
          ),
          body: CreateEvent());
    });
    Navigator.of(context).push(pageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
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
              onDaySelected: (date, events) {
                print(date.month.toString());
              },

            ),
          ),
          Expanded(
            child: ToDoList(),
          ),
        ],
      ),
      floatingActionButton: Container(
        height: 50.0,
        child: FloatingActionButton(
          onPressed: _addEvents,
          //tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
