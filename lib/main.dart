import 'package:flutter/material.dart';
import 'package:flutterapp/model/counter_model.dart';
import 'package:flutterapp/model/provider_bloc.dart';
import 'package:flutterapp/pages/index/TXindex.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      // 使用changeNotifierProviders时,要求build返回的数据Model必须是ChangeNotifier的子类.
      // 在改变数据后,调用notifyListener()方法.
      // 通过重写它的dispose方法,可以完成和Provider一样的资源释放.
      ChangeNotifierProvider(create: (context) => CounterModel()),
      // 优点:数据共享,通过dispose进行资源释放;缺点:在共享数据发生时不能通知它的监听者.
      Provider(
        create: (context) => ProviderBloc(),
      ),
      // ListenableProvider ChangeNotifierProvider 的父类.

      ListenableProvider(
        create: (context) => CounterModel(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TXindex(),
      // home: ProviderDemo(),
//      home: Provider<int>.value(
//        value: 48,
//        child: ChangeNotifierProvider(
//          create:(context)=> CounterModel(),
//          child: ProviderDemo(),
//        ),
//      ),
    );
  }
}
