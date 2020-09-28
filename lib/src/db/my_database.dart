import 'package:moor_flutter/moor_flutter.dart';
import 'dao/ContatoDAO.dart';

part 'my_database.g.dart';

class Contatos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nome => text()();
  TextColumn get email => text()();
}

@UseMoor(tables: [Contatos])
class MyDatabase extends _$MyDatabase {
  static MyDatabase instance = MyDatabase._internal();

  ContatoDAO contatoDAO;

  MyDatabase._internal()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite')) {
    contatoDAO = ContatoDAO(this);
  }

  @override
  int get schemaVersion => 1;
}
