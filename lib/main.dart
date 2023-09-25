import 'package:crud_app/task_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        title: 'Task Manager',
        home: TaskListScreen(),
      ),
    );
  }
}
