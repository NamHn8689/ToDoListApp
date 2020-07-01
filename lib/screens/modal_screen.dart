import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../bloc/task_bloc.dart';
import '../event/add_task_event.dart';
import '../event/edit_task_event.dart';
import '../model/task.dart';

class ModalScreen extends StatefulWidget {
  ModalScreen(this.id, this.isEditMode);

  String id;
  bool isEditMode;

  @override
  State<StatefulWidget> createState() => ModalScreenState();
}

class ModalScreenState extends State<ModalScreen> {
  TimeOfDay _selectedTime;
  DateTime _selectedDate;
  String _inputDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Title",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                  fontSize: 22)),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Describe your task'),
            initialValue: _inputDescription,
            onChanged: (value) => _inputDescription = value,
          ),
          const SizedBox(height: 20),
          const Text("Date",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                  fontSize: 22)),
          TextFormField(
            onTap: _pickDueDate,
            readOnly: true,
            decoration: InputDecoration(
              hintText: _selectedDate == null
                  ? (!widget.isEditMode
                      ? 'Provide date'
                      : 'Enter due date again')
                  : DateFormat.yMMMd().format(_selectedDate).toString(),
            ),
          ),
          const SizedBox(height: 20),
          const Text("Time",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                  fontSize: 22)),
          TextFormField(
            onTap: _pickDueTime,
            readOnly: true,
            decoration: InputDecoration(
              hintText: _selectedTime == null
                  ? (!widget.isEditMode
                      ? 'Provide time'
                      : 'Enter due time again')
                  : _selectedTime.format(context),
            ),
          ),
          const SizedBox(height: 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  splashColor: Colors.white,
                  color: const Color(0xFF21242E),
                  onPressed: () => _savePressed(context),
                  child: Text(!widget.isEditMode ? 'Add task' : 'Edit Task',
                      style: const TextStyle(color: Colors.blue, fontSize: 20)),
                ),
              ),
            ],
          ),

//          Container(
//            alignment: Alignment.bottomRight,
//            child: Container(
//              decoration: BoxDecoration(
//                  border: Border.all(width: 1.5, color: Colors.black54),
//                  borderRadius: const BorderRadius.all(Radius.circular(8))),
//              child: FlatButton(
//                onPressed: () => _savePressed(context),
//                child: Text(
//                  !widget.isEditMode ? 'Add task' : 'Edit Task',
//                  style: TextStyle(
//                      color: Theme.of(context).accentColor,
//                      fontSize: 22,
//                      fontWeight: FontWeight.bold),
//                ),
//              ),
//            ),
//          )
        ],
      ),
    );
  }

  void _pickDueDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2030))
        .then((date) {
      if (date == null) {
        return;
      }
      date = date;
      setState(() => _selectedDate = date);
    });
  }

  void _pickDueTime() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((time) {
      if (time == null) {
        return;
      }
      setState(() => _selectedTime = time);
    });
  }

  void _savePressed(context) {
    if (_inputDescription == null) {
      return;
    }
    final task = Task(
        widget.id,
        _inputDescription,
        DateFormat.yMMMd().format(_selectedDate).toString(),
        _selectedTime.format(context));
    if (widget.isEditMode) {
      Provider.of<TaskBloc>(context, listen: false)
          .event
          .add(EditTaskEvent(task));
    } else {
      Provider.of<TaskBloc>(context, listen: false)
          .event
          .add(AddTaskEvent(task));
    }
    Navigator.of(context).pop();
//    setState(() {});
  }
}
