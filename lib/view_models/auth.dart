import 'package:flutter/material.dart';
import 'package:ski_sub/models/user.dart';

class Auth extends ChangeNotifier {
  String name = "Dare";

  User? user;

  void setUser(User newUser) {
    user = newUser;
    notifyListeners();
  }
}
