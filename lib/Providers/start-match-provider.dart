import 'package:cric_scorer/Providers/user-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartMatchProvider extends ChangeNotifier {

  bool canUserStartMatch(BuildContext context) {
    return !Provider.of<UserProvider>(context, listen: false).isUserInAMatch();
  }

}