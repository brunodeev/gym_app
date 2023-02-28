import 'package:flutter/material.dart';

import '../utils/user_helpers.dart';

class UserGlobal extends ChangeNotifier {
  List<Map<String, dynamic>> allData = [];

  bool isLoading = true;

  void refreshData() async {
    final data = await UserHelpers.getAllData();
    allData = data;
    isLoading = false;
    notifyListeners();
  }

  Future<void> addData(
      String name, email, phone, int age, double weight) async {
    await UserHelpers.createData(name, email, age, weight, phone);
    refreshData();
    notifyListeners();
  }

  Future<void> updateData(
      int id, String name, email, phone, int age, double weight) async {
    await UserHelpers.updateData(id, name, email, age, weight, phone);
    refreshData();
    notifyListeners();
  }

  void deleteData(int id, BuildContext context) async {
    await UserHelpers.deleteData(id);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text('Usuário Deletado!'),
      ),
    );
    refreshData();
    notifyListeners();
  }
}
