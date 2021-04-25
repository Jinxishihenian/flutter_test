import 'package:flutter/cupertino.dart';

class Distance extends ChangeNotifier {
  double alpha = 0;

  set setScale(double distance) {
    alpha = distance / 200;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    notifyListeners();
  }

  double get getScale {
    return alpha;
  }
}
