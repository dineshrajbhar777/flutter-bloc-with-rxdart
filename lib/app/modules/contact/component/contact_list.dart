import 'package:flutter/material.dart';
import 'package:fluttersampleapp/app/constants/constants.dart';
import 'package:fluttersampleapp/app/constants/navigation.dart';
import 'package:fluttersampleapp/app/modules/contact/contact_bloc.dart';
import 'package:fluttersampleapp/app/modules/contact/contact_module.dart';
import 'package:fluttersampleapp/app/modules/shared/models/contact.dart';

class ContactList extends StatefulWidget {
  final List<Contact> items;

  const ContactList({Key key, this.items}) : super(key: key);

  @override
  _ContactListState createState() => new _ContactListState();
}

class _ContactListState extends State<ContactList> {
  Offset tapPosition;
  ContactBloc bloc;

  @override
  void initState() {
    bloc= ContactModule.to.get<ContactBloc>();
    super.initState();
  }

  void onTapDown(TapDownDetails details) {
    tapPosition= details.globalPosition;
  }

  Column emptyList(context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container(
          child: new Icon(Icons.list, size: 120),
        ),
        new SizedBox(height: 20),
        new Center(
          child: new Text(
            Constants.YOU_DONT_HAVE_ANY_CONTACTS_YET,
            style: new TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if(widget.items != null && widget.items.length == 0) {
      return emptyList(context);
    }

    return ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: (BuildContext context, int index) {
        Contact contact= widget.items[index];
        return GestureDetector(
          onTapDown: onTapDown,
          child: new Container(
            width: MediaQuery.of(context).size.width,
            child: new ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              leading: new CircleAvatar(
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.grey.shade200,
                child: new Text(
                  contact.name.substring(0, 1).toUpperCase(),
                  style: new TextStyle(
                    fontSize: 26,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              title: new Text(
                contact.name,
                style: new TextStyle(fontSize: 17),
              ),
              subtitle: new Text(contact.phone),
              onTap: () {
                bloc.setContact(contact);
                Navigator.of(context).pushNamed(NavigationConstants.VIEW_CONTACT);
              },
            ),
          ),
        );
      },
    );
  }
}
