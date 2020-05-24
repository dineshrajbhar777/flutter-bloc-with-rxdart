import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttersampleapp/app/services/database/db_provider.dart';
import 'package:fluttersampleapp/app/utils/story.dart';

class Environment {
  static Future<void> setup() async {
    Story.storyline(story: "Environment.setup[+]");
    // Make sure that the binary messenger binding are properly initialiazed
    Story.storyline(story: "Environment.setup: WidgetsFlutterBinding.ensureInitialized");
    WidgetsFlutterBinding.ensureInitialized();

    // lock orientation position
    Story.storyline(story: "Environment.setup: set preferred orientations");
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    // transparent status bar
    Story.storyline(story: "Environment.setup: set systemUI overlay style");
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    // set debug
    Story.storyline(story: "Environment.setup: Story.DEBUG= true");
    Story.DEBUG= true;
    // initialize database
    Story.storyline(story: "Environment.setup: creating & initializing database");
    await DBProvider.dbProvider.createDB();
    Story.storyline(story: "Environment.setup[-]");
  }
}