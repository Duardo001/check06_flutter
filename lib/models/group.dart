import 'package:flutter/material.dart';

class Group {
  final String id;
  final String name;
  final Color color;
  final IconData icon;

  Group({required this.id, required this.name, required this.color, required this.icon});
}

class GroupsProvider with ChangeNotifier {
  final List<Group> _groups = [];

  List<Group> get groups => _groups;

  Future<void> addGroup(String name, Color color, IconData icon) async {
    // Gerando um ID único (pode ser ajustado conforme a estrutura do banco de dados)
    final String id = DateTime.now().toString();
    final newGroup = Group(id: id, name: name, color: color, icon: icon);

    // Adicionando o grupo na lista local
    _groups.add(newGroup);
    notifyListeners();

    // // Salvando o grupo no Supabase
    // try {
    //   await Supabase.instance.client.from('groups').insert({
    //     'id': id,
    //     'name': name,
    //     'color': color.value.toString(),
    //     'icon': icon.codePoint.toString(),
    //   });
    // } catch (error) {
    //   // Aqui você pode tratar erros específicos ou exibir uma mensagem de erro
    //   print("Erro ao salvar grupo no Supabase: $error");
    // }
  }
}