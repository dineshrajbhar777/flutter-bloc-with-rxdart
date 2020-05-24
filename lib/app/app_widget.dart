import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Roboto',
        primaryColor: Color(0xff121212),
        accentColor: Colors.blue,
        cardColor: Color(0xff121212),
        backgroundColor: Color(0xff000000),
        canvasColor: Colors.black,
        bottomAppBarColor: const Color(0xFF1B1C1E),
        primaryColorDark: Colors.black,
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
