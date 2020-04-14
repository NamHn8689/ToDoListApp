import 'package:flutter/material.dart';
import 'todo_list.dart';
import 'package:todolist_app/calendar_tab.dart';

import 'tab1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabsController = DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("These are tabs"),

            bottom: TabBar(
//                indicatorColor: Colors.red,//tab onpessed
              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    Icons.event_note,
                    size: 28.0,
                  ),
                  text: 'Calendar',
                ),
                Tab(
                  icon: Icon(
                    Icons.notifications,
                    size: 28.0,
                  ),
                  text: 'Event',
                ),
              ],
            ),
          ),
          body: TabBarView(children: [CalendarTab(), Tab1()]),
        ));
    return MaterialApp(
      title: '',
      home: tabsController,
    );
  }
}
