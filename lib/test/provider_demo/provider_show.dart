import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/moudles/counter_model.dart';
import 'package:provider/provider.dart';

class ProviderShow extends StatefulWidget {
  @override
  _ProviderShowState createState() => _ProviderShowState();
}

class _ProviderShowState extends State<ProviderShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Provider显示信息}")),
      body: ListView(
        children: [Text("${Provider.of<CounterModel>(context).value}")],
      ),
    );
  }
}
