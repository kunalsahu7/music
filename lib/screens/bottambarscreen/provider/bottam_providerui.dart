import 'package:flutter/material.dart';
import '../../homescreen/view/homeui.dart';
import '../../serchscreen/view/serchscreen_ui.dart';

class BottomBarScreenProvider extends ChangeNotifier{
  int i = 0;
  List Screens = [
    HomeScreen(),
    SearchScreen(),
  ];

  void changePahe(int value){
    i = value;
    notifyListeners();
  }
}