import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_provider.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
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
                final title = _textController.text;
                if (title.isNotEmpty) {
                  Provider.of<TaskProvider>(context, listen: false).addTask(title);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
