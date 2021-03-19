import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class TXindex extends StatefulWidget {
  @override
  _TXindexState createState() => _TXindexState();
}

class _TXindexState extends State<TXindex> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('砼鑫'),
              background: Image.asset(
                "images/index.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 4,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          // 吸顶效果.
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 49,
              maxHeight: 49,
              child: Container(
                padding: EdgeInsets.only(left: 15),
                color: Colors.lightBlueAccent,
                alignment: Alignment.centerLeft,
                child: TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(
                      icon: Text('一号线'),
                    ),
                    Tab(
                      icon: Text('二号线'),
                    ),
                    Tab(
                      icon: Text('三号线'),
                    ),
                  ],
                ),
              ),
            ),
            // delegate: delegate,
          ),
          // 可以加载普通weight.
          SliverToBoxAdapter(
            child: SizedBox(
              width: 100,
              height: 100,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Text(
                    '视图1',
                    style: TextStyle(color: Colors.lightBlueAccent),
                  ),
                  Text(
                    '视图2',
                    style: TextStyle(color: Colors.lightBlueAccent),
                  ),
                  Text(
                    '视图3',
                    style: TextStyle(color: Colors.lightBlueAccent),
                  ),
                ],
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}

/// 吸顶类.
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
