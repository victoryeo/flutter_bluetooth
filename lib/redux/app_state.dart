import 'package:flutter/material.dart';

class AppState {
  int myAccount;
  String myNetwork;
  int myBalance;

  AppState(
      {@required this.myAccount, this.myNetwork = '', this.myBalance = 0});

  AppState.fromAppState(AppState another) {
    myAccount = another.myAccount;
    myNetwork = another.myNetwork;
    myBalance = another.myBalance;
  }

  int get viewAccount => myAccount;
}