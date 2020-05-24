import 'package:fluttersampleapp/app/modules/shared/dao/base_dao.dart';
import 'package:fluttersampleapp/app/modules/shared/models/contact.dart';

class ContactDao implements BaseDao<Contact> {
  final String tableName= "Contact";
  final String columnId= "id";
  final String columnName= "name";
  final String columnPhone= "phone";
  final String columnEmail= "email";
  final String columnCategory= "category";
  final String columnEnable= "enable";

  @override
  String get createTableQuery =>
      "CREATE TABLE $tableName ( "
          " $columnId       INTEGER PRIMARY KEY AUTOINCREMENT , "
          " $columnName     TEXT    NOT NULL, "
          " $columnPhone    TEXT    NOT NULL, "
          " $columnEmail    TEXT    NOT NULL, "
          " $columnCategory TEXT    NOT NULL, "
          " $columnEnable      INTEGER NOT NULL DEFAULT 1, "
          " UNIQUE($columnName, $columnPhone, $columnEmail) "
          " );";

  @override
  String get deleteTableQuery => "DROP TABLE $tableName;";

  @override
  Contact fromMap(Map<String, dynamic> query) {
    Contact contact= Contact(
      id:       query["id"],
      name:     query["name"],
      phone:    query["phone"],
      email:    query["email"],
      category: query["category"],
      enable:   query["enable"]  == 0 ? false : true,
    );
    return contact;
  }

  @override
  Map<String, dynamic> toMap(Contact object) {
    return <String, dynamic>{
      "id":       object.id,
      "name":     object.name,
      "phone":    object.phone,
      "email":    object.email,
      "category": object.category,
      "enable":   object.enable   == false ? 0 : 1,
    };
  }

  @override
  List<Contact> fromList(List<Map<String, dynamic>> query) {
    List<Contact> contacts= new List<Contact>();
    for(Map map in query){
      contacts.add(fromMap(map));
    }
    return contacts;
  }
}
