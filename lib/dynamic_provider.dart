import 'package:flutter/material.dart';

class DynamicContentProvider extends ChangeNotifier {
  bool showNewContent = false;

  void toggleNewContent() {
    showNewContent = true;
    notifyListeners();
  }

  void togglePreviousContent() {
    showNewContent = false;
    notifyListeners();
  }
}
