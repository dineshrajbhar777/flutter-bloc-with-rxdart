import 'package:flutter/material.dart';
import 'package:fluttersampleapp/app/constants/constants.dart';
import 'package:fluttersampleapp/app/constants/navigation.dart';
import 'package:fluttersampleapp/app/modules/contact/component/contact_list.dart';
import 'package:fluttersampleapp/app/modules/contact/contact_bloc.dart';
import 'package:fluttersampleapp/app/modules/contact/contact_module.dart';
import 'package:fluttersampleapp/app/modules/drawer/drawer_page.dart';
import 'package:fluttersampleapp/app/modules/home/home_module.dart';

class ContactPage extends StatefulWidget {
  static String tag= "CONTACT";
  final String title;
  const ContactPage({Key key, this.title = Constants.CONTACT}) : super(key: key);

  @override
  _ContactPageState createState() => new _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  ContactBloc bloc;
  Widget appBarTitle= new Text(Constants.CONTACT);
  Icon actionIcon= new Icon(Icons.search);
  bool searching= false;
  final _cSearch= new TextEditingController();

  @override
  void initState() {
    bloc= ContactModule.to.get<ContactBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bloc.fetchContactList();
    return Scaffold(
      appBar: new PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: new StreamBuilder(
          stream: bloc.buttonSearchOut,
          builder: (context, snapshot) {
            if(snapshot.hasError) {
              return new Text("${Constants.ERROR}: ${snapshot.error}");
            } else {
              if(!snapshot.hasData) {
                return Center(child: new CircularProgressIndicator());
              }
              if(snapshot.data) {
                return new AppBar(
                  title: appBarTitle,
                  actions: <Widget>[
                    new IconButton(
                      icon: actionIcon,
                      onPressed: () {
                        setState(() {
                          if(this.actionIcon.icon == Icons.search) {
                            this.actionIcon= new Icon(Icons.close);
                            this.appBarTitle= new TextField(
                              controller: _cSearch,
                              autofocus: true,
                              onChanged: (value) {
                                this.searching= true;
                                bloc.fetchContactListBySearch(value);
                              },
                              decoration: new InputDecoration(
                                prefixIcon: new Icon(Icons.search),
                                hintText: Constants.SEARCH_CONTACTS
                              ),
                            );
                          } else {
                            _cSearch.clear();
                            this.searching= false;
                            this.actionIcon= new Icon(Icons.search);
                            this.appBarTitle= new Text(Constants.CONTACT);
                          }
                        });
                      }
                    ),
                  ],
                );
              } else {
                return new AppBar(
                  title: new Text(Constants.CONTACT),
                );
              }
            }
          }
        ),
      ),
      //drawer: HomeModule.to.get<DrawerPage>(),
      body: new StreamBuilder(
        stream: bloc.listContactOut,
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return Center(
              child: new CircularProgressIndicator(),
            );
          }
          if(snapshot.hasError) {
            return new Text("${Constants.ERROR}: ${snapshot.error}");
          } else {
            bloc.setVisibleButtonSearch(snapshot.data.length > 0 || searching );

            if(searching && snapshot.data.length == 0) {
              return new Column(
                children: <Widget>[
                  new Center(
                    child: new Padding(
                      padding: const EdgeInsets.all(10),
                      child: new Text(
                        Constants.NO_ITEM_FOUND,
                        //style: new TextStyle(
                        //  color: Colors.white
                        //),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return new ContactList(items: snapshot.data);
            }
          }
        },
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(NavigationConstants.ADD_CONTACT);
        },
      ),
    );
  }
}
