import 'package:check06_flutter/providers/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task;

  TaskDetailScreen({required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes da Tarefa"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text("Status: "),
                Text(
                  task.completed ? "Completa" : "Incompleta",
                  style: TextStyle(
                    color: task.completed ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Provider.of<TasksProvider>(context, listen: false).toggleTaskCompletion(task);
              },
              child: Text(task.completed ? "Marcar como Incompleta" : "Marcar como Completa"),
            ),
          ],
        ),
      ),
    );
  }
}