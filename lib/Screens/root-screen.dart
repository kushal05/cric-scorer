import 'package:flutter/material.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlineButton(
                onPressed: () => Navigator.pushNamed(context, '/home'),
                child: Text('Old Users'),
              ),
              OutlineButton(
                onPressed: () => Navigator.pushNamed(context, '/splash'),
                child: Text('New Users'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
