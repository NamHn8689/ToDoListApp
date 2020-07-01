import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc/task_bloc.dart';
import 'db/task_database.dart';
import 'screens/homepage.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TaskDatabase.instanse.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<TaskBloc>.value(
        value: TaskBloc(), child: MaterialApp(home: HomePage()));
  }
}
