import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task.dart';
import 'task_provider.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task;

  TaskDetailScreen(this.task);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textController = TextEditingController(text: task.title);

    return Scaffold(
        appBar: AppBar(
          title: Text('Task Detail'),
        ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
    TextField(
    controller: _textController,
    decoration: InputDecoration(labelText: 'Task Title'),
    ),
    SizedBox(height: 16),
    ElevatedButton(
    onPressed: () {
    final newTitle = _textController.text;
    if (newTitle.isNotEmpty) {
    Provider.of<TaskProvider>(context, listen: false).updateTask(task.id, newTitle);
    Navigator.of(context).pop();
    }
    },
    child: Text('Update Task'),
    ),
    SizedBox(height: 16),
    ElevatedButton(
    onPressed: () {
    Provider.of<TaskProvider>(context, listen: false).removeTask(task.id);
    Navigator.of(context).pop();
    },
    style: ElevatedButton.styleFrom(primary: Colors.red),
    child: Text('Delete Task'),
    ),
    ],
    ),
        ),
    );
  }
}