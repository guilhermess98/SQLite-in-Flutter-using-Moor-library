import 'package:moor_flutter/moor_flutter.dart';
import 'package:teste_moor/src/db/my_database.dart';

part 'ContatoDAO.g.dart';

@UseDao(tables: [Contatos])
class ContatoDAO extends DatabaseAccessor<MyDatabase> with _$ContatoDAOMixin {
  Stream<List<Contato>> listAll() {
    return (select(contatos)).watch();
  }

  Future addContato(Contato entity) {
    return into(contatos).insert(entity);
  }

  Future removeContato(id) {
    return (delete(contatos)..where((cont) => cont.id.equals(id))).go();
  }

  Future updateContato(Contato entity) {
    return update(contatos).replace(entity);
  }

  ContatoDAO(MyDatabase db) : super(db);
}
