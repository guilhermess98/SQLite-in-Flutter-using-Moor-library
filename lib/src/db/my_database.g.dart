// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Contato extends DataClass implements Insertable<Contato> {
  final int id;
  final String nome;
  final String email;
  Contato({@required this.id, @required this.nome, @required this.email});
  factory Contato.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Contato(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      nome: stringType.mapFromDatabaseResponse(data['${effectivePrefix}nome']),
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || nome != null) {
      map['nome'] = Variable<String>(nome);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    return map;
  }

  ContatosCompanion toCompanion(bool nullToAbsent) {
    return ContatosCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      nome: nome == null && nullToAbsent ? const Value.absent() : Value(nome),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
    );
  }

  factory Contato.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Contato(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      email: serializer.fromJson<String>(json['email']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'email': serializer.toJson<String>(email),
    };
  }

  Contato copyWith({int id, String nome, String email}) => Contato(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        email: email ?? this.email,
      );
  @override
  String toString() {
    return (StringBuffer('Contato(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(nome.hashCode, email.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Contato &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.email == this.email);
}

class ContatosCompanion extends UpdateCompanion<Contato> {
  final Value<int> id;
  final Value<String> nome;
  final Value<String> email;
  const ContatosCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.email = const Value.absent(),
  });
  ContatosCompanion.insert({
    this.id = const Value.absent(),
    @required String nome,
    @required String email,
  })  : nome = Value(nome),
        email = Value(email);
  static Insertable<Contato> custom({
    Expression<int> id,
    Expression<String> nome,
    Expression<String> email,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (email != null) 'email': email,
    });
  }

  ContatosCompanion copyWith(
      {Value<int> id, Value<String> nome, Value<String> email}) {
    return ContatosCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContatosCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }
}

class $ContatosTable extends Contatos with TableInfo<$ContatosTable, Contato> {
  final GeneratedDatabase _db;
  final String _alias;
  $ContatosTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nomeMeta = const VerificationMeta('nome');
  GeneratedTextColumn _nome;
  @override
  GeneratedTextColumn get nome => _nome ??= _constructNome();
  GeneratedTextColumn _constructNome() {
    return GeneratedTextColumn(
      'nome',
      $tableName,
      false,
    );
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  GeneratedTextColumn _email;
  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn(
      'email',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, nome, email];
  @override
  $ContatosTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'contatos';
  @override
  final String actualTableName = 'contatos';
  @override
  VerificationContext validateIntegrity(Insertable<Contato> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome'], _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email'], _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Contato map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Contato.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ContatosTable createAlias(String alias) {
    return $ContatosTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ContatosTable _contatos;
  $ContatosTable get contatos => _contatos ??= $ContatosTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [contatos];
}
