import 'package:flutter/material.dart';
import 'package:fluttersampleapp/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttersampleapp/app/config/environment.dart';
import 'package:fluttersampleapp/app/utils/story.dart';

//void main() => runApp(ModularApp(module: AppModule()));

void main() async {
  Story.storyline(story: "main[+]");
  await Environment.setup();
  Story.storyline(story: "main initializing AppModule");
  AppModule appModule= new AppModule();
  Story.storyline(story: "main initializing ModularApp");
  ModularApp modularApp= new ModularApp(module: appModule);
  Story.storyline(story: "main running ModularApp");
  runApp(modularApp);
  appModule= null;
  modularApp= null;
  Story.storyline(story: "main[-]");
}
