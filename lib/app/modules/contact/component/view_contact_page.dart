import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttersampleapp/app/constants/constants.dart';
import 'package:fluttersampleapp/app/constants/enum_constants.dart';
import 'package:fluttersampleapp/app/constants/navigation.dart';
import 'package:fluttersampleapp/app/modules/contact/contact_bloc.dart';
import 'package:fluttersampleapp/app/modules/contact/contact_module.dart';
import 'package:fluttersampleapp/app/modules/shared/models/contact.dart';
import 'package:fluttersampleapp/app/modules/shared/widget/popup_dialog.dart';
import 'package:fluttersampleapp/app/utils/answer.dart';

class ViewContactPage extends StatefulWidget {
  static String tag= "VIEW_CONTACT";

  @override
  _ViewContactPageState createState() => _ViewContactPageState();
}

class _ViewContactPageState extends State<ViewContactPage> {
  ContactBloc bloc;
  Contact contact;

  @override
  void initState() {
    bloc= ContactModule.to.get<ContactBloc>();
    super.initState();
  }

  Widget buildViewContact(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new ListTile(
          leading: new Icon(Icons.person),
          title: new Text(this.contact.name),
          subtitle: new Text(Constants.NAME),
        ),
        new ListTile(
          leading: new Icon(Icons.phone),
          title: new Text(this.contact.phone),
          subtitle: new Text(Constants.PHONE),
        ),
        new ListTile(
          leading: new Icon(Icons.email),
          title: new Text(this.contact.email),
          subtitle: new Text(Constants.EMAIL),
        ),
        new Container(height: 1, color: Colors.grey),
        new ListTile(
          leading: new Icon(Icons.category),
          title: new Text(this.contact.category),
          subtitle: new Text(Constants.CATEGORY),
        ),
        new Container(height: 1, color: Colors.grey),
        new ListTile(
            leading: new Icon(Icons.check_circle),
            title: new Text(Constants.ENABLE),
            trailing: this.contact.enable
                ? new Icon(Icons.check, color: Colors.green)
                : new Icon(Icons.close, color: Colors.red)
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: new Text(Constants.CONTACT_DETAILS),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.edit),
            onPressed: () {
              Modular.to.pushNamed (NavigationConstants.EDIT_CONTACT, arguments: this.contact);
            }
          ),
          new IconButton(
            icon: new Icon(Icons.delete),
            onPressed: () { deleteContact(context); }
          ),
        ],
      ),
      body: new StreamBuilder(
        stream: bloc.contactOut,
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return new Center(child: new CircularProgressIndicator());
          }
          if(snapshot.hasError) {
            return new Text("${Constants.ERROR}: ${snapshot.hasError}");
          } else {
            this.contact= snapshot.data;
            return buildViewContact(context);
          }
        },
      ),
    );
  }

  void deleteContact(BuildContext context) {
    var confirm= PopupDialog.asyncDeleteConfirmDialog(context, () async {
      Answer A= await bloc.deleteContact(this.contact);
      Navigator.of(context).pop(ConfirmAction.OK);
      Navigator.of(context).pop();
    });
  }
}
