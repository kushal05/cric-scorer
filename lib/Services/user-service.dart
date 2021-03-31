import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {

  FirebaseFirestore firebase;
  CollectionReference users;

  UserService() {
    this.firebase = FirebaseFirestore.instance;
    this.users = firebase.collection('users');
  }

  searchForUsers(String name) {
    users.
    where('id', isEqualTo: name)
        .get()
        .then((value)  {
          print('Search players service ${value.docs.length}');
          return value.docs;
    });
  }
}
