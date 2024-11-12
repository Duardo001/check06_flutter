import 'package:check06_flutter/models/group.dart';
import 'package:check06_flutter/providers/theme_provider.dart';
import 'package:check06_flutter/screen/add_group_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gerenciador de Tarefas"),
      ),
      body: Consumer<GroupsProvider>(
        builder: (context, groupsProvider, child) {
          return ListView.builder(
            itemCount: groupsProvider.groups.length,
            itemBuilder: (context, index) {
              final group = groupsProvider.groups[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: group.color,
                  child: Icon(group.icon, color: Colors.white),
                ),
                title: Text(group.name),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddGroupScreen()),
          );
        },
      ),
    );
  }
}
