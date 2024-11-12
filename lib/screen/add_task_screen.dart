import 'package:check06_flutter/providers/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  final String groupId;

  AddTaskScreen({required this.groupId});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Tarefa"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: "Título da Tarefa"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final title = _titleController.text;
                if (title.isNotEmpty) {
                  Provider.of<TasksProvider>(context, listen: false)
                      .addTask(title, widget.groupId);
                  Navigator.pop(context);
                }
              },
              child: Text("Salvar Tarefa"),
            ),
          ],
        ),
      ),
    );
  }
}