import 'package:flutter/material.dart';
import 'package:todo_list_2/screens/modal_screen.dart';
import 'package:todo_list_2/screens/task_list_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
        actions: <Widget>[],
      ),
      body: TaskList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            context: context,
//            builder: (_) => TaskScreen(isEditMode: false),
            builder: (_) => ModalScreen(DateTime.now().toString(), false),
          );
        },
        tooltip: 'Add a new item!',
      ),
    );
  }
}
