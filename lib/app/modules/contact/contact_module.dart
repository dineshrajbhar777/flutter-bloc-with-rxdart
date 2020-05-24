import 'package:fluttersampleapp/app/constants/navigation.dart';
import 'package:fluttersampleapp/app/modules/contact/component/add_contact_page.dart';
import 'package:fluttersampleapp/app/modules/contact/component/edit_contact_page.dart';
import 'package:fluttersampleapp/app/modules/contact/component/view_contact_page.dart';
import 'package:fluttersampleapp/app/modules/contact/contact_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttersampleapp/app/modules/contact/contact_page.dart';
import 'package:fluttersampleapp/app/modules/shared/repository/contact_repository.dart';

class ContactModule extends ChildModule {
  @override
  List<Bind> get binds => [
    new Bind((i) => new ContactBloc()),
    new Bind((i) => new ContactRepository()),
  ];

  @override
  List<Router> get routers => [
    new Router(Modular.initialRoute, child: (_, args) => new ContactPage()),
    //new Router(NavigationConstants.ADD_CONTACT, child: (_, args) => new AddContactPage()),
    //new Router(NavigationConstants.VIEW_CONTACT, child: (_, args) => new ViewContactPage()),
    //new Router(NavigationConstants.EDIT_CONTACT, child: (_, args) => new EditContactPage(contact: args.data,)),
  ];

  static Inject get to => Inject<ContactModule>.of();
}
