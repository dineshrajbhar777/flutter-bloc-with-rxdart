import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttersampleapp/app/app_module.dart';
import 'package:fluttersampleapp/app/modules/drawer/drawer_bloc.dart';
import 'package:fluttersampleapp/app/modules/drawer/drawer_module.dart';

void main() {
  Modular.init(AppModule());
  Modular.bindModule(DrawerModule());
  DrawerBloc bloc;

  // setUp(() {
  //     bloc = DrawerModule.to.get<DrawerBloc>();
  // });

  // group('DrawerBloc Test', () {
  //   test("First Test", () {
  //     expect(bloc, isInstanceOf<DrawerBloc>());
  //   });
  // });
}
