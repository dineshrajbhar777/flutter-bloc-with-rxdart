abstract class BaseDao<T> {
  //queries
  String get createTableQuery;

  String get deleteTableQuery;

  //abstract mapping methods
  T fromMap(Map<String, dynamic> data);

  List<T> fromList(List<Map<String, dynamic>> data);

  Map<String, dynamic> toMap(T object);
}
