import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/pages/index/util/singleton_pattern.dart';
import 'component/app_bar.dart';
import 'component/sliver_app_bar_delegate.dart';
import 'model/distance.dart';

class TXindex extends StatefulWidget {
  @override
  _TXindexState createState() => _TXindexState();
}

class _TXindexState extends State<TXindex> with TickerProviderStateMixin {
  Distance distance = SingletonPattern().getDistance;

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Material(
      child: NotificationListener(
        onNotification: (notification) {
          switch (notification.runtimeType) {
            case ScrollStartNotification:
              print("开始滚动");
              break;
            case ScrollUpdateNotification:
              if (notification.depth == 0) {
                onScroll(notification.metrics.pixels);
              }
              break;
            case ScrollEndNotification:
              print("滚动停止");
              break;
            case OverscrollNotification:
              print("滚动到边界");
              break;
          }
        },
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                minHeight: 100,
                maxHeight: 100,
                child: CustomAppBar(),
              ),
              // delegate: delegate,
            ),
            // AppBar.
            /* SliverAppBar(
              pinned: true,
              expandedHeight: 250.0,
              title: Row(
                  // crossAxisAlignment:CrossAxisAlignment.
                  children: [
                    Text(
                      '砼鑫1.0',
                    ),
                    Text(
                      '切换企业',
                    ),
                  ]),
              // backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                // title: Text('砼鑫'),
                background: Image.asset(
                  "images/index.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
            ),*/
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
              delegate: SliverAppBarDelegate(
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
      ),
    );
  }

  // 滚动的距离.
  onScroll(double offset) {
    distance.setScale = offset;
  }
}
