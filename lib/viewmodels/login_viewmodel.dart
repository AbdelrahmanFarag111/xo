import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac/views/game_screen.dart';

import '../models/player_model.dart';

class LoginViewModel extends ChangeNotifier {
  final TextEditingController playerOne = TextEditingController();
  bool switchValue = false;
  final TextEditingController playerTwo = TextEditingController();

  void onSwitchValueChanged(bool value) {
    switchValue = value;
    notifyListeners();
  }

  void navigateToGameScreen(BuildContext context) {
    PlayerModel playerModel =
        PlayerModel(playerOne.text, switchValue, playerTwo.text);
    Navigator.pushNamed(context, GameScreen.routeName,
        arguments: playerModel);
  }
}
