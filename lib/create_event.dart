import 'package:flutter/material.dart';

class CreateEvent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateEventState();
}

class CreateEventState extends State<CreateEvent> {
  final Container _txtTitle = Container(
    margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
    decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: Colors.black87),
        borderRadius: BorderRadius.all(Radius.circular(10.0))),
    child: TextField(
      maxLines: null,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: "Title",
          contentPadding: EdgeInsets.all(10.0),
          border: InputBorder.none),
      autocorrect: false,
    ),
  );
  final Container _txtContent = Container(
    margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
    decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: Colors.black87),
        borderRadius: BorderRadius.all(Radius.circular(10.0))),
    child: TextField(
      maxLines: null,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: "Description",
          contentPadding: EdgeInsets.all(10.0),
          border: InputBorder.none),
      autocorrect: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _txtTitle,
        _txtContent,
      ],
    );
  }
}
