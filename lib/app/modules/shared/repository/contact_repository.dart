import 'package:fluttersampleapp/app/constants/constants.dart';
import 'package:fluttersampleapp/app/modules/shared/dao/contact_dao.dart';
import 'package:fluttersampleapp/app/modules/shared/models/contact.dart';
import 'package:fluttersampleapp/app/modules/shared/repository/base_repository.dart';
import 'package:fluttersampleapp/app/services/database/db_provider.dart';
import 'package:fluttersampleapp/app/utils/answer.dart';
import 'package:fluttersampleapp/app/utils/story.dart';
import 'package:sqflite/sqflite.dart';

class ContactRepository implements BaseRepository<Contact> {
  final dao= new ContactDao();

  @override
  DBProvider get dbProvider => DBProvider.dbProvider;

  @override
  Future<Answer> insert(Contact contact) async {
    Story.storyline(story: "ContactRepository.insert[+]");
    Answer A= new Answer();
    final db= await dbProvider.getDB();
    try {
      if(db != null){
        contact.id= await db.insert(dao.tableName, dao.toMap(contact));
        A.rc= Constants.RC_INT_SUCCESS;
        A.pkid= contact.id;
        A.data= [contact];
        A.msg= "Contact added successfully.";
        Story.storyline(story: "ContactRepository.insert %s", args: [A.msg]);
      } else {
        Story.storyline(story: "ContactRepository.insert ERROR: Unable to get database.");
        A.rc= Constants.RC_INT_FAILED;
        A.msg= "Unable to get database.";
        A.reason= "Unable to get database.";
      }
    } catch(error) {
      Story.storyline(
        story: "ContactRepository.insert ERROR: %s",
        args: [error.toString()]
      );
      A.rc= Constants.RC_INT_FAILED;
      A.msg= "Failed to insert contact record.";
      A.reason= error.toString();
    }
    Story.storyline(
      story: "ContactRepository.insert A.details: %s",
      args: [A.details()]
    );
    Story.storyline(story: "ContactRepository.insert[-]");
    return A;
  }

  @override
  Future<Answer> update(Contact contact) async {
    Story.storyline(story: "ContactRepository.update[+]");
    Answer A= new Answer();
    final db= await dbProvider.getDB();
    try {
      if(db != null){
        await db.update(
          dao.tableName, dao.toMap(contact),
          where: "${dao.columnId} = ?",
          whereArgs: [contact.id]
        );
        A.pkid= contact.id;
        A.data= [contact];
        A.msg= "Contact updated successfully.";
        Story.storyline(story: "ContactRepository.update %s", args: [A.msg]);
      } else {
        Story.storyline(story: "ContactRepository.update ERROR: Unable to get database.");
        A.rc= Constants.RC_INT_FAILED;
        A.msg= "Unable to get database.";
        A.reason= "Unable to get database.";
      }
    } catch(error) {
      Story.storyline(
        story: "ContactRepository.update ERROR: %s",
        args: [error.toString()]
      );
      A.rc= Constants.RC_INT_FAILED;
      A.msg= "Failed to update contact record.";
      A.reason= error.toString();
    }
    Story.storyline(
      story: "ContactRepository.update A.details: %s",
      args: [A.details()]
    );
    Story.storyline(story: "ContactRepository.update[-]");
    return A;
  }

  @override
  Future<Answer> delete(Contact contact) async {
    Story.storyline(story: "ContactRepository.delete[+]");
    Answer A= new Answer();
    final db= await dbProvider.getDB();
    try {
      if(db != null){
        await db.delete(
          dao.tableName,
          where: "${dao.columnId} = ?",
          whereArgs: [contact.id]
        );
        A.pkid= contact.id;
        A.data= [contact];
        A.msg= "Contact deleted successfully.";
        Story.storyline(story: "ContactRepository.delete %s", args: [A.msg]);
      } else {
        Story.storyline(story: "ContactRepository.delete ERROR: Unable to get database.");
        A.rc= Constants.RC_INT_FAILED;
        A.msg= "Unable to get database.";
        A.reason= "Unable to get database.";
      }
    } catch(error) {
      Story.storyline(
        story: "ContactRepository.delete ERROR: %s",
        args: [error.toString()]
      );
      A.rc= Constants.RC_INT_FAILED;
      A.msg= "Failed to delete contact record.";
      A.reason= error.toString();
    }
    Story.storyline(
      story: "ContactRepository.delete A.details: %s",
      args: [A.details()]
    );
    Story.storyline(story: "ContactRepository.delete[-]");
    return A;
  }

  @override
  Future<Answer> fetch({
    bool distinct, List<String> columns,
    String where, List whereArgs,
    String groupBy, String having,
    String orderBy= "name",
    int limit, int offset }) async {
    Story.storyline(story: "ContactRepository.fetch[+]");
    if(distinct != null)
      Story.storyline(story: "ContactRepository.fetch distinct:  %s", args: [distinct]);
    if(columns != null)
      Story.storyline(story: "ContactRepository.fetch columns:   %s", args: [columns]);
    if(where != null)
      Story.storyline(story: "ContactRepository.fetch where:     %s", args: [where]);
    if(whereArgs != null)
      Story.storyline(story: "ContactRepository.fetch whereArgs: %s", args: [whereArgs]);
    if(groupBy != null)
      Story.storyline(story: "ContactRepository.fetch groupBy:   %s", args: [groupBy]);
    if(having != null)
      Story.storyline(story: "ContactRepository.fetch having:    %s", args: [having]);
    if(orderBy != null)
      Story.storyline(story: "ContactRepository.fetch orderBy:   %s", args: [orderBy]);
    if(limit != null)
      Story.storyline(story: "ContactRepository.fetch limit:     %s", args: [limit]);
    if(offset != null)
      Story.storyline(story: "ContactRepository.fetch offset:    %s", args: [offset]);

    Answer A= new Answer();
    final db= await dbProvider.getDB();
    try {
      if(db != null){
        List<Map> maps= await db.query(dao.tableName,
          distinct: distinct, columns: columns,
          where: where, whereArgs: whereArgs,
          groupBy: groupBy, having: having,
          orderBy: orderBy,
          limit: limit, offset: offset,
        );
        A.data= dao.fromList(maps);
        A.msg= "Contact fetched successfully.";
        Story.storyline(story: "ContactRepository.fetch %s", args: [A.msg]);
      } else {
        Story.storyline(story: "ContactRepository.fetch ERROR: Unable to get database.");
        A.rc= Constants.RC_INT_FAILED;
        A.msg= "Unable to get database.";
        A.reason= "Unable to get database.";
      }
    } catch(error) {
      Story.storyline(
        story: "ContactRepository.fetch ERROR: %s",
        args: [error.toString()]
      );
      A.rc= Constants.RC_INT_FAILED;
      A.msg= "Failed to fetch contact record.";
      A.reason= error.toString();
    }
    Story.storyline(
      story: "ContactRepository.fetch A.details: %s",
      args: [A.details()]
    );
    Story.storyline(story: "ContactRepository.fetch[-]");
    return A;
  }

  Future<int> queryRowCount(String query, List<dynamic> argument) async {
    Story.storyline(story: "ContactRepository.queryRowCount[+]");
    final db= await dbProvider.getDB();
    int count= 0;
    try {
      if(db != null) {
        if(query == null) {
          query= "SELECT count(1) FROM ${dao.tableName};";
        }
        int count= Sqflite.firstIntValue(await db.rawQuery(query, argument));
        Story.storyline(story: "ContactRepository.queryRowCount: %s", args: [count]);
      } else {
        Story.storyline(story: "ContactRepository.queryRowCount ERROR: Unable to get database.");
        count= -1;
      }
    } catch(error) {
      Story.storyline(
        story: "ContactRepository.queryRowCount ERROR: %s",
        args: [error.toString()]
      );
      count= -1;
    }
    Story.storyline(story: "ContactRepository.queryRowCount[-]");
    return count;
  }
}