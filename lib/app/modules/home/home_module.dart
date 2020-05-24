import 'package:fluttersampleapp/app/modules/drawer/drawer_page.dart';
import 'package:fluttersampleapp/app/modules/home/home_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttersampleapp/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
    new Bind((i) => new HomeBloc()),
    new Bind((i) => new DrawerPage()),
  ];

  @override
  List<Router> get routers => [
    new Router(Modular.initialRoute, child: (_, args) => new HomePage()),
  ];

  static Inject get to => Inject<HomeModule>.of();
}
