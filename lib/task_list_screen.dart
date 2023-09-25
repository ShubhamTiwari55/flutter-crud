import 'package:crud_app/task_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_task_screen.dart';
import 'task_provider.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasksProvider = Provider.of<TaskProvider>(context);
    final tasks = tasksProvider.tasks;

    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (ctx, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(task.title),
            leading: Checkbox(
              value: task.isCompleted,
              onChanged: (_) {
                tasksProvider.toggleTaskCompletion(task.id);
              },
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                tasksProvider.removeTask(task.id);
              },
            ),
            onTap: () {
              // Navigate to the task detail/edit screen
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => TaskDetailScreen(task),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the add task screen
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => AddTaskScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
