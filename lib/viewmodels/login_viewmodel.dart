import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoginViewModel extends ChangeNotifier {
  final TextEditingController playerOne = TextEditingController();
  bool switchValue = false;
  final TextEditingController playerTwo = TextEditingController();

  void onSwitchValueChanged(bool value) {
    switchValue = value;
    notifyListeners();
  }

  void navigateToGameScreen(BuildContext context) {

  }
}
