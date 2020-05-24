import 'package:fluttersampleapp/app/services/database/db_provider.dart';
import 'package:fluttersampleapp/app/utils/answer.dart';

abstract class BaseRepository<T> {
  DBProvider get dbProvider;

  Future<Answer> insert(T object);

  Future<Answer> update(T object);

  Future<Answer> delete(T object);

  Future<Answer> fetch({
    bool distinct,
    List<String> columns,
    String where,
    List whereArgs,
    String groupBy,
    String having,
    String orderBy,
    int limit,
    int offset
  });
}