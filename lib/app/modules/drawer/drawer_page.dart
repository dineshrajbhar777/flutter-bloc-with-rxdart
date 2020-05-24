import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttersampleapp/app/modules/contact/contact_module.dart';
import 'package:fluttersampleapp/app/modules/drawer/drawer_module.dart';
import 'package:fluttersampleapp/app/modules/home/home_module.dart';

class DrawerPage extends StatefulWidget {
  final String title;
  const DrawerPage({Key key, this.title = "Drawer"}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: Container(
        decoration: new BoxDecoration(
          //border: Border.all(color: Colors.white30),
          color: Theme.of(context).cardColor,
        ),
        child: new ListView(
          //padding: EdgeInsets.zero,
          children: <Widget>[
            /*new DrawerHeader(
              child: new Text("Intelliwiz"),
            ),*/
            new ListTile(
              title: new Text(
                "Intelliwiz",
                style: new TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
            new Divider(color: Theme.of(context).accentColor,),
            new ListTile(
              leading: new Icon(Icons.home),
              title: new Text("Home"),
              onTap: () {
                Navigator.of(context).pop();
                //new RouterOutlet(module: new HomeModule());
                //Navigator.of(context).pushNamed("/");
              },
            ),
            new ListTile(
              leading: new Icon(Icons.person),
              title: new Text("Contacts"),
              onTap: () {
                Navigator.of(context).pop();
                //RouterOutlet(module: new ContactModule());
                Navigator.of(context).pushNamed("/contact");
              },
            ),
          ],
        ),
      )
    );
  }
}
