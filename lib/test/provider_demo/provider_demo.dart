import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/moudles/counter_model.dart';
import 'package:flutterapp/test/provider_demo/provider_show.dart';
import 'package:provider/provider.dart';

class ProviderDemo extends StatefulWidget {
  @override
  _ProviderDemoState createState() => _ProviderDemoState();
}

class _ProviderDemoState extends State<ProviderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试"),
      ),
      body: ListView(
        children: [
          Consumer<CounterModel>(
            builder: (context, cart, child) {
              return Text("ChangeNotifierProvider值,${cart.value}");
            },
          ),
          FlatButton(
            child: Text("跳转显示"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProviderShow(),
                ),
              );
            },
          ),
        ],
      ),
      // 改变内部数据的同时更新数据,需要放到Consumer中.
      floatingActionButton: Consumer<CounterModel>(
        builder: (context, cart, child) {
          return FloatingActionButton(
            child: Icon(
              Icons.add,
            ),
            onPressed: () {
              cart.incrment();
            },
          );
        },
      ),
    );
  }
  /// 测试修改变量.

}

class CounterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.add,
      ),
      /* onPressed: () {
          // listen:false,在build中使用上面代码,当notifyListener调用时,widget不会使视图更新.
          // 在 build 方法中使用上面的代码，当 notifyListeners 被调用的时候，并不会使 widget 被重构.
          Provider.of<ProviderBloc>(context,listen:false,).increment();
          // changenotify改变视图.
          Provider.of<CounterModel>(context,listen: true,).incrment();
        },*/
      onPressed: () {
        Provider.of<CounterModel>(
          context,
          listen: false,
        ).incrment();
      },
    );
  }
}
