import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttersampleapp/app/app_module.dart';
import 'package:fluttersampleapp/app/modules/contact/contact_bloc.dart';
import 'package:fluttersampleapp/app/modules/contact/contact_module.dart';

void main() {
  Modular.init(AppModule());
  Modular.bindModule(ContactModule());
  ContactBloc bloc;

  // setUp(() {
  //     bloc = ContactModule.to.get<ContactBloc>();
  // });

  // group('ContactBloc Test', () {
  //   test("First Test", () {
  //     expect(bloc, isInstanceOf<ContactBloc>());
  //   });
  // });
}
