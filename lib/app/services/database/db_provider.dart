import 'dart:io';
import 'package:fluttersampleapp/app/constants/constants.dart';
import 'package:fluttersampleapp/app/modules/shared/dao/contact_dao.dart';
import 'package:fluttersampleapp/app/utils/answer.dart';
import 'package:fluttersampleapp/app/utils/story.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static final DBProvider dbProvider= new DBProvider();
  final String dbName= "panic_sos.db";
  Database _db= null;

  Future<Directory> getDirectory() async {
    return await getApplicationDocumentsDirectory();
  }

  Future<bool> initDB(Database db, int version) async {
    Story.storyline(story: "DBProvider.initDB[+]");
    Answer A= new Answer();
    ContactDao contactDao= new ContactDao();

    try {
      // table creation
      Story.storyline(story: "DBProvider.initDB: preaparing to initialize database.");
      await db.execute(contactDao.createTableQuery);
      Story.storyline(story: "DBProvider.initDB: table %s created successfully.", args: [contactDao.tableName]);

      A.msg= "Database initialized successfully.";
      Story.storyline(story: "DBProvider.initDB: %s %s", args: [Constants.SUCCESS, A.msg]);
    } catch(error) {
      Story.storyline(
        story: "DBProvider.initDB: %s Failed to initialize database. ERROR: %s",
        args: [Constants.FAILED, error.toString()]
      );
      A.rc= Constants.RC_INT_FAILED;
      A.msg= "Failed to initialize database.";
      A.reason= error.toString();
    } finally {
      contactDao= null;
    }
    Story.storyline(story: "DBProvider.initDB: %s", args: [A.details()]);
    Story.storyline(story: "DBProvider.initDB[-]");
    return A.rc == Constants.RC_INT_SUCCESS ? true : false;
  }

  Future<bool> onUpgrade(Database db, int oldVersion, int newVersion) async {
    Story.storyline(story: "DBProvider.onUpgrade[+]");
    Answer A= new Answer();
    Story.storyline(story: "DBProvider.onUpgrade: %s", args: [A.details()]);
    Story.storyline(story: "DBProvider.onUpgrade[-]");
    return A.rc == Constants.RC_INT_SUCCESS ? true : false;
  }

  Future<Database> createDB() async {
    Story.storyline(story: "DBProvider.createDB[+]");
    Database db;
    Directory dir;
    String dirPath;
    try {
      dir= await getDirectory();
      dirPath= "${dir.path}/$dbName";
      Story.storyline(story: "DBProvider.createDB: dbName: %s, dirPath: %s", args: [dbName, dirPath]);
      Story.storyline(story: "DBProvider.createDB: creating database.");
      db= await openDatabase(
          dirPath,
          version: 1,
          onCreate: initDB,
          onUpgrade: onUpgrade
      );
      Story.storyline(story: "DBProvider.createDB: %s Database created successfully.", args: [Constants.SUCCESS]);
    } catch(error) {
      Story.storyline(
        story: "DBProvider.createDB: %s Failed to create database. ERROR: %s",
        args: [Constants.FAILED, error.toString()]
      );
    } finally {
      dir= null; dirPath= null;
    }
    Story.storyline(story: "DBProvider.createDB[-]");
    return db;
  }

  Future<Database> openDB() async {
    Story.storyline(story: "DBProvider.openDB[+]");
    Database db;
    Directory dir;
    String dirPath;
    try {
      dir= await getDirectory();
      dirPath= "${dir.path}/$dbName";
      Story.storyline(story: "DBProvider.openDB: dbName: %s, dirPath: %s", args: [dbName, dirPath]);
      Story.storyline(story: "DBProvider.openDB: opening database.");
      db= await openDatabase(
          dirPath,
          version: 1,
      );
      Story.storyline(story: "DBProvider.openDB: %s Database opened successfully.", args: [Constants.SUCCESS]);
    } catch(error) {
      Story.storyline(
          story: "DBProvider.openDB: %s Failed to create database. ERROR: %s",
          args: [Constants.FAILED, error.toString()]
      );
    } finally {
      dir= null; dirPath= null;
    }
    Story.storyline(story: "DBProvider.openDB[-]");
    return db;
  }

  Future<Database> getDB() async {
    Story.storyline(story: "DBProvider.getDB[+]");
    if(_db == null) {
      _db= await openDB();
      Story.storyline(story: "DBProvider.getDB: opening _db: %s", args: [_db.toString()]);
    }else{
      Story.storyline(story: "DBProvider.getDB: using existing _db: %s", args: [_db.toString()]);
    }
    Story.storyline(story: "DBProvider.getDB[-]");
    return _db;
  }

  Future<void> closeDB() async {
    Story.storyline(story: "DBProvider.closeDB[+]");
    _db?.close();
    Story.storyline(story: "DBProvider.closeDB database closed successfully.");
    Story.storyline(story: "DBProvider.closeDB[-]");
  }
}