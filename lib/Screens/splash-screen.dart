import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                  child: Text('Login'),
                ),
                MaterialButton(
                    onPressed: () => Navigator.pushNamed(context, '/signup'),
                  child: Text('SignUp'),
                )
              ],
            ),
          ),
        )
    );
  }
}
