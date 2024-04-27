import 'package:flutter/material.dart';

class CommonProvider extends ChangeNotifier {
  int currentTab = 0;

  CommonProvider() {}

  void setCurrentIndex(int indx) {
    currentTab = indx;
    notifyListeners();
  }

  void setCurrentsIndex(int indx) {
    currentTab = indx;
    notifyListeners();
  }
}
