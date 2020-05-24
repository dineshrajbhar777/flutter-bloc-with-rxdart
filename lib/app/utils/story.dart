import 'package:sprintf/sprintf.dart';

class Story {
  static bool DEBUG= false;
  static DateTime prevDateTime;

  static void storyline({ String story, var args }) {
    args= args==null ? [] : args;
    DateTime curDateTime= new DateTime.now();
    Duration diff= prevDateTime == null
      ? Duration(microseconds: 0)
      : curDateTime.difference(prevDateTime);
    String s= sprintf(story, args);
    s= sprintf("D:[%8s] %s", [diff.inMicroseconds, s]);
    print(s);
    prevDateTime= curDateTime;
  }
}