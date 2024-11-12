import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Task {
  final String id;
  final String title;
  final String groupId;
  bool completed;

  Task({
    required this.id,
    required this.title,
    required this.groupId,
    this.completed = false,
  });
}

class TasksProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  Future<void> addTask(String title, String groupId) async {
    final String id = DateTime.now().toString();
    final newTask = Task(id: id, title: title, groupId: groupId);

    _tasks.add(newTask);
    notifyListeners();

    try {
      await Supabase.instance.client.from('tasks').insert({
        'id': id,
        'title': title,
        'group_id': groupId,
        'completed': false,
      });
    } catch (error) {
      print("Erro ao salvar tarefa no Supabase: $error");
    }
  }

  Future<void> loadTasks(String groupId) async {
    final response = await Supabase.instance.client
        .from('tasks')
        .select()
        .eq('group_id', groupId)
        .execute();

    if (response.error == null) {
      _tasks.clear();
      response.data.forEach((taskData) {
        _tasks.add(Task(
          id: taskData['id'],
          title: taskData['title'],
          groupId: taskData['group_id'],
          completed: taskData['completed'],
        ));
      });
      notifyListeners();
    } else {
      print("Erro ao carregar tarefas do Supabase: ${response.error}");
    }
  }

  Future<void> toggleTaskCompletion(Task task) async {
    task.completed = !task.completed;
    notifyListeners();

    try {
      await Supabase.instance.client.from('tasks').update({
        'completed': task.completed,
      }).eq('id', task.id);
    } catch (error) {
      print("Erro ao atualizar o status da tarefa no Supabase: $error");
    }
  }
}

extension on PostgrestFilterBuilder<PostgrestList> {
  execute() {}
}
