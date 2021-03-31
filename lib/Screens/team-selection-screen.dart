import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cric_scorer/Providers/home-provider.dart';
import 'package:cric_scorer/Providers/user-provider.dart';
import 'package:cric_scorer/Services/user-service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeamSelection extends StatefulWidget {
  @override
  _TeamSelectionState createState() => _TeamSelectionState();
}

class _TeamSelectionState extends State<TeamSelection> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  DocumentReference userDocuments = FirebaseFirestore.instance.collection('users').doc('test_user_2@gmail.com');
  Stream userDocumentStream = FirebaseFirestore.instance.collection('users').doc('test_user_2@gmail.com').snapshots();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Team Selection Screen'),
            OutlineButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        openAddPlayersDialog(context));
              },
              child: Text('Add Players'),
            ),
            OutlineButton(
              onPressed: () {
                Provider.of<HomeProvider>(context, listen: false).updatePageStackIndex();
                Provider.of<HomeProvider>(context, listen: false).updatePageDetails('rulesCustomisation');
              },
              child: Text('Add Rules'),
            ),
            OutlineButton(
              onPressed: () {
                Provider.of<UserProvider>(context, listen: false).getUsersFromSearch();
              },
              child: Text('Search Players'),
            ),
          ],
        ),
      ),
    );
  }

  void searchPlayers(String userEmail) {
    if (userEmail != null) {
      print('Searching for $userEmail');
      users.
      where('id', isEqualTo: 'test_user_1')
      .get()
      .then((value) => print('Search players ${value.docs.length}'));
    }
  }

  Widget openAddPlayersDialog(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextEditingController userSearchController = new TextEditingController();
    UserService userService = new UserService();
    List<dynamic> usersList = [];
    return AlertDialog(
      scrollable: true,
      title: Text('Testing add players'),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width/2,
                    child: TextField(
                      controller: userSearchController,
                    )
                ),
                GestureDetector(
                  child: Icon(Icons.search),
                  onTap: () {
                    setState(() {
                      userSearchController.text = userSearchController.text;
                    });
                    usersList = userService.searchForUsers(userSearchController.text);
                    print('Users list is: $usersList');
                    searchPlayers(userSearchController.text);
                    print('Searching...${userSearchController.text}');
                  },
                )
              ],
            ),
            StreamBuilder<QuerySnapshot>(
              stream: users.snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }

                return Container(
                  height: height / 7,
                  width: double.maxFinite,
                  child: new ListView(
                    children: snapshot.data.docs.map((DocumentSnapshot document) {
                      return new ListTile(
                        title: new Text(document.data()['id']),
                        subtitle: new Text(document.data()['name']),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
            Container(
              child: Text('$usersList'),
            )
            // Container(
            //   height: height / 2,
            //   width: double.maxFinite,
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: 5,
            //     itemBuilder: (BuildContext context, int index) {
            //       return ListTile(
            //         title: Text('Dummy User'),
            //         trailing: OutlineButton(
            //           onPressed: () {
            //             print('Added user to the team $index');
            //           },
            //           child: Text('Add to team'),
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
      actions: <Widget>[
        OutlineButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Done'),
        )
      ],
    );
  }
}
