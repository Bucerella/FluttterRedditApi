import 'package:flutter/material.dart';
import 'package:reddit_clone/Home.dart';
import 'package:reddit_clone/Popular.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    _tabController = TabController(
        initialIndex: _currentIndex, length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
      print("Selected Index: " + _tabController.index.toString());
      super.initState();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffFF5700),
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  child: Text("Home"),
                ),
                Tab(
                  child: Text("Popular"),
                ),
              ],
            ),
            title: Text('Reddit'),
          ),
          drawer: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  drawerHeader(),
                  drawerItem(icon: Icons.home, text: 'Home'),
                  drawerItem(
                      icon: Icons.account_circle, text: 'My Profile'),
                  drawerItem(
                      icon: Icons.payments_outlined,
                      text: 'Reddit Coins'),
                  drawerItem(icon: Icons.save, text: 'Saved'),
                  Divider(),
                  drawerItem(
                    icon: Icons.notifications_active,
                    text: 'Notifications',
                  ),
                ],
              ),
            ),
          ), //NavigationDrawer
          body: Container(
            child: TabBarView(
              controller: _tabController,
              children: [
                Home(),
                Popular(),
              ],
            ),
          ),
        ));
  }
}

Widget drawerHeader() {
  return DrawerHeader(
    margin: EdgeInsets.zero,
    padding: EdgeInsets.zero,
    child: Image.network(
      'https://i.redd.it/2qy7unjo2j331.png',
      errorBuilder: (
        BuildContext context,
        Object exception,
        StackTrace stackTrace,
      ) {
        return Container(
          child: Image.network(
            'https://i4.hurimg.com/i/hurriyet/75/750x422/6014124cc9de3d5810819f47.png',
            fit: BoxFit.contain,
          ),
        );
      },
    ),
  );
}

Widget drawerItem({
  IconData icon,
  String text,
}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
  );
}
