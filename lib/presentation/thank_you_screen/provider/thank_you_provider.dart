import 'package:flutter/material.dart';

class ThankYouProvider extends ChangeNotifier {
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  void initialize() {
    _isInitialized = true;
    notifyListeners();

    // Auto-navigate after 3 seconds (optional)
    Future.delayed(Duration(seconds: 3), () {
      // Can add navigation logic here if needed
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
