
import 'dart:io';

import 'package:fluttersampleapp/app/constants/constants.dart';
import 'package:fluttersampleapp/app/utils/story.dart';
import 'package:path_provider/path_provider.dart';

class MediaStorage {
  static Future<Directory> getExternalDirectory() async {
    return await getExternalStorageDirectory();
  }

  static Future<Directory> getAppDocDirectory() async {
    return await getApplicationDocumentsDirectory();
  }
  
  static Future<Directory> getDirectory() async {
    if (Constants.APP_DIR_LOCATION == "APP_DOC") {
      return await getAppDocDirectory();
    } else { // AppDirLocation.EXTERNAL
      return await getExternalDirectory();
    }
  }

  static Future<String> getFilePath({String extension: ".jpg"}) async {
    Story.storyline(story: "MediaStorage.getFilePath[+]");
    String filePath= "";
    try {
      Directory appDir= await getDirectory();
      Story.storyline(story: "MediaStorage.getFilePath appDir: %s", args: [appDir]);
      String mediaDirPath= "${appDir.path}/media";
      Story.storyline(story: "MediaStorage.getFilePath mediaDirPath: %s", args: [mediaDirPath]);
      bool isMediaDirExist= await Directory(mediaDirPath).exists();
      Story.storyline(story: "MediaStorage.getFilePath isMediaDirExist: %s", args: [isMediaDirExist]);
      if (!isMediaDirExist) {
        await new Directory(mediaDirPath).create(recursive: true);
        Story.storyline(story: "MediaStorage.getFilePath directory created successfully.");
      }
      String fineName= new DateTime.now().millisecondsSinceEpoch.toString();
      Story.storyline(story: "MediaStorage.getFilePath fineName: %s", args: [fineName]);
      filePath = "$mediaDirPath/$fineName.$extension";
      Story.storyline(story: "MediaStorage.getFilePath filePath: %s", args: [filePath]);
    } catch (error) {
      Story.storyline(
        story: "MediaStorage.getFilePath: %s Failed to get filepath. ERROR: %s",
        args: [Constants.FAILED, error.toString()]
      );
    }
    Story.storyline(story: "MediaStorage.getFilePath[-]");
    return filePath;
  }

  static Future<bool> deleteFile(File file) async {
    Story.storyline(story: "MediaStorage.deleteFile[+]");
    bool status= true;
    if(file != null) {
      try {
        Story.storyline(story: "MediaStorage.deleteFile deleting file: %s", args: [file]);
        file.delete(recursive: true);
        Story.storyline(story: "MediaStorage.deleteFile file deleted successfully. ");
      } catch (error) {
        Story.storyline(
            story: "MediaStorage.deleteFile: %s Failed to get file. ERROR: %s",
            args: [Constants.FAILED, error.toString()]
        );
      }
    }
    Story.storyline(story: "MediaStorage.deleteFile[-]");
    return status;
  }

  static Future<bool> deleteFileByPath(String filepath) {
    Story.storyline(story: "MediaStorage.deleteFileByPath[+]");
    try {
      Story.storyline(story: "MediaStorage.deleteFileByPath deleting filepath: %s", args: filepath);
      File file= new File(filepath);
      bool isFileExist= file.existsSync();
      if(isFileExist == true) {
        file.delete(recursive: true);
        Story.storyline(story: "MediaStorage.deleteFileByPath file deleted successfully.");
      } else {
        Story.storyline(story: "MediaStorage.deleteFileByPath file does not exist.");
      }
    } catch (error) {
      Story.storyline(
          story: "MediaStorage.deleteFileByPath: %s Failed to get filepath. ERROR: %s",
          args: [Constants.FAILED, error.toString()]
      );
    }
    Story.storyline(story: "MediaStorage.deleteFileByPath[-]");
    return null;
  }
}