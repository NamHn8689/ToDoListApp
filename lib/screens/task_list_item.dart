import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/task_bloc.dart';
import '../event/delete_task_event.dart';
import '../model/task.dart';
import 'modal_screen.dart';

class TaskList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TaskListState();
}

class TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<TaskBloc>(context);
    bloc.initData();
    return Consumer<TaskBloc>(
        builder: (context, bloc, child) => StreamBuilder<List<Task>>(
            stream: bloc.taskListStream,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                  if (snapshot.data.isEmpty) {
                    return Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(top: 60),
                              height: MediaQuery.of(context).size.height * 0.62,
                              child: Image.asset('images/waiting.png',
                                  fit: BoxFit.cover)),
                          const SizedBox(height: 35),
                          const Text(
                            'No tasks added yet...',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 19,
                            ),
                          )
                        ]));
                  } else {
                    return Column(
                      children: <Widget>[
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return Dismissible(
                                  key: Key(snapshot.data[index].id.toString()),
                                  background: Container(
                                    alignment: AlignmentDirectional.centerEnd,
                                    color: Colors.red,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: Icon(Icons.delete,
                                          size: 28, color: Colors.white),
                                    ),
                                  ),
                                  direction: DismissDirection.endToStart,
                                  onDismissed: (_) {
                                    Provider.of<TaskBloc>(context,
                                            listen: false)
                                        .event
                                        .add(DeleteTaskEvent(
                                            snapshot.data[index]));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 15),
                                        blurRadius: 30,
                                        color: Colors.black54.withOpacity(.15),
                                      )
                                    ]),
                                    margin: const EdgeInsets.only(
                                        right: 5, left: 5),
                                    child: Card(
                                      child: ListTile(
                                        title: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              snapshot.data[index]
                                                      .description ??
                                                  "",
                                              style:
                                                  const TextStyle(fontSize: 22),
                                            ),
                                            const SizedBox(height: 3),
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  snapshot.data[index]
                                                          .dueDate ??
                                                      "Null",
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .accentColor,
                                                      fontSize: 13),
                                                ),
                                                const SizedBox(width: 12),
                                                Text(
                                                  snapshot.data[index]
                                                          .dueTime ??
                                                      "Null",
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .accentColor,
                                                      fontSize: 13),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        trailing: GestureDetector(
                                          onTap: () {
                                            final id = snapshot.data[index].id;
                                            showModalBottomSheet(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.vertical(
                                                              top: Radius
                                                                  .circular(
                                                                      20))),
                                              context: context,
                                              builder: (_) =>
                                                  ModalScreen(id, true),
                                            );
                                            ///////////////////////////////
//                                            bloc.event.add(DeleteTaskEvent(
//                                                snapshot.data[index]));
                                          },
                                          child: const Icon(Icons.edit,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    );
                  }
                  break;
                case ConnectionState.none:
                case ConnectionState.waiting:
                default:
                  return Container(
                      padding: const EdgeInsets.only(top: 200),
                      width: 69,
                      height: 69,
                      child: const CircularProgressIndicator());
              }
            }));
  }
}
