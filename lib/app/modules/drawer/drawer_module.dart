import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttersampleapp/app/modules/contact/contact_module.dart';
import 'package:fluttersampleapp/app/modules/drawer/drawer_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttersampleapp/app/modules/drawer/drawer_page.dart';

class DrawerModule extends WidgetModule {
  @override
  List<Bind> get binds => [
    new Bind((i) => new DrawerBloc()),
  ];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<DrawerModule>.of();

  @override
  // TODO: implement view
  Widget get view => new DrawerPage();
}
