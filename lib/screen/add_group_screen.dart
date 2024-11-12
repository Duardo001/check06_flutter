import 'package:check06_flutter/models/group.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddGroupScreen extends StatefulWidget {
  @override
  _AddGroupScreenState createState() => _AddGroupScreenState();
}

class _AddGroupScreenState extends State<AddGroupScreen> {
  final _nameController = TextEditingController();
  Color _selectedColor = Colors.blue;
  IconData _selectedIcon = Icons.task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Grupo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Nome do Grupo"),
            ),
            SizedBox(height: 16),
            Text("Escolha uma cor:"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (var color in [Colors.red, Colors.blue, Colors.green])
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = color;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: color,
                      child: _selectedColor == color ? Icon(Icons.check, color: Colors.white) : null,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 16),
            Text("Escolha um ícone:"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (var icon in [Icons.task, Icons.work, Icons.school])
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIcon = icon;
                      });
                    },
                    child: Icon(
                      icon,
                      size: 32,
                      color: _selectedIcon == icon ? Colors.black : Colors.grey,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                if (name.isNotEmpty) {
                  Provider.of<GroupsProvider>(context, listen: false)
                      .addGroup(name, _selectedColor, _selectedIcon);
                  Navigator.pop(context);
                }
              },
              child: Text("Salvar Grupo"),
            ),
          ],
        ),
      ),
    );
  }
}