import 'package:flutterapp/pages/index/model/distance.dart';

class SingletonPattern {
  static Distance distance;

  Distance get getDistance {
    if (distance == null) {
      distance = Distance();
    }
    return distance;
  }
}
