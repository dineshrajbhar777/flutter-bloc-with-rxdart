import 'package:flutter/material.dart';
import 'package:fluttersampleapp/app/constants/constants.dart';
import 'package:fluttersampleapp/app/modules/contact/contact_bloc.dart';
import 'package:fluttersampleapp/app/modules/contact/contact_module.dart';
import 'package:fluttersampleapp/app/modules/shared/models/contact.dart';
import 'package:fluttersampleapp/app/utils/validation.dart';

class AddContactPage extends StatefulWidget {
  static String tag= "ADD_CONTACT";
  @override
  _AddContactPageState createState() => new _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final _formKey= GlobalKey<FormState>();
  final _cName= new TextEditingController();
  final _cPhone= new TextEditingController();
  final _cEmail= new TextEditingController();
  final _cCategory= new TextEditingController();
  bool enable= true;
  ContactBloc bloc;

  @override
  void initState() {
    bloc= ContactModule.to.get<ContactBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextFormField tfName= new TextFormField(
      controller: _cName,
      keyboardType: TextInputType.text,
      validator: Validation.validateName,
      decoration: new InputDecoration(
        icon: new Icon(Icons.person),
        labelText: Constants.NAME,
        labelStyle: new TextStyle(fontSize: 14.0)
      ),
    );

    TextFormField tfPhone= new TextFormField(
      controller: _cPhone,
      keyboardType: TextInputType.phone,
      validator: Validation.validatePhone,
      decoration: new InputDecoration(
          icon: new Icon(Icons.phone),
          labelText: Constants.PHONE,
          labelStyle: new TextStyle(fontSize: 14.0)
      ),
    );

    TextFormField tfEmail= new TextFormField(
      controller: _cEmail,
      keyboardType: TextInputType.emailAddress,
      validator: Validation.validateEmail,
      decoration: new InputDecoration(
          icon: new Icon(Icons.email),
          labelText: Constants.EMAIL,
          labelStyle: new TextStyle(fontSize: 14.0)
      ),
    );

    TextFormField tfCategory= new TextFormField(
      controller: _cCategory,
      keyboardType: TextInputType.text,
      validator: Validation.validateCategory,
      decoration: new InputDecoration(
          icon: new Icon(Icons.category),
          labelText: Constants.CATEGORY,
          labelStyle: new TextStyle(fontSize: 14.0)
      ),
    );

    Widget switchEnable= new ListTile(
      leading: new Icon(Icons.check_circle),
      title: new Text(Constants.ENABLE, style: new TextStyle(fontSize: 14)),
      trailing: new Switch(
        value: this.enable,
        onChanged: (value){
          setState(() {
            this.enable= value;
          });
        },
      )
    );

    ListView formContent= new ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        new Form(
          key: _formKey,
          child: new Column(
            children: <Widget>[
              tfName,
              tfPhone,
              tfEmail,
              tfCategory,
              switchEnable,
            ],
          ),
        ),
      ],
    );

    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          }
        ),
        title: new Text(Constants.ADD_NEW_CONTACT),
        actions: <Widget>[
          new Container(
            width: 80,
            child: new IconButton(
              icon: new Icon(Icons.check),
              onPressed: saveData
            ),
          )
        ],
      ),
      body: formContent,
    );
  }

  void saveData() {
    if(_formKey.currentState.validate()) {
      Contact contact= new Contact();
      contact.name= _cName.text.trim();
      contact.phone= _cPhone.text.trim();
      contact.email= _cEmail.text.trim();
      contact.category= _cCategory.text.trim();
      contact.enable= this.enable;
      bloc.insertContact(contact).then((saved){
        Navigator.of(context).pop();
      });
    }
  }
}
