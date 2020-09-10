// 简单计数器.
import 'dart:async';

class ProviderBloc {
 int _count = 0;
 var _countController = StreamController<int>.broadcast();

 Stream<int> get stream => _countController.stream;
 int get count => _count;

 increment() {
   _countController.sink.add(++_count);
//   notifyListeners();
 }

 dispose() {
  _countController.close();
 }
}