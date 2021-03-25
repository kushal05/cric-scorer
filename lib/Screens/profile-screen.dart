import 'package:cric_scorer/Screens/records-screen.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Profile Screen'),
            OutlineButton(
                onPressed: () {},
              child: Text('Update Details'),
            ),
            Records(),
            OutlineButton(
                onPressed: () {},
              child: Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
