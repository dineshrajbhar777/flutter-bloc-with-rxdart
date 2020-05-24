import 'package:fluttersampleapp/app/app_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:fluttersampleapp/app/app_widget.dart';
import 'package:fluttersampleapp/app/constants/navigation.dart';
import 'package:fluttersampleapp/app/modules/contact/component/add_contact_page.dart';
import 'package:fluttersampleapp/app/modules/contact/component/edit_contact_page.dart';
import 'package:fluttersampleapp/app/modules/contact/component/view_contact_page.dart';
import 'package:fluttersampleapp/app/modules/contact/contact_module.dart';
import 'package:fluttersampleapp/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
    new Bind((i) => new AppBloc()),
  ];

  @override
  List<Router> get routers => [
    new Router(Modular.initialRoute, module: new HomeModule()),
    new Router(NavigationConstants.CONTACT, module: new ContactModule()),
    new Router(NavigationConstants.ADD_CONTACT, child: (_, args) => new AddContactPage()),
    new Router(NavigationConstants.VIEW_CONTACT, child: (_, args) => new ViewContactPage()),
    new Router(NavigationConstants.EDIT_CONTACT, child: (_, args) => new EditContactPage(contact: args.data,)),
  ];

  @override
  Widget get bootstrap => new AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
