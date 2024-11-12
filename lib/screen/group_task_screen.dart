import 'package:check06_flutter/providers/task_provider.dart';
import 'package:check06_flutter/screen/add_task_screen.dart';
import 'package:check06_flutter/screen/task_datail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupTasksScreen extends StatelessWidget {
  final String groupId;
  final String groupName;

  GroupTasksScreen({required this.groupId, required this.groupName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefas - $groupName"),
      ),
      body: FutureBuilder(
        future: Provider.of<TasksProvider>(context, listen: false).loadTasks(groupId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Consumer<TasksProvider>(
              builder: (context, tasksProvider, child) {
                return ListView.builder(
                  itemCount: tasksProvider.tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasksProvider.tasks[index];
                    return ListTile(
                      title: Text(task.title),
                      trailing: Icon(
                        task.completed ? Icons.check_box : Icons.check_box_outline_blank,
                        color: task.completed ? Colors.green : null,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TaskDetailScreen(task: task),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(groupId: groupId),
            ),
          );
        },
      ),
    );
  }
}