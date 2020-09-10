import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  int _count = 0;
  // get函数,更高效的访问成员变量.
  int get value => _count;

  void incrment(){
    _count++;
 // 通知监听者(通知所有听众刷新).
    notifyListeners();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("我的数据模型自动释放了");
  }
}