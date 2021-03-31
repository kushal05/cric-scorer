import 'package:cric_scorer/Models/user-model.dart';
import 'package:cric_scorer/Services/user-service.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {

  List<User> usersList = [];
  List<String> usersListString= ['hey', 'you'];

  bool isUserInAMatch() {
    // process this based on user details
    return false;
  }

  updateUserListString(List<String> list) {
    usersListString = list;
    notifyListeners();
  }

  getUsersFromSearch() {
    String email = 'test_user@gmail.com';
    UserService userService = new UserService();
    userService.searchForUsers(email);
  }
}