import 'package:flutter/material.dart';
import './home.dart';
import './popular.dart';
import './news.dart';

void main() {
  runApp(AppTabs());
}

// class untuk meload ApptabState dengan keyword createState()
// StatelessWidget yang sifatnya statis sehingga tidak dapat di-render kembali setelah component di-load.
// StatefulWidget sifatnya dinamis sehingga dapat di-render kembali saat ketika terdapat event atau user actions.
class AppTabs extends StatefulWidget {
  @override
  AppTabState createState() => AppTabState();
}

class AppTabState extends State<AppTabs> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller =
        TabController(vsync: this, length: 3); //length = banyak tab yang dibuat
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('App Tabs'),
        backgroundColor: Colors.blue[800],
        // untuk tombol ytabbar nya
        bottom: TabBar(controller: controller, tabs: <Tab>[
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.note),
          ),
          Tab(
            icon: Icon(Icons.poll),
          ),
        ]),
      ),
      body: TabBarView(controller: controller, children: <Widget>[
        Home(),
        Popular(),
        News(),
      ]),
    ));
  }
}
