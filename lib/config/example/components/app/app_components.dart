import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

class AppComponent extends StatefulWidget {
  @override
  _AppComponentState createState() => _AppComponentState();
}

class _AppComponentState extends State<AppComponent> {
  _AppComponentState(){
    // 实例化路由管理器.
    final router = FluroRouter();

  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
