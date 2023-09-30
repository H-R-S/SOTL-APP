import 'package:flutter/foundation.dart';

class SettingProvider extends ChangeNotifier {
  int currentPage = 0;

  void updateCurrentPage(int index) {
    currentPage = index;
    notifyListeners();
  }
}
