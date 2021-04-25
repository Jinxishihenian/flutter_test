import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/pages/index/model/distance.dart';
import 'package:flutterapp/pages/index/util/singleton_pattern.dart';

class CustomAppBar extends StatefulWidget {
  Distance distance;

  CustomAppBar({this.distance});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  Distance distance = SingletonPattern().getDistance;

  @override
  void initState() {
    super.initState();
    distance.addListener(_listener);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Opacity(
        opacity: distance.getScale,
        child: Container(
          color: Colors.lightBlueAccent,
          height: 100,
          child: Center(
              // child: Text("${distance.getScale}"),
              ),
        ),
      ),
      Text(
        "${distance.getScale}",
        style: TextStyle(
          color: distance.getScale == 0 ? Colors.white : Colors.black,
        ),
      ),
    ]);
  }

  void _listener() {
    if (mounted) {
      this.setState(() {

      });
    }
  }
}
