import 'package:check06_flutter/providers/task_provider.dart';
import 'package:check06_flutter/screen/add_task_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// class SupabaseRepository {
//   Future<List<Task>> listTaskGroups() async {
//     final supabase = Supabase.instance.client;
//     final response = await supabase.from('task_groups').select();
//     return response.map((task) => Task.fromMap(task)).toList();
//   }

  // Future<List<TaskGroupWithCounts>> listTaskGroupsWithCounts() async {
  //   final supabase = Supabase.instance.client;
  //   final taskGroups = await supabase.from('task_groups').select('''
  //       id,
  //       name,
  //       color,
  //       tasks (
  //         id,
  //         is_completed
  //       )
  //     ''');


  // Future<List<AddTaskScreen>> listTasksByGroup(String groupId) async {
  //   final supabase = Supabase.instance.client;
  //   final response =
  //       await supabase.from('tasks').select().eq('task_group_id', groupId);
  //   return response.map((task) => AddTaskScreen.fromMap(task)).toList();
  // }

  // Future createTask(Task task) async {
  //   final supabase = Supabase.instance.client;
  //   await supabase.from('tasks').insert(task.toMap());
  // }

  // Future deleteTask(String taskId) async {
  //   final supabase = Supabase.instance.client;
  //   await supabase.from('tasks').delete().eq('id', taskId);
  // }
// }