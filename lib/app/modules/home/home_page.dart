import 'package:flutter/material.dart';
import 'package:fluttersampleapp/app/modules/drawer/drawer_page.dart';
import 'package:fluttersampleapp/app/modules/home/home_module.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: HomeModule.to.get<DrawerPage>(),
      body: new Center(
        child: Text(
          widget.title,
          style: new TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
