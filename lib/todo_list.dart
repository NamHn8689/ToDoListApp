import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ToDoListState();
}

class ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 3.0),
            decoration: BoxDecoration(
                border: Border.all(width: 1.5, color: Colors.black54),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: ListTile(
              title: Text("AAA"), //////////
              trailing: GestureDetector(
                child: Icon(
                  Icons.delete,
                  color: Colors.black87,
                ),
                onTap: () => print("Delete"),
              ),
            ),
          );
        });
  }
}
