// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $WarehousesTable extends Warehouses
    with TableInfo<$WarehousesTable, WarehouseTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WarehousesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, createdAt, name, address];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'warehouses';
  @override
  VerificationContext validateIntegrity(
    Insertable<WarehouseTable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WarehouseTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WarehouseTable(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
    );
  }

  @override
  $WarehousesTable createAlias(String alias) {
    return $WarehousesTable(attachedDatabase, alias);
  }
}

class WarehouseTable extends DataClass implements Insertable<WarehouseTable> {
  final int id;
  final DateTime createdAt;
  final String name;
  final String address;
  const WarehouseTable({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.address,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['name'] = Variable<String>(name);
    map['address'] = Variable<String>(address);
    return map;
  }

  WarehousesCompanion toCompanion(bool nullToAbsent) {
    return WarehousesCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      name: Value(name),
      address: Value(address),
    );
  }

  factory WarehouseTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WarehouseTable(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String>(json['address']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String>(address),
    };
  }

  WarehouseTable copyWith({
    int? id,
    DateTime? createdAt,
    String? name,
    String? address,
  }) => WarehouseTable(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    name: name ?? this.name,
    address: address ?? this.address,
  );
  WarehouseTable copyWithCompanion(WarehousesCompanion data) {
    return WarehouseTable(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      name: data.name.present ? data.name.value : this.name,
      address: data.address.present ? data.address.value : this.address,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WarehouseTable(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('name: $name, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, name, address);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WarehouseTable &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.name == this.name &&
          other.address == this.address);
}

class WarehousesCompanion extends UpdateCompanion<WarehouseTable> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<String> name;
  final Value<String> address;
  const WarehousesCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
  });
  WarehousesCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required String name,
    required String address,
  }) : name = Value(name),
       address = Value(address);
  static Insertable<WarehouseTable> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<String>? name,
    Expression<String>? address,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
    });
  }

  WarehousesCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? createdAt,
    Value<String>? name,
    Value<String>? address,
  }) {
    return WarehousesCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      address: address ?? this.address,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WarehousesCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('name: $name, ')
          ..write('address: $address')
          ..write(')'))
        .toString();
  }
}

class $ClientsTable extends Clients with TableInfo<$ClientsTable, ClientTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _fullnameMeta = const VerificationMeta(
    'fullname',
  );
  @override
  late final GeneratedColumn<String> fullname = GeneratedColumn<String>(
    'fullname',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 220),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 220),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 220),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _secretKeyMeta = const VerificationMeta(
    'secretKey',
  );
  @override
  late final GeneratedColumn<String> secretKey = GeneratedColumn<String>(
    'secret_key',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 220),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    fullname,
    phone,
    address,
    secretKey,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'clients';
  @override
  VerificationContext validateIntegrity(
    Insertable<ClientTable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('fullname')) {
      context.handle(
        _fullnameMeta,
        fullname.isAcceptableOrUnknown(data['fullname']!, _fullnameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullnameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('secret_key')) {
      context.handle(
        _secretKeyMeta,
        secretKey.isAcceptableOrUnknown(data['secret_key']!, _secretKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_secretKeyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ClientTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClientTable(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      fullname: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fullname'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      secretKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}secret_key'],
      )!,
    );
  }

  @override
  $ClientsTable createAlias(String alias) {
    return $ClientsTable(attachedDatabase, alias);
  }
}

class ClientTable extends DataClass implements Insertable<ClientTable> {
  final int id;
  final DateTime createdAt;
  final String fullname;
  final String? phone;
  final String? address;
  final String secretKey;
  const ClientTable({
    required this.id,
    required this.createdAt,
    required this.fullname,
    this.phone,
    this.address,
    required this.secretKey,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['fullname'] = Variable<String>(fullname);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    map['secret_key'] = Variable<String>(secretKey);
    return map;
  }

  ClientsCompanion toCompanion(bool nullToAbsent) {
    return ClientsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      fullname: Value(fullname),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      secretKey: Value(secretKey),
    );
  }

  factory ClientTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClientTable(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      fullname: serializer.fromJson<String>(json['fullname']),
      phone: serializer.fromJson<String?>(json['phone']),
      address: serializer.fromJson<String?>(json['address']),
      secretKey: serializer.fromJson<String>(json['secretKey']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'fullname': serializer.toJson<String>(fullname),
      'phone': serializer.toJson<String?>(phone),
      'address': serializer.toJson<String?>(address),
      'secretKey': serializer.toJson<String>(secretKey),
    };
  }

  ClientTable copyWith({
    int? id,
    DateTime? createdAt,
    String? fullname,
    Value<String?> phone = const Value.absent(),
    Value<String?> address = const Value.absent(),
    String? secretKey,
  }) => ClientTable(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    fullname: fullname ?? this.fullname,
    phone: phone.present ? phone.value : this.phone,
    address: address.present ? address.value : this.address,
    secretKey: secretKey ?? this.secretKey,
  );
  ClientTable copyWithCompanion(ClientsCompanion data) {
    return ClientTable(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      fullname: data.fullname.present ? data.fullname.value : this.fullname,
      phone: data.phone.present ? data.phone.value : this.phone,
      address: data.address.present ? data.address.value : this.address,
      secretKey: data.secretKey.present ? data.secretKey.value : this.secretKey,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClientTable(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('fullname: $fullname, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('secretKey: $secretKey')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, createdAt, fullname, phone, address, secretKey);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClientTable &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.fullname == this.fullname &&
          other.phone == this.phone &&
          other.address == this.address &&
          other.secretKey == this.secretKey);
}

class ClientsCompanion extends UpdateCompanion<ClientTable> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<String> fullname;
  final Value<String?> phone;
  final Value<String?> address;
  final Value<String> secretKey;
  const ClientsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.fullname = const Value.absent(),
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    this.secretKey = const Value.absent(),
  });
  ClientsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required String fullname,
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    required String secretKey,
  }) : fullname = Value(fullname),
       secretKey = Value(secretKey);
  static Insertable<ClientTable> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<String>? fullname,
    Expression<String>? phone,
    Expression<String>? address,
    Expression<String>? secretKey,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (fullname != null) 'fullname': fullname,
      if (phone != null) 'phone': phone,
      if (address != null) 'address': address,
      if (secretKey != null) 'secret_key': secretKey,
    });
  }

  ClientsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? createdAt,
    Value<String>? fullname,
    Value<String?>? phone,
    Value<String?>? address,
    Value<String>? secretKey,
  }) {
    return ClientsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      fullname: fullname ?? this.fullname,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      secretKey: secretKey ?? this.secretKey,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (fullname.present) {
      map['fullname'] = Variable<String>(fullname.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (secretKey.present) {
      map['secret_key'] = Variable<String>(secretKey.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('fullname: $fullname, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('secretKey: $secretKey')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products
    with TableInfo<$ProductsTable, ProductTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 220),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imgUrlMeta = const VerificationMeta('imgUrl');
  @override
  late final GeneratedColumn<String> imgUrl = GeneratedColumn<String>(
    'img_url',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 320),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _buyPriceMeta = const VerificationMeta(
    'buyPrice',
  );
  @override
  late final GeneratedColumn<double> buyPrice = GeneratedColumn<double>(
    'buy_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sellPriceMeta = const VerificationMeta(
    'sellPrice',
  );
  @override
  late final GeneratedColumn<double> sellPrice = GeneratedColumn<double>(
    'sell_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    name,
    imgUrl,
    buyPrice,
    sellPrice,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductTable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('img_url')) {
      context.handle(
        _imgUrlMeta,
        imgUrl.isAcceptableOrUnknown(data['img_url']!, _imgUrlMeta),
      );
    }
    if (data.containsKey('buy_price')) {
      context.handle(
        _buyPriceMeta,
        buyPrice.isAcceptableOrUnknown(data['buy_price']!, _buyPriceMeta),
      );
    } else if (isInserting) {
      context.missing(_buyPriceMeta);
    }
    if (data.containsKey('sell_price')) {
      context.handle(
        _sellPriceMeta,
        sellPrice.isAcceptableOrUnknown(data['sell_price']!, _sellPriceMeta),
      );
    } else if (isInserting) {
      context.missing(_sellPriceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductTable(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      imgUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}img_url'],
      ),
      buyPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}buy_price'],
      )!,
      sellPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sell_price'],
      )!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class ProductTable extends DataClass implements Insertable<ProductTable> {
  final int id;
  final DateTime createdAt;
  final String name;
  final String? imgUrl;
  final double buyPrice;
  final double sellPrice;
  const ProductTable({
    required this.id,
    required this.createdAt,
    required this.name,
    this.imgUrl,
    required this.buyPrice,
    required this.sellPrice,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || imgUrl != null) {
      map['img_url'] = Variable<String>(imgUrl);
    }
    map['buy_price'] = Variable<double>(buyPrice);
    map['sell_price'] = Variable<double>(sellPrice);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      name: Value(name),
      imgUrl: imgUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imgUrl),
      buyPrice: Value(buyPrice),
      sellPrice: Value(sellPrice),
    );
  }

  factory ProductTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductTable(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      name: serializer.fromJson<String>(json['name']),
      imgUrl: serializer.fromJson<String?>(json['imgUrl']),
      buyPrice: serializer.fromJson<double>(json['buyPrice']),
      sellPrice: serializer.fromJson<double>(json['sellPrice']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'name': serializer.toJson<String>(name),
      'imgUrl': serializer.toJson<String?>(imgUrl),
      'buyPrice': serializer.toJson<double>(buyPrice),
      'sellPrice': serializer.toJson<double>(sellPrice),
    };
  }

  ProductTable copyWith({
    int? id,
    DateTime? createdAt,
    String? name,
    Value<String?> imgUrl = const Value.absent(),
    double? buyPrice,
    double? sellPrice,
  }) => ProductTable(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    name: name ?? this.name,
    imgUrl: imgUrl.present ? imgUrl.value : this.imgUrl,
    buyPrice: buyPrice ?? this.buyPrice,
    sellPrice: sellPrice ?? this.sellPrice,
  );
  ProductTable copyWithCompanion(ProductsCompanion data) {
    return ProductTable(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      name: data.name.present ? data.name.value : this.name,
      imgUrl: data.imgUrl.present ? data.imgUrl.value : this.imgUrl,
      buyPrice: data.buyPrice.present ? data.buyPrice.value : this.buyPrice,
      sellPrice: data.sellPrice.present ? data.sellPrice.value : this.sellPrice,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductTable(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('name: $name, ')
          ..write('imgUrl: $imgUrl, ')
          ..write('buyPrice: $buyPrice, ')
          ..write('sellPrice: $sellPrice')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, createdAt, name, imgUrl, buyPrice, sellPrice);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductTable &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.name == this.name &&
          other.imgUrl == this.imgUrl &&
          other.buyPrice == this.buyPrice &&
          other.sellPrice == this.sellPrice);
}

class ProductsCompanion extends UpdateCompanion<ProductTable> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<String> name;
  final Value<String?> imgUrl;
  final Value<double> buyPrice;
  final Value<double> sellPrice;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.name = const Value.absent(),
    this.imgUrl = const Value.absent(),
    this.buyPrice = const Value.absent(),
    this.sellPrice = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required String name,
    this.imgUrl = const Value.absent(),
    required double buyPrice,
    required double sellPrice,
  }) : name = Value(name),
       buyPrice = Value(buyPrice),
       sellPrice = Value(sellPrice);
  static Insertable<ProductTable> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<String>? name,
    Expression<String>? imgUrl,
    Expression<double>? buyPrice,
    Expression<double>? sellPrice,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (name != null) 'name': name,
      if (imgUrl != null) 'img_url': imgUrl,
      if (buyPrice != null) 'buy_price': buyPrice,
      if (sellPrice != null) 'sell_price': sellPrice,
    });
  }

  ProductsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? createdAt,
    Value<String>? name,
    Value<String?>? imgUrl,
    Value<double>? buyPrice,
    Value<double>? sellPrice,
  }) {
    return ProductsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      buyPrice: buyPrice ?? this.buyPrice,
      sellPrice: sellPrice ?? this.sellPrice,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (imgUrl.present) {
      map['img_url'] = Variable<String>(imgUrl.value);
    }
    if (buyPrice.present) {
      map['buy_price'] = Variable<double>(buyPrice.value);
    }
    if (sellPrice.present) {
      map['sell_price'] = Variable<double>(sellPrice.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('name: $name, ')
          ..write('imgUrl: $imgUrl, ')
          ..write('buyPrice: $buyPrice, ')
          ..write('sellPrice: $sellPrice')
          ..write(')'))
        .toString();
  }
}

class $WarehouseProductsTable extends WarehouseProducts
    with TableInfo<$WarehouseProductsTable, WarehouseProductTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WarehouseProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productStatusMeta = const VerificationMeta(
    'productStatus',
  );
  @override
  late final GeneratedColumn<int> productStatus = GeneratedColumn<int>(
    'product_status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _warehouseIdMeta = const VerificationMeta(
    'warehouseId',
  );
  @override
  late final GeneratedColumn<int> warehouseId = GeneratedColumn<int>(
    'warehouse_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES warehouses (id)',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES products (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    quantity,
    productStatus,
    warehouseId,
    productId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'warehouse_products';
  @override
  VerificationContext validateIntegrity(
    Insertable<WarehouseProductTable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('product_status')) {
      context.handle(
        _productStatusMeta,
        productStatus.isAcceptableOrUnknown(
          data['product_status']!,
          _productStatusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_productStatusMeta);
    }
    if (data.containsKey('warehouse_id')) {
      context.handle(
        _warehouseIdMeta,
        warehouseId.isAcceptableOrUnknown(
          data['warehouse_id']!,
          _warehouseIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_warehouseIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WarehouseProductTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WarehouseProductTable(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      productStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product_status'],
      )!,
      warehouseId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}warehouse_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product_id'],
      )!,
    );
  }

  @override
  $WarehouseProductsTable createAlias(String alias) {
    return $WarehouseProductsTable(attachedDatabase, alias);
  }
}

class WarehouseProductTable extends DataClass
    implements Insertable<WarehouseProductTable> {
  final int id;
  final DateTime createdAt;
  final int quantity;
  final int productStatus;
  final int warehouseId;
  final int productId;
  const WarehouseProductTable({
    required this.id,
    required this.createdAt,
    required this.quantity,
    required this.productStatus,
    required this.warehouseId,
    required this.productId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['quantity'] = Variable<int>(quantity);
    map['product_status'] = Variable<int>(productStatus);
    map['warehouse_id'] = Variable<int>(warehouseId);
    map['product_id'] = Variable<int>(productId);
    return map;
  }

  WarehouseProductsCompanion toCompanion(bool nullToAbsent) {
    return WarehouseProductsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      quantity: Value(quantity),
      productStatus: Value(productStatus),
      warehouseId: Value(warehouseId),
      productId: Value(productId),
    );
  }

  factory WarehouseProductTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WarehouseProductTable(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      quantity: serializer.fromJson<int>(json['quantity']),
      productStatus: serializer.fromJson<int>(json['productStatus']),
      warehouseId: serializer.fromJson<int>(json['warehouseId']),
      productId: serializer.fromJson<int>(json['productId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'quantity': serializer.toJson<int>(quantity),
      'productStatus': serializer.toJson<int>(productStatus),
      'warehouseId': serializer.toJson<int>(warehouseId),
      'productId': serializer.toJson<int>(productId),
    };
  }

  WarehouseProductTable copyWith({
    int? id,
    DateTime? createdAt,
    int? quantity,
    int? productStatus,
    int? warehouseId,
    int? productId,
  }) => WarehouseProductTable(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    quantity: quantity ?? this.quantity,
    productStatus: productStatus ?? this.productStatus,
    warehouseId: warehouseId ?? this.warehouseId,
    productId: productId ?? this.productId,
  );
  WarehouseProductTable copyWithCompanion(WarehouseProductsCompanion data) {
    return WarehouseProductTable(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      productStatus: data.productStatus.present
          ? data.productStatus.value
          : this.productStatus,
      warehouseId: data.warehouseId.present
          ? data.warehouseId.value
          : this.warehouseId,
      productId: data.productId.present ? data.productId.value : this.productId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WarehouseProductTable(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('quantity: $quantity, ')
          ..write('productStatus: $productStatus, ')
          ..write('warehouseId: $warehouseId, ')
          ..write('productId: $productId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    quantity,
    productStatus,
    warehouseId,
    productId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WarehouseProductTable &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.quantity == this.quantity &&
          other.productStatus == this.productStatus &&
          other.warehouseId == this.warehouseId &&
          other.productId == this.productId);
}

class WarehouseProductsCompanion
    extends UpdateCompanion<WarehouseProductTable> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<int> quantity;
  final Value<int> productStatus;
  final Value<int> warehouseId;
  final Value<int> productId;
  const WarehouseProductsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.quantity = const Value.absent(),
    this.productStatus = const Value.absent(),
    this.warehouseId = const Value.absent(),
    this.productId = const Value.absent(),
  });
  WarehouseProductsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required int quantity,
    required int productStatus,
    required int warehouseId,
    required int productId,
  }) : quantity = Value(quantity),
       productStatus = Value(productStatus),
       warehouseId = Value(warehouseId),
       productId = Value(productId);
  static Insertable<WarehouseProductTable> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<int>? quantity,
    Expression<int>? productStatus,
    Expression<int>? warehouseId,
    Expression<int>? productId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (quantity != null) 'quantity': quantity,
      if (productStatus != null) 'product_status': productStatus,
      if (warehouseId != null) 'warehouse_id': warehouseId,
      if (productId != null) 'product_id': productId,
    });
  }

  WarehouseProductsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? createdAt,
    Value<int>? quantity,
    Value<int>? productStatus,
    Value<int>? warehouseId,
    Value<int>? productId,
  }) {
    return WarehouseProductsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      quantity: quantity ?? this.quantity,
      productStatus: productStatus ?? this.productStatus,
      warehouseId: warehouseId ?? this.warehouseId,
      productId: productId ?? this.productId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (productStatus.present) {
      map['product_status'] = Variable<int>(productStatus.value);
    }
    if (warehouseId.present) {
      map['warehouse_id'] = Variable<int>(warehouseId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WarehouseProductsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('quantity: $quantity, ')
          ..write('productStatus: $productStatus, ')
          ..write('warehouseId: $warehouseId, ')
          ..write('productId: $productId')
          ..write(')'))
        .toString();
  }
}

class $ClientProductsTable extends ClientProducts
    with TableInfo<$ClientProductsTable, ClientProductTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _specialPriceMeta = const VerificationMeta(
    'specialPrice',
  );
  @override
  late final GeneratedColumn<double> specialPrice = GeneratedColumn<double>(
    'special_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<int> clientId = GeneratedColumn<int>(
    'client_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES clients (id)',
    ),
  );
  static const VerificationMeta _warehouseProductIdMeta =
      const VerificationMeta('warehouseProductId');
  @override
  late final GeneratedColumn<int> warehouseProductId = GeneratedColumn<int>(
    'warehouse_product_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES warehouse_products (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    specialPrice,
    clientId,
    warehouseProductId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'client_products';
  @override
  VerificationContext validateIntegrity(
    Insertable<ClientProductTable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('special_price')) {
      context.handle(
        _specialPriceMeta,
        specialPrice.isAcceptableOrUnknown(
          data['special_price']!,
          _specialPriceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_specialPriceMeta);
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('warehouse_product_id')) {
      context.handle(
        _warehouseProductIdMeta,
        warehouseProductId.isAcceptableOrUnknown(
          data['warehouse_product_id']!,
          _warehouseProductIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_warehouseProductIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ClientProductTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClientProductTable(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      specialPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}special_price'],
      )!,
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}client_id'],
      )!,
      warehouseProductId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}warehouse_product_id'],
      )!,
    );
  }

  @override
  $ClientProductsTable createAlias(String alias) {
    return $ClientProductsTable(attachedDatabase, alias);
  }
}

class ClientProductTable extends DataClass
    implements Insertable<ClientProductTable> {
  final int id;
  final DateTime createdAt;
  final double specialPrice;
  final int clientId;
  final int warehouseProductId;
  const ClientProductTable({
    required this.id,
    required this.createdAt,
    required this.specialPrice,
    required this.clientId,
    required this.warehouseProductId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['special_price'] = Variable<double>(specialPrice);
    map['client_id'] = Variable<int>(clientId);
    map['warehouse_product_id'] = Variable<int>(warehouseProductId);
    return map;
  }

  ClientProductsCompanion toCompanion(bool nullToAbsent) {
    return ClientProductsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      specialPrice: Value(specialPrice),
      clientId: Value(clientId),
      warehouseProductId: Value(warehouseProductId),
    );
  }

  factory ClientProductTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClientProductTable(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      specialPrice: serializer.fromJson<double>(json['specialPrice']),
      clientId: serializer.fromJson<int>(json['clientId']),
      warehouseProductId: serializer.fromJson<int>(json['warehouseProductId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'specialPrice': serializer.toJson<double>(specialPrice),
      'clientId': serializer.toJson<int>(clientId),
      'warehouseProductId': serializer.toJson<int>(warehouseProductId),
    };
  }

  ClientProductTable copyWith({
    int? id,
    DateTime? createdAt,
    double? specialPrice,
    int? clientId,
    int? warehouseProductId,
  }) => ClientProductTable(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    specialPrice: specialPrice ?? this.specialPrice,
    clientId: clientId ?? this.clientId,
    warehouseProductId: warehouseProductId ?? this.warehouseProductId,
  );
  ClientProductTable copyWithCompanion(ClientProductsCompanion data) {
    return ClientProductTable(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      specialPrice: data.specialPrice.present
          ? data.specialPrice.value
          : this.specialPrice,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      warehouseProductId: data.warehouseProductId.present
          ? data.warehouseProductId.value
          : this.warehouseProductId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClientProductTable(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('specialPrice: $specialPrice, ')
          ..write('clientId: $clientId, ')
          ..write('warehouseProductId: $warehouseProductId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, createdAt, specialPrice, clientId, warehouseProductId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClientProductTable &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.specialPrice == this.specialPrice &&
          other.clientId == this.clientId &&
          other.warehouseProductId == this.warehouseProductId);
}

class ClientProductsCompanion extends UpdateCompanion<ClientProductTable> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<double> specialPrice;
  final Value<int> clientId;
  final Value<int> warehouseProductId;
  const ClientProductsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.specialPrice = const Value.absent(),
    this.clientId = const Value.absent(),
    this.warehouseProductId = const Value.absent(),
  });
  ClientProductsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required double specialPrice,
    required int clientId,
    required int warehouseProductId,
  }) : specialPrice = Value(specialPrice),
       clientId = Value(clientId),
       warehouseProductId = Value(warehouseProductId);
  static Insertable<ClientProductTable> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<double>? specialPrice,
    Expression<int>? clientId,
    Expression<int>? warehouseProductId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (specialPrice != null) 'special_price': specialPrice,
      if (clientId != null) 'client_id': clientId,
      if (warehouseProductId != null)
        'warehouse_product_id': warehouseProductId,
    });
  }

  ClientProductsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? createdAt,
    Value<double>? specialPrice,
    Value<int>? clientId,
    Value<int>? warehouseProductId,
  }) {
    return ClientProductsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      specialPrice: specialPrice ?? this.specialPrice,
      clientId: clientId ?? this.clientId,
      warehouseProductId: warehouseProductId ?? this.warehouseProductId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (specialPrice.present) {
      map['special_price'] = Variable<double>(specialPrice.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<int>(clientId.value);
    }
    if (warehouseProductId.present) {
      map['warehouse_product_id'] = Variable<int>(warehouseProductId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientProductsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('specialPrice: $specialPrice, ')
          ..write('clientId: $clientId, ')
          ..write('warehouseProductId: $warehouseProductId')
          ..write(')'))
        .toString();
  }
}

class $OrdersTable extends Orders with TableInfo<$OrdersTable, OrderTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrdersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _totalAmountMeta = const VerificationMeta(
    'totalAmount',
  );
  @override
  late final GeneratedColumn<double> totalAmount = GeneratedColumn<double>(
    'total_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paidAmountMeta = const VerificationMeta(
    'paidAmount',
  );
  @override
  late final GeneratedColumn<double> paidAmount = GeneratedColumn<double>(
    'paid_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _orderStatusMeta = const VerificationMeta(
    'orderStatus',
  );
  @override
  late final GeneratedColumn<int> orderStatus = GeneratedColumn<int>(
    'order_status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<int> clientId = GeneratedColumn<int>(
    'client_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES clients (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    totalAmount,
    paidAmount,
    orderStatus,
    clientId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'orders';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrderTable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('total_amount')) {
      context.handle(
        _totalAmountMeta,
        totalAmount.isAcceptableOrUnknown(
          data['total_amount']!,
          _totalAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalAmountMeta);
    }
    if (data.containsKey('paid_amount')) {
      context.handle(
        _paidAmountMeta,
        paidAmount.isAcceptableOrUnknown(data['paid_amount']!, _paidAmountMeta),
      );
    }
    if (data.containsKey('order_status')) {
      context.handle(
        _orderStatusMeta,
        orderStatus.isAcceptableOrUnknown(
          data['order_status']!,
          _orderStatusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_orderStatusMeta);
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderTable(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      totalAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_amount'],
      )!,
      paidAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}paid_amount'],
      )!,
      orderStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_status'],
      )!,
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}client_id'],
      )!,
    );
  }

  @override
  $OrdersTable createAlias(String alias) {
    return $OrdersTable(attachedDatabase, alias);
  }
}

class OrderTable extends DataClass implements Insertable<OrderTable> {
  final int id;
  final DateTime createdAt;
  final double totalAmount;
  final double paidAmount;
  final int orderStatus;
  final int clientId;
  const OrderTable({
    required this.id,
    required this.createdAt,
    required this.totalAmount,
    required this.paidAmount,
    required this.orderStatus,
    required this.clientId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['total_amount'] = Variable<double>(totalAmount);
    map['paid_amount'] = Variable<double>(paidAmount);
    map['order_status'] = Variable<int>(orderStatus);
    map['client_id'] = Variable<int>(clientId);
    return map;
  }

  OrdersCompanion toCompanion(bool nullToAbsent) {
    return OrdersCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      totalAmount: Value(totalAmount),
      paidAmount: Value(paidAmount),
      orderStatus: Value(orderStatus),
      clientId: Value(clientId),
    );
  }

  factory OrderTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderTable(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      totalAmount: serializer.fromJson<double>(json['totalAmount']),
      paidAmount: serializer.fromJson<double>(json['paidAmount']),
      orderStatus: serializer.fromJson<int>(json['orderStatus']),
      clientId: serializer.fromJson<int>(json['clientId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'totalAmount': serializer.toJson<double>(totalAmount),
      'paidAmount': serializer.toJson<double>(paidAmount),
      'orderStatus': serializer.toJson<int>(orderStatus),
      'clientId': serializer.toJson<int>(clientId),
    };
  }

  OrderTable copyWith({
    int? id,
    DateTime? createdAt,
    double? totalAmount,
    double? paidAmount,
    int? orderStatus,
    int? clientId,
  }) => OrderTable(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    totalAmount: totalAmount ?? this.totalAmount,
    paidAmount: paidAmount ?? this.paidAmount,
    orderStatus: orderStatus ?? this.orderStatus,
    clientId: clientId ?? this.clientId,
  );
  OrderTable copyWithCompanion(OrdersCompanion data) {
    return OrderTable(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      totalAmount: data.totalAmount.present
          ? data.totalAmount.value
          : this.totalAmount,
      paidAmount: data.paidAmount.present
          ? data.paidAmount.value
          : this.paidAmount,
      orderStatus: data.orderStatus.present
          ? data.orderStatus.value
          : this.orderStatus,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderTable(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('orderStatus: $orderStatus, ')
          ..write('clientId: $clientId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    totalAmount,
    paidAmount,
    orderStatus,
    clientId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderTable &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.totalAmount == this.totalAmount &&
          other.paidAmount == this.paidAmount &&
          other.orderStatus == this.orderStatus &&
          other.clientId == this.clientId);
}

class OrdersCompanion extends UpdateCompanion<OrderTable> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<double> totalAmount;
  final Value<double> paidAmount;
  final Value<int> orderStatus;
  final Value<int> clientId;
  const OrdersCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.paidAmount = const Value.absent(),
    this.orderStatus = const Value.absent(),
    this.clientId = const Value.absent(),
  });
  OrdersCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required double totalAmount,
    this.paidAmount = const Value.absent(),
    required int orderStatus,
    required int clientId,
  }) : totalAmount = Value(totalAmount),
       orderStatus = Value(orderStatus),
       clientId = Value(clientId);
  static Insertable<OrderTable> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<double>? totalAmount,
    Expression<double>? paidAmount,
    Expression<int>? orderStatus,
    Expression<int>? clientId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (paidAmount != null) 'paid_amount': paidAmount,
      if (orderStatus != null) 'order_status': orderStatus,
      if (clientId != null) 'client_id': clientId,
    });
  }

  OrdersCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? createdAt,
    Value<double>? totalAmount,
    Value<double>? paidAmount,
    Value<int>? orderStatus,
    Value<int>? clientId,
  }) {
    return OrdersCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      totalAmount: totalAmount ?? this.totalAmount,
      paidAmount: paidAmount ?? this.paidAmount,
      orderStatus: orderStatus ?? this.orderStatus,
      clientId: clientId ?? this.clientId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<double>(totalAmount.value);
    }
    if (paidAmount.present) {
      map['paid_amount'] = Variable<double>(paidAmount.value);
    }
    if (orderStatus.present) {
      map['order_status'] = Variable<int>(orderStatus.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<int>(clientId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('orderStatus: $orderStatus, ')
          ..write('clientId: $clientId')
          ..write(')'))
        .toString();
  }
}

class $OrderProductsTable extends OrderProducts
    with TableInfo<$OrderProductsTable, OrderProductTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _customPriceMeta = const VerificationMeta(
    'customPrice',
  );
  @override
  late final GeneratedColumn<double> customPrice = GeneratedColumn<double>(
    'custom_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _customQuantityMeta = const VerificationMeta(
    'customQuantity',
  );
  @override
  late final GeneratedColumn<int> customQuantity = GeneratedColumn<int>(
    'custom_quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderIdMeta = const VerificationMeta(
    'orderId',
  );
  @override
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
    'order_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES orders (id)',
    ),
  );
  static const VerificationMeta _warehouseProductIdMeta =
      const VerificationMeta('warehouseProductId');
  @override
  late final GeneratedColumn<int> warehouseProductId = GeneratedColumn<int>(
    'warehouse_product_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES warehouse_products (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    customPrice,
    customQuantity,
    orderId,
    warehouseProductId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_products';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrderProductTable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('custom_price')) {
      context.handle(
        _customPriceMeta,
        customPrice.isAcceptableOrUnknown(
          data['custom_price']!,
          _customPriceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_customPriceMeta);
    }
    if (data.containsKey('custom_quantity')) {
      context.handle(
        _customQuantityMeta,
        customQuantity.isAcceptableOrUnknown(
          data['custom_quantity']!,
          _customQuantityMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_customQuantityMeta);
    }
    if (data.containsKey('order_id')) {
      context.handle(
        _orderIdMeta,
        orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('warehouse_product_id')) {
      context.handle(
        _warehouseProductIdMeta,
        warehouseProductId.isAcceptableOrUnknown(
          data['warehouse_product_id']!,
          _warehouseProductIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_warehouseProductIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderProductTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderProductTable(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      customPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}custom_price'],
      )!,
      customQuantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}custom_quantity'],
      )!,
      orderId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_id'],
      )!,
      warehouseProductId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}warehouse_product_id'],
      )!,
    );
  }

  @override
  $OrderProductsTable createAlias(String alias) {
    return $OrderProductsTable(attachedDatabase, alias);
  }
}

class OrderProductTable extends DataClass
    implements Insertable<OrderProductTable> {
  final int id;
  final DateTime createdAt;
  final double customPrice;
  final int customQuantity;
  final int orderId;
  final int warehouseProductId;
  const OrderProductTable({
    required this.id,
    required this.createdAt,
    required this.customPrice,
    required this.customQuantity,
    required this.orderId,
    required this.warehouseProductId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['custom_price'] = Variable<double>(customPrice);
    map['custom_quantity'] = Variable<int>(customQuantity);
    map['order_id'] = Variable<int>(orderId);
    map['warehouse_product_id'] = Variable<int>(warehouseProductId);
    return map;
  }

  OrderProductsCompanion toCompanion(bool nullToAbsent) {
    return OrderProductsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      customPrice: Value(customPrice),
      customQuantity: Value(customQuantity),
      orderId: Value(orderId),
      warehouseProductId: Value(warehouseProductId),
    );
  }

  factory OrderProductTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderProductTable(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      customPrice: serializer.fromJson<double>(json['customPrice']),
      customQuantity: serializer.fromJson<int>(json['customQuantity']),
      orderId: serializer.fromJson<int>(json['orderId']),
      warehouseProductId: serializer.fromJson<int>(json['warehouseProductId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'customPrice': serializer.toJson<double>(customPrice),
      'customQuantity': serializer.toJson<int>(customQuantity),
      'orderId': serializer.toJson<int>(orderId),
      'warehouseProductId': serializer.toJson<int>(warehouseProductId),
    };
  }

  OrderProductTable copyWith({
    int? id,
    DateTime? createdAt,
    double? customPrice,
    int? customQuantity,
    int? orderId,
    int? warehouseProductId,
  }) => OrderProductTable(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    customPrice: customPrice ?? this.customPrice,
    customQuantity: customQuantity ?? this.customQuantity,
    orderId: orderId ?? this.orderId,
    warehouseProductId: warehouseProductId ?? this.warehouseProductId,
  );
  OrderProductTable copyWithCompanion(OrderProductsCompanion data) {
    return OrderProductTable(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      customPrice: data.customPrice.present
          ? data.customPrice.value
          : this.customPrice,
      customQuantity: data.customQuantity.present
          ? data.customQuantity.value
          : this.customQuantity,
      orderId: data.orderId.present ? data.orderId.value : this.orderId,
      warehouseProductId: data.warehouseProductId.present
          ? data.warehouseProductId.value
          : this.warehouseProductId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderProductTable(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('customPrice: $customPrice, ')
          ..write('customQuantity: $customQuantity, ')
          ..write('orderId: $orderId, ')
          ..write('warehouseProductId: $warehouseProductId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    createdAt,
    customPrice,
    customQuantity,
    orderId,
    warehouseProductId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderProductTable &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.customPrice == this.customPrice &&
          other.customQuantity == this.customQuantity &&
          other.orderId == this.orderId &&
          other.warehouseProductId == this.warehouseProductId);
}

class OrderProductsCompanion extends UpdateCompanion<OrderProductTable> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<double> customPrice;
  final Value<int> customQuantity;
  final Value<int> orderId;
  final Value<int> warehouseProductId;
  const OrderProductsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.customPrice = const Value.absent(),
    this.customQuantity = const Value.absent(),
    this.orderId = const Value.absent(),
    this.warehouseProductId = const Value.absent(),
  });
  OrderProductsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required double customPrice,
    required int customQuantity,
    required int orderId,
    required int warehouseProductId,
  }) : customPrice = Value(customPrice),
       customQuantity = Value(customQuantity),
       orderId = Value(orderId),
       warehouseProductId = Value(warehouseProductId);
  static Insertable<OrderProductTable> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<double>? customPrice,
    Expression<int>? customQuantity,
    Expression<int>? orderId,
    Expression<int>? warehouseProductId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (customPrice != null) 'custom_price': customPrice,
      if (customQuantity != null) 'custom_quantity': customQuantity,
      if (orderId != null) 'order_id': orderId,
      if (warehouseProductId != null)
        'warehouse_product_id': warehouseProductId,
    });
  }

  OrderProductsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? createdAt,
    Value<double>? customPrice,
    Value<int>? customQuantity,
    Value<int>? orderId,
    Value<int>? warehouseProductId,
  }) {
    return OrderProductsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      customPrice: customPrice ?? this.customPrice,
      customQuantity: customQuantity ?? this.customQuantity,
      orderId: orderId ?? this.orderId,
      warehouseProductId: warehouseProductId ?? this.warehouseProductId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (customPrice.present) {
      map['custom_price'] = Variable<double>(customPrice.value);
    }
    if (customQuantity.present) {
      map['custom_quantity'] = Variable<int>(customQuantity.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    if (warehouseProductId.present) {
      map['warehouse_product_id'] = Variable<int>(warehouseProductId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderProductsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('customPrice: $customPrice, ')
          ..write('customQuantity: $customQuantity, ')
          ..write('orderId: $orderId, ')
          ..write('warehouseProductId: $warehouseProductId')
          ..write(')'))
        .toString();
  }
}

class $AdminsTable extends Admins with TableInfo<$AdminsTable, AdminTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AdminsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _secretNameMeta = const VerificationMeta(
    'secretName',
  );
  @override
  late final GeneratedColumn<String> secretName = GeneratedColumn<String>(
    'secret_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 220),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _secretKeyMeta = const VerificationMeta(
    'secretKey',
  );
  @override
  late final GeneratedColumn<String> secretKey = GeneratedColumn<String>(
    'secret_key',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 220),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _adminPermissionMeta = const VerificationMeta(
    'adminPermission',
  );
  @override
  late final GeneratedColumn<int> adminPermission = GeneratedColumn<int>(
    'admin_permission',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    secretName,
    secretKey,
    adminPermission,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'admins';
  @override
  VerificationContext validateIntegrity(
    Insertable<AdminTable> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('secret_name')) {
      context.handle(
        _secretNameMeta,
        secretName.isAcceptableOrUnknown(data['secret_name']!, _secretNameMeta),
      );
    } else if (isInserting) {
      context.missing(_secretNameMeta);
    }
    if (data.containsKey('secret_key')) {
      context.handle(
        _secretKeyMeta,
        secretKey.isAcceptableOrUnknown(data['secret_key']!, _secretKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_secretKeyMeta);
    }
    if (data.containsKey('admin_permission')) {
      context.handle(
        _adminPermissionMeta,
        adminPermission.isAcceptableOrUnknown(
          data['admin_permission']!,
          _adminPermissionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_adminPermissionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AdminTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AdminTable(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      secretName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}secret_name'],
      )!,
      secretKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}secret_key'],
      )!,
      adminPermission: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}admin_permission'],
      )!,
    );
  }

  @override
  $AdminsTable createAlias(String alias) {
    return $AdminsTable(attachedDatabase, alias);
  }
}

class AdminTable extends DataClass implements Insertable<AdminTable> {
  final int id;
  final DateTime createdAt;
  final String secretName;
  final String secretKey;
  final int adminPermission;
  const AdminTable({
    required this.id,
    required this.createdAt,
    required this.secretName,
    required this.secretKey,
    required this.adminPermission,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['secret_name'] = Variable<String>(secretName);
    map['secret_key'] = Variable<String>(secretKey);
    map['admin_permission'] = Variable<int>(adminPermission);
    return map;
  }

  AdminsCompanion toCompanion(bool nullToAbsent) {
    return AdminsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      secretName: Value(secretName),
      secretKey: Value(secretKey),
      adminPermission: Value(adminPermission),
    );
  }

  factory AdminTable.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AdminTable(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      secretName: serializer.fromJson<String>(json['secretName']),
      secretKey: serializer.fromJson<String>(json['secretKey']),
      adminPermission: serializer.fromJson<int>(json['adminPermission']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'secretName': serializer.toJson<String>(secretName),
      'secretKey': serializer.toJson<String>(secretKey),
      'adminPermission': serializer.toJson<int>(adminPermission),
    };
  }

  AdminTable copyWith({
    int? id,
    DateTime? createdAt,
    String? secretName,
    String? secretKey,
    int? adminPermission,
  }) => AdminTable(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    secretName: secretName ?? this.secretName,
    secretKey: secretKey ?? this.secretKey,
    adminPermission: adminPermission ?? this.adminPermission,
  );
  AdminTable copyWithCompanion(AdminsCompanion data) {
    return AdminTable(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      secretName: data.secretName.present
          ? data.secretName.value
          : this.secretName,
      secretKey: data.secretKey.present ? data.secretKey.value : this.secretKey,
      adminPermission: data.adminPermission.present
          ? data.adminPermission.value
          : this.adminPermission,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AdminTable(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('secretName: $secretName, ')
          ..write('secretKey: $secretKey, ')
          ..write('adminPermission: $adminPermission')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, createdAt, secretName, secretKey, adminPermission);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AdminTable &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.secretName == this.secretName &&
          other.secretKey == this.secretKey &&
          other.adminPermission == this.adminPermission);
}

class AdminsCompanion extends UpdateCompanion<AdminTable> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<String> secretName;
  final Value<String> secretKey;
  final Value<int> adminPermission;
  const AdminsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.secretName = const Value.absent(),
    this.secretKey = const Value.absent(),
    this.adminPermission = const Value.absent(),
  });
  AdminsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required String secretName,
    required String secretKey,
    required int adminPermission,
  }) : secretName = Value(secretName),
       secretKey = Value(secretKey),
       adminPermission = Value(adminPermission);
  static Insertable<AdminTable> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<String>? secretName,
    Expression<String>? secretKey,
    Expression<int>? adminPermission,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (secretName != null) 'secret_name': secretName,
      if (secretKey != null) 'secret_key': secretKey,
      if (adminPermission != null) 'admin_permission': adminPermission,
    });
  }

  AdminsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? createdAt,
    Value<String>? secretName,
    Value<String>? secretKey,
    Value<int>? adminPermission,
  }) {
    return AdminsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      secretName: secretName ?? this.secretName,
      secretKey: secretKey ?? this.secretKey,
      adminPermission: adminPermission ?? this.adminPermission,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (secretName.present) {
      map['secret_name'] = Variable<String>(secretName.value);
    }
    if (secretKey.present) {
      map['secret_key'] = Variable<String>(secretKey.value);
    }
    if (adminPermission.present) {
      map['admin_permission'] = Variable<int>(adminPermission.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdminsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('secretName: $secretName, ')
          ..write('secretKey: $secretKey, ')
          ..write('adminPermission: $adminPermission')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $WarehousesTable warehouses = $WarehousesTable(this);
  late final $ClientsTable clients = $ClientsTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $WarehouseProductsTable warehouseProducts =
      $WarehouseProductsTable(this);
  late final $ClientProductsTable clientProducts = $ClientProductsTable(this);
  late final $OrdersTable orders = $OrdersTable(this);
  late final $OrderProductsTable orderProducts = $OrderProductsTable(this);
  late final $AdminsTable admins = $AdminsTable(this);
  late final WarehouseDao warehouseDao = WarehouseDao(this as Database);
  late final ProductDao productDao = ProductDao(this as Database);
  late final ClientDao clientDao = ClientDao(this as Database);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    warehouses,
    clients,
    products,
    warehouseProducts,
    clientProducts,
    orders,
    orderProducts,
    admins,
  ];
}

typedef $$WarehousesTableCreateCompanionBuilder =
    WarehousesCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      required String name,
      required String address,
    });
typedef $$WarehousesTableUpdateCompanionBuilder =
    WarehousesCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      Value<String> name,
      Value<String> address,
    });

final class $$WarehousesTableReferences
    extends BaseReferences<_$Database, $WarehousesTable, WarehouseTable> {
  $$WarehousesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $WarehouseProductsTable,
    List<WarehouseProductTable>
  >
  _warehouseProductsRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.warehouseProducts,
    aliasName: $_aliasNameGenerator(
      db.warehouses.id,
      db.warehouseProducts.warehouseId,
    ),
  );

  $$WarehouseProductsTableProcessedTableManager get warehouseProductsRefs {
    final manager = $$WarehouseProductsTableTableManager(
      $_db,
      $_db.warehouseProducts,
    ).filter((f) => f.warehouseId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _warehouseProductsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$WarehousesTableFilterComposer
    extends Composer<_$Database, $WarehousesTable> {
  $$WarehousesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> warehouseProductsRefs(
    Expression<bool> Function($$WarehouseProductsTableFilterComposer f) f,
  ) {
    final $$WarehouseProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.warehouseProducts,
      getReferencedColumn: (t) => t.warehouseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WarehouseProductsTableFilterComposer(
            $db: $db,
            $table: $db.warehouseProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WarehousesTableOrderingComposer
    extends Composer<_$Database, $WarehousesTable> {
  $$WarehousesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WarehousesTableAnnotationComposer
    extends Composer<_$Database, $WarehousesTable> {
  $$WarehousesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  Expression<T> warehouseProductsRefs<T extends Object>(
    Expression<T> Function($$WarehouseProductsTableAnnotationComposer a) f,
  ) {
    final $$WarehouseProductsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.warehouseProducts,
          getReferencedColumn: (t) => t.warehouseId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$WarehouseProductsTableAnnotationComposer(
                $db: $db,
                $table: $db.warehouseProducts,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$WarehousesTableTableManager
    extends
        RootTableManager<
          _$Database,
          $WarehousesTable,
          WarehouseTable,
          $$WarehousesTableFilterComposer,
          $$WarehousesTableOrderingComposer,
          $$WarehousesTableAnnotationComposer,
          $$WarehousesTableCreateCompanionBuilder,
          $$WarehousesTableUpdateCompanionBuilder,
          (WarehouseTable, $$WarehousesTableReferences),
          WarehouseTable,
          PrefetchHooks Function({bool warehouseProductsRefs})
        > {
  $$WarehousesTableTableManager(_$Database db, $WarehousesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WarehousesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WarehousesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WarehousesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> address = const Value.absent(),
              }) => WarehousesCompanion(
                id: id,
                createdAt: createdAt,
                name: name,
                address: address,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                required String name,
                required String address,
              }) => WarehousesCompanion.insert(
                id: id,
                createdAt: createdAt,
                name: name,
                address: address,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WarehousesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({warehouseProductsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (warehouseProductsRefs) db.warehouseProducts,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (warehouseProductsRefs)
                    await $_getPrefetchedData<
                      WarehouseTable,
                      $WarehousesTable,
                      WarehouseProductTable
                    >(
                      currentTable: table,
                      referencedTable: $$WarehousesTableReferences
                          ._warehouseProductsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$WarehousesTableReferences(
                            db,
                            table,
                            p0,
                          ).warehouseProductsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.warehouseId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$WarehousesTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $WarehousesTable,
      WarehouseTable,
      $$WarehousesTableFilterComposer,
      $$WarehousesTableOrderingComposer,
      $$WarehousesTableAnnotationComposer,
      $$WarehousesTableCreateCompanionBuilder,
      $$WarehousesTableUpdateCompanionBuilder,
      (WarehouseTable, $$WarehousesTableReferences),
      WarehouseTable,
      PrefetchHooks Function({bool warehouseProductsRefs})
    >;
typedef $$ClientsTableCreateCompanionBuilder =
    ClientsCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      required String fullname,
      Value<String?> phone,
      Value<String?> address,
      required String secretKey,
    });
typedef $$ClientsTableUpdateCompanionBuilder =
    ClientsCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      Value<String> fullname,
      Value<String?> phone,
      Value<String?> address,
      Value<String> secretKey,
    });

final class $$ClientsTableReferences
    extends BaseReferences<_$Database, $ClientsTable, ClientTable> {
  $$ClientsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ClientProductsTable, List<ClientProductTable>>
  _clientProductsRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.clientProducts,
    aliasName: $_aliasNameGenerator(db.clients.id, db.clientProducts.clientId),
  );

  $$ClientProductsTableProcessedTableManager get clientProductsRefs {
    final manager = $$ClientProductsTableTableManager(
      $_db,
      $_db.clientProducts,
    ).filter((f) => f.clientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_clientProductsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$OrdersTable, List<OrderTable>> _ordersRefsTable(
    _$Database db,
  ) => MultiTypedResultKey.fromTable(
    db.orders,
    aliasName: $_aliasNameGenerator(db.clients.id, db.orders.clientId),
  );

  $$OrdersTableProcessedTableManager get ordersRefs {
    final manager = $$OrdersTableTableManager(
      $_db,
      $_db.orders,
    ).filter((f) => f.clientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_ordersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ClientsTableFilterComposer extends Composer<_$Database, $ClientsTable> {
  $$ClientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullname => $composableBuilder(
    column: $table.fullname,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get secretKey => $composableBuilder(
    column: $table.secretKey,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> clientProductsRefs(
    Expression<bool> Function($$ClientProductsTableFilterComposer f) f,
  ) {
    final $$ClientProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.clientProducts,
      getReferencedColumn: (t) => t.clientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientProductsTableFilterComposer(
            $db: $db,
            $table: $db.clientProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> ordersRefs(
    Expression<bool> Function($$OrdersTableFilterComposer f) f,
  ) {
    final $$OrdersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.orders,
      getReferencedColumn: (t) => t.clientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdersTableFilterComposer(
            $db: $db,
            $table: $db.orders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ClientsTableOrderingComposer
    extends Composer<_$Database, $ClientsTable> {
  $$ClientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullname => $composableBuilder(
    column: $table.fullname,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get secretKey => $composableBuilder(
    column: $table.secretKey,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ClientsTableAnnotationComposer
    extends Composer<_$Database, $ClientsTable> {
  $$ClientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get fullname =>
      $composableBuilder(column: $table.fullname, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get secretKey =>
      $composableBuilder(column: $table.secretKey, builder: (column) => column);

  Expression<T> clientProductsRefs<T extends Object>(
    Expression<T> Function($$ClientProductsTableAnnotationComposer a) f,
  ) {
    final $$ClientProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.clientProducts,
      getReferencedColumn: (t) => t.clientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.clientProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> ordersRefs<T extends Object>(
    Expression<T> Function($$OrdersTableAnnotationComposer a) f,
  ) {
    final $$OrdersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.orders,
      getReferencedColumn: (t) => t.clientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdersTableAnnotationComposer(
            $db: $db,
            $table: $db.orders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ClientsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ClientsTable,
          ClientTable,
          $$ClientsTableFilterComposer,
          $$ClientsTableOrderingComposer,
          $$ClientsTableAnnotationComposer,
          $$ClientsTableCreateCompanionBuilder,
          $$ClientsTableUpdateCompanionBuilder,
          (ClientTable, $$ClientsTableReferences),
          ClientTable,
          PrefetchHooks Function({bool clientProductsRefs, bool ordersRefs})
        > {
  $$ClientsTableTableManager(_$Database db, $ClientsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClientsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> fullname = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String> secretKey = const Value.absent(),
              }) => ClientsCompanion(
                id: id,
                createdAt: createdAt,
                fullname: fullname,
                phone: phone,
                address: address,
                secretKey: secretKey,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                required String fullname,
                Value<String?> phone = const Value.absent(),
                Value<String?> address = const Value.absent(),
                required String secretKey,
              }) => ClientsCompanion.insert(
                id: id,
                createdAt: createdAt,
                fullname: fullname,
                phone: phone,
                address: address,
                secretKey: secretKey,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ClientsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({clientProductsRefs = false, ordersRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (clientProductsRefs) db.clientProducts,
                    if (ordersRefs) db.orders,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (clientProductsRefs)
                        await $_getPrefetchedData<
                          ClientTable,
                          $ClientsTable,
                          ClientProductTable
                        >(
                          currentTable: table,
                          referencedTable: $$ClientsTableReferences
                              ._clientProductsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ClientsTableReferences(
                                db,
                                table,
                                p0,
                              ).clientProductsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.clientId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (ordersRefs)
                        await $_getPrefetchedData<
                          ClientTable,
                          $ClientsTable,
                          OrderTable
                        >(
                          currentTable: table,
                          referencedTable: $$ClientsTableReferences
                              ._ordersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ClientsTableReferences(
                                db,
                                table,
                                p0,
                              ).ordersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.clientId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ClientsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ClientsTable,
      ClientTable,
      $$ClientsTableFilterComposer,
      $$ClientsTableOrderingComposer,
      $$ClientsTableAnnotationComposer,
      $$ClientsTableCreateCompanionBuilder,
      $$ClientsTableUpdateCompanionBuilder,
      (ClientTable, $$ClientsTableReferences),
      ClientTable,
      PrefetchHooks Function({bool clientProductsRefs, bool ordersRefs})
    >;
typedef $$ProductsTableCreateCompanionBuilder =
    ProductsCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      required String name,
      Value<String?> imgUrl,
      required double buyPrice,
      required double sellPrice,
    });
typedef $$ProductsTableUpdateCompanionBuilder =
    ProductsCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      Value<String> name,
      Value<String?> imgUrl,
      Value<double> buyPrice,
      Value<double> sellPrice,
    });

final class $$ProductsTableReferences
    extends BaseReferences<_$Database, $ProductsTable, ProductTable> {
  $$ProductsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $WarehouseProductsTable,
    List<WarehouseProductTable>
  >
  _warehouseProductsRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.warehouseProducts,
    aliasName: $_aliasNameGenerator(
      db.products.id,
      db.warehouseProducts.productId,
    ),
  );

  $$WarehouseProductsTableProcessedTableManager get warehouseProductsRefs {
    final manager = $$WarehouseProductsTableTableManager(
      $_db,
      $_db.warehouseProducts,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _warehouseProductsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProductsTableFilterComposer
    extends Composer<_$Database, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imgUrl => $composableBuilder(
    column: $table.imgUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get buyPrice => $composableBuilder(
    column: $table.buyPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sellPrice => $composableBuilder(
    column: $table.sellPrice,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> warehouseProductsRefs(
    Expression<bool> Function($$WarehouseProductsTableFilterComposer f) f,
  ) {
    final $$WarehouseProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.warehouseProducts,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WarehouseProductsTableFilterComposer(
            $db: $db,
            $table: $db.warehouseProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductsTableOrderingComposer
    extends Composer<_$Database, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imgUrl => $composableBuilder(
    column: $table.imgUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get buyPrice => $composableBuilder(
    column: $table.buyPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sellPrice => $composableBuilder(
    column: $table.sellPrice,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$Database, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get imgUrl =>
      $composableBuilder(column: $table.imgUrl, builder: (column) => column);

  GeneratedColumn<double> get buyPrice =>
      $composableBuilder(column: $table.buyPrice, builder: (column) => column);

  GeneratedColumn<double> get sellPrice =>
      $composableBuilder(column: $table.sellPrice, builder: (column) => column);

  Expression<T> warehouseProductsRefs<T extends Object>(
    Expression<T> Function($$WarehouseProductsTableAnnotationComposer a) f,
  ) {
    final $$WarehouseProductsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.warehouseProducts,
          getReferencedColumn: (t) => t.productId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$WarehouseProductsTableAnnotationComposer(
                $db: $db,
                $table: $db.warehouseProducts,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ProductsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ProductsTable,
          ProductTable,
          $$ProductsTableFilterComposer,
          $$ProductsTableOrderingComposer,
          $$ProductsTableAnnotationComposer,
          $$ProductsTableCreateCompanionBuilder,
          $$ProductsTableUpdateCompanionBuilder,
          (ProductTable, $$ProductsTableReferences),
          ProductTable,
          PrefetchHooks Function({bool warehouseProductsRefs})
        > {
  $$ProductsTableTableManager(_$Database db, $ProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> imgUrl = const Value.absent(),
                Value<double> buyPrice = const Value.absent(),
                Value<double> sellPrice = const Value.absent(),
              }) => ProductsCompanion(
                id: id,
                createdAt: createdAt,
                name: name,
                imgUrl: imgUrl,
                buyPrice: buyPrice,
                sellPrice: sellPrice,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                required String name,
                Value<String?> imgUrl = const Value.absent(),
                required double buyPrice,
                required double sellPrice,
              }) => ProductsCompanion.insert(
                id: id,
                createdAt: createdAt,
                name: name,
                imgUrl: imgUrl,
                buyPrice: buyPrice,
                sellPrice: sellPrice,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({warehouseProductsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (warehouseProductsRefs) db.warehouseProducts,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (warehouseProductsRefs)
                    await $_getPrefetchedData<
                      ProductTable,
                      $ProductsTable,
                      WarehouseProductTable
                    >(
                      currentTable: table,
                      referencedTable: $$ProductsTableReferences
                          ._warehouseProductsRefsTable(db),
                      managerFromTypedResult: (p0) => $$ProductsTableReferences(
                        db,
                        table,
                        p0,
                      ).warehouseProductsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.productId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ProductsTable,
      ProductTable,
      $$ProductsTableFilterComposer,
      $$ProductsTableOrderingComposer,
      $$ProductsTableAnnotationComposer,
      $$ProductsTableCreateCompanionBuilder,
      $$ProductsTableUpdateCompanionBuilder,
      (ProductTable, $$ProductsTableReferences),
      ProductTable,
      PrefetchHooks Function({bool warehouseProductsRefs})
    >;
typedef $$WarehouseProductsTableCreateCompanionBuilder =
    WarehouseProductsCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      required int quantity,
      required int productStatus,
      required int warehouseId,
      required int productId,
    });
typedef $$WarehouseProductsTableUpdateCompanionBuilder =
    WarehouseProductsCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      Value<int> quantity,
      Value<int> productStatus,
      Value<int> warehouseId,
      Value<int> productId,
    });

final class $$WarehouseProductsTableReferences
    extends
        BaseReferences<
          _$Database,
          $WarehouseProductsTable,
          WarehouseProductTable
        > {
  $$WarehouseProductsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $WarehousesTable _warehouseIdTable(_$Database db) =>
      db.warehouses.createAlias(
        $_aliasNameGenerator(
          db.warehouseProducts.warehouseId,
          db.warehouses.id,
        ),
      );

  $$WarehousesTableProcessedTableManager get warehouseId {
    final $_column = $_itemColumn<int>('warehouse_id')!;

    final manager = $$WarehousesTableTableManager(
      $_db,
      $_db.warehouses,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_warehouseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProductsTable _productIdTable(_$Database db) =>
      db.products.createAlias(
        $_aliasNameGenerator(db.warehouseProducts.productId, db.products.id),
      );

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<int>('product_id')!;

    final manager = $$ProductsTableTableManager(
      $_db,
      $_db.products,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ClientProductsTable, List<ClientProductTable>>
  _clientProductsRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.clientProducts,
    aliasName: $_aliasNameGenerator(
      db.warehouseProducts.id,
      db.clientProducts.warehouseProductId,
    ),
  );

  $$ClientProductsTableProcessedTableManager get clientProductsRefs {
    final manager = $$ClientProductsTableTableManager($_db, $_db.clientProducts)
        .filter(
          (f) => f.warehouseProductId.id.sqlEquals($_itemColumn<int>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_clientProductsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$OrderProductsTable, List<OrderProductTable>>
  _orderProductsRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.orderProducts,
    aliasName: $_aliasNameGenerator(
      db.warehouseProducts.id,
      db.orderProducts.warehouseProductId,
    ),
  );

  $$OrderProductsTableProcessedTableManager get orderProductsRefs {
    final manager = $$OrderProductsTableTableManager($_db, $_db.orderProducts)
        .filter(
          (f) => f.warehouseProductId.id.sqlEquals($_itemColumn<int>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_orderProductsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$WarehouseProductsTableFilterComposer
    extends Composer<_$Database, $WarehouseProductsTable> {
  $$WarehouseProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get productStatus => $composableBuilder(
    column: $table.productStatus,
    builder: (column) => ColumnFilters(column),
  );

  $$WarehousesTableFilterComposer get warehouseId {
    final $$WarehousesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.warehouseId,
      referencedTable: $db.warehouses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WarehousesTableFilterComposer(
            $db: $db,
            $table: $db.warehouses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableFilterComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> clientProductsRefs(
    Expression<bool> Function($$ClientProductsTableFilterComposer f) f,
  ) {
    final $$ClientProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.clientProducts,
      getReferencedColumn: (t) => t.warehouseProductId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientProductsTableFilterComposer(
            $db: $db,
            $table: $db.clientProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> orderProductsRefs(
    Expression<bool> Function($$OrderProductsTableFilterComposer f) f,
  ) {
    final $$OrderProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.orderProducts,
      getReferencedColumn: (t) => t.warehouseProductId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrderProductsTableFilterComposer(
            $db: $db,
            $table: $db.orderProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WarehouseProductsTableOrderingComposer
    extends Composer<_$Database, $WarehouseProductsTable> {
  $$WarehouseProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get productStatus => $composableBuilder(
    column: $table.productStatus,
    builder: (column) => ColumnOrderings(column),
  );

  $$WarehousesTableOrderingComposer get warehouseId {
    final $$WarehousesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.warehouseId,
      referencedTable: $db.warehouses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WarehousesTableOrderingComposer(
            $db: $db,
            $table: $db.warehouses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableOrderingComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WarehouseProductsTableAnnotationComposer
    extends Composer<_$Database, $WarehouseProductsTable> {
  $$WarehouseProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get productStatus => $composableBuilder(
    column: $table.productStatus,
    builder: (column) => column,
  );

  $$WarehousesTableAnnotationComposer get warehouseId {
    final $$WarehousesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.warehouseId,
      referencedTable: $db.warehouses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WarehousesTableAnnotationComposer(
            $db: $db,
            $table: $db.warehouses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.products,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.products,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> clientProductsRefs<T extends Object>(
    Expression<T> Function($$ClientProductsTableAnnotationComposer a) f,
  ) {
    final $$ClientProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.clientProducts,
      getReferencedColumn: (t) => t.warehouseProductId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.clientProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> orderProductsRefs<T extends Object>(
    Expression<T> Function($$OrderProductsTableAnnotationComposer a) f,
  ) {
    final $$OrderProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.orderProducts,
      getReferencedColumn: (t) => t.warehouseProductId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrderProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.orderProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WarehouseProductsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $WarehouseProductsTable,
          WarehouseProductTable,
          $$WarehouseProductsTableFilterComposer,
          $$WarehouseProductsTableOrderingComposer,
          $$WarehouseProductsTableAnnotationComposer,
          $$WarehouseProductsTableCreateCompanionBuilder,
          $$WarehouseProductsTableUpdateCompanionBuilder,
          (WarehouseProductTable, $$WarehouseProductsTableReferences),
          WarehouseProductTable,
          PrefetchHooks Function({
            bool warehouseId,
            bool productId,
            bool clientProductsRefs,
            bool orderProductsRefs,
          })
        > {
  $$WarehouseProductsTableTableManager(
    _$Database db,
    $WarehouseProductsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WarehouseProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WarehouseProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WarehouseProductsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<int> productStatus = const Value.absent(),
                Value<int> warehouseId = const Value.absent(),
                Value<int> productId = const Value.absent(),
              }) => WarehouseProductsCompanion(
                id: id,
                createdAt: createdAt,
                quantity: quantity,
                productStatus: productStatus,
                warehouseId: warehouseId,
                productId: productId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                required int quantity,
                required int productStatus,
                required int warehouseId,
                required int productId,
              }) => WarehouseProductsCompanion.insert(
                id: id,
                createdAt: createdAt,
                quantity: quantity,
                productStatus: productStatus,
                warehouseId: warehouseId,
                productId: productId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WarehouseProductsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                warehouseId = false,
                productId = false,
                clientProductsRefs = false,
                orderProductsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (clientProductsRefs) db.clientProducts,
                    if (orderProductsRefs) db.orderProducts,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (warehouseId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.warehouseId,
                                    referencedTable:
                                        $$WarehouseProductsTableReferences
                                            ._warehouseIdTable(db),
                                    referencedColumn:
                                        $$WarehouseProductsTableReferences
                                            ._warehouseIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (productId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.productId,
                                    referencedTable:
                                        $$WarehouseProductsTableReferences
                                            ._productIdTable(db),
                                    referencedColumn:
                                        $$WarehouseProductsTableReferences
                                            ._productIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (clientProductsRefs)
                        await $_getPrefetchedData<
                          WarehouseProductTable,
                          $WarehouseProductsTable,
                          ClientProductTable
                        >(
                          currentTable: table,
                          referencedTable: $$WarehouseProductsTableReferences
                              ._clientProductsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WarehouseProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).clientProductsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.warehouseProductId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (orderProductsRefs)
                        await $_getPrefetchedData<
                          WarehouseProductTable,
                          $WarehouseProductsTable,
                          OrderProductTable
                        >(
                          currentTable: table,
                          referencedTable: $$WarehouseProductsTableReferences
                              ._orderProductsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$WarehouseProductsTableReferences(
                                db,
                                table,
                                p0,
                              ).orderProductsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.warehouseProductId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$WarehouseProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $WarehouseProductsTable,
      WarehouseProductTable,
      $$WarehouseProductsTableFilterComposer,
      $$WarehouseProductsTableOrderingComposer,
      $$WarehouseProductsTableAnnotationComposer,
      $$WarehouseProductsTableCreateCompanionBuilder,
      $$WarehouseProductsTableUpdateCompanionBuilder,
      (WarehouseProductTable, $$WarehouseProductsTableReferences),
      WarehouseProductTable,
      PrefetchHooks Function({
        bool warehouseId,
        bool productId,
        bool clientProductsRefs,
        bool orderProductsRefs,
      })
    >;
typedef $$ClientProductsTableCreateCompanionBuilder =
    ClientProductsCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      required double specialPrice,
      required int clientId,
      required int warehouseProductId,
    });
typedef $$ClientProductsTableUpdateCompanionBuilder =
    ClientProductsCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      Value<double> specialPrice,
      Value<int> clientId,
      Value<int> warehouseProductId,
    });

final class $$ClientProductsTableReferences
    extends
        BaseReferences<_$Database, $ClientProductsTable, ClientProductTable> {
  $$ClientProductsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ClientsTable _clientIdTable(_$Database db) => db.clients.createAlias(
    $_aliasNameGenerator(db.clientProducts.clientId, db.clients.id),
  );

  $$ClientsTableProcessedTableManager get clientId {
    final $_column = $_itemColumn<int>('client_id')!;

    final manager = $$ClientsTableTableManager(
      $_db,
      $_db.clients,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_clientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $WarehouseProductsTable _warehouseProductIdTable(_$Database db) =>
      db.warehouseProducts.createAlias(
        $_aliasNameGenerator(
          db.clientProducts.warehouseProductId,
          db.warehouseProducts.id,
        ),
      );

  $$WarehouseProductsTableProcessedTableManager get warehouseProductId {
    final $_column = $_itemColumn<int>('warehouse_product_id')!;

    final manager = $$WarehouseProductsTableTableManager(
      $_db,
      $_db.warehouseProducts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_warehouseProductIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ClientProductsTableFilterComposer
    extends Composer<_$Database, $ClientProductsTable> {
  $$ClientProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get specialPrice => $composableBuilder(
    column: $table.specialPrice,
    builder: (column) => ColumnFilters(column),
  );

  $$ClientsTableFilterComposer get clientId {
    final $$ClientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableFilterComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WarehouseProductsTableFilterComposer get warehouseProductId {
    final $$WarehouseProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.warehouseProductId,
      referencedTable: $db.warehouseProducts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WarehouseProductsTableFilterComposer(
            $db: $db,
            $table: $db.warehouseProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ClientProductsTableOrderingComposer
    extends Composer<_$Database, $ClientProductsTable> {
  $$ClientProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get specialPrice => $composableBuilder(
    column: $table.specialPrice,
    builder: (column) => ColumnOrderings(column),
  );

  $$ClientsTableOrderingComposer get clientId {
    final $$ClientsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableOrderingComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WarehouseProductsTableOrderingComposer get warehouseProductId {
    final $$WarehouseProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.warehouseProductId,
      referencedTable: $db.warehouseProducts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WarehouseProductsTableOrderingComposer(
            $db: $db,
            $table: $db.warehouseProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ClientProductsTableAnnotationComposer
    extends Composer<_$Database, $ClientProductsTable> {
  $$ClientProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<double> get specialPrice => $composableBuilder(
    column: $table.specialPrice,
    builder: (column) => column,
  );

  $$ClientsTableAnnotationComposer get clientId {
    final $$ClientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableAnnotationComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WarehouseProductsTableAnnotationComposer get warehouseProductId {
    final $$WarehouseProductsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.warehouseProductId,
          referencedTable: $db.warehouseProducts,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$WarehouseProductsTableAnnotationComposer(
                $db: $db,
                $table: $db.warehouseProducts,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ClientProductsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ClientProductsTable,
          ClientProductTable,
          $$ClientProductsTableFilterComposer,
          $$ClientProductsTableOrderingComposer,
          $$ClientProductsTableAnnotationComposer,
          $$ClientProductsTableCreateCompanionBuilder,
          $$ClientProductsTableUpdateCompanionBuilder,
          (ClientProductTable, $$ClientProductsTableReferences),
          ClientProductTable,
          PrefetchHooks Function({bool clientId, bool warehouseProductId})
        > {
  $$ClientProductsTableTableManager(_$Database db, $ClientProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClientProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClientProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClientProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<double> specialPrice = const Value.absent(),
                Value<int> clientId = const Value.absent(),
                Value<int> warehouseProductId = const Value.absent(),
              }) => ClientProductsCompanion(
                id: id,
                createdAt: createdAt,
                specialPrice: specialPrice,
                clientId: clientId,
                warehouseProductId: warehouseProductId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                required double specialPrice,
                required int clientId,
                required int warehouseProductId,
              }) => ClientProductsCompanion.insert(
                id: id,
                createdAt: createdAt,
                specialPrice: specialPrice,
                clientId: clientId,
                warehouseProductId: warehouseProductId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ClientProductsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({clientId = false, warehouseProductId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (clientId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.clientId,
                                    referencedTable:
                                        $$ClientProductsTableReferences
                                            ._clientIdTable(db),
                                    referencedColumn:
                                        $$ClientProductsTableReferences
                                            ._clientIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (warehouseProductId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.warehouseProductId,
                                    referencedTable:
                                        $$ClientProductsTableReferences
                                            ._warehouseProductIdTable(db),
                                    referencedColumn:
                                        $$ClientProductsTableReferences
                                            ._warehouseProductIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$ClientProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ClientProductsTable,
      ClientProductTable,
      $$ClientProductsTableFilterComposer,
      $$ClientProductsTableOrderingComposer,
      $$ClientProductsTableAnnotationComposer,
      $$ClientProductsTableCreateCompanionBuilder,
      $$ClientProductsTableUpdateCompanionBuilder,
      (ClientProductTable, $$ClientProductsTableReferences),
      ClientProductTable,
      PrefetchHooks Function({bool clientId, bool warehouseProductId})
    >;
typedef $$OrdersTableCreateCompanionBuilder =
    OrdersCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      required double totalAmount,
      Value<double> paidAmount,
      required int orderStatus,
      required int clientId,
    });
typedef $$OrdersTableUpdateCompanionBuilder =
    OrdersCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      Value<double> totalAmount,
      Value<double> paidAmount,
      Value<int> orderStatus,
      Value<int> clientId,
    });

final class $$OrdersTableReferences
    extends BaseReferences<_$Database, $OrdersTable, OrderTable> {
  $$OrdersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ClientsTable _clientIdTable(_$Database db) => db.clients.createAlias(
    $_aliasNameGenerator(db.orders.clientId, db.clients.id),
  );

  $$ClientsTableProcessedTableManager get clientId {
    final $_column = $_itemColumn<int>('client_id')!;

    final manager = $$ClientsTableTableManager(
      $_db,
      $_db.clients,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_clientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$OrderProductsTable, List<OrderProductTable>>
  _orderProductsRefsTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.orderProducts,
    aliasName: $_aliasNameGenerator(db.orders.id, db.orderProducts.orderId),
  );

  $$OrderProductsTableProcessedTableManager get orderProductsRefs {
    final manager = $$OrderProductsTableTableManager(
      $_db,
      $_db.orderProducts,
    ).filter((f) => f.orderId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_orderProductsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$OrdersTableFilterComposer extends Composer<_$Database, $OrdersTable> {
  $$OrdersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get paidAmount => $composableBuilder(
    column: $table.paidAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderStatus => $composableBuilder(
    column: $table.orderStatus,
    builder: (column) => ColumnFilters(column),
  );

  $$ClientsTableFilterComposer get clientId {
    final $$ClientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableFilterComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> orderProductsRefs(
    Expression<bool> Function($$OrderProductsTableFilterComposer f) f,
  ) {
    final $$OrderProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.orderProducts,
      getReferencedColumn: (t) => t.orderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrderProductsTableFilterComposer(
            $db: $db,
            $table: $db.orderProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$OrdersTableOrderingComposer extends Composer<_$Database, $OrdersTable> {
  $$OrdersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get paidAmount => $composableBuilder(
    column: $table.paidAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderStatus => $composableBuilder(
    column: $table.orderStatus,
    builder: (column) => ColumnOrderings(column),
  );

  $$ClientsTableOrderingComposer get clientId {
    final $$ClientsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableOrderingComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrdersTableAnnotationComposer
    extends Composer<_$Database, $OrdersTable> {
  $$OrdersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get paidAmount => $composableBuilder(
    column: $table.paidAmount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get orderStatus => $composableBuilder(
    column: $table.orderStatus,
    builder: (column) => column,
  );

  $$ClientsTableAnnotationComposer get clientId {
    final $$ClientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableAnnotationComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> orderProductsRefs<T extends Object>(
    Expression<T> Function($$OrderProductsTableAnnotationComposer a) f,
  ) {
    final $$OrderProductsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.orderProducts,
      getReferencedColumn: (t) => t.orderId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrderProductsTableAnnotationComposer(
            $db: $db,
            $table: $db.orderProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$OrdersTableTableManager
    extends
        RootTableManager<
          _$Database,
          $OrdersTable,
          OrderTable,
          $$OrdersTableFilterComposer,
          $$OrdersTableOrderingComposer,
          $$OrdersTableAnnotationComposer,
          $$OrdersTableCreateCompanionBuilder,
          $$OrdersTableUpdateCompanionBuilder,
          (OrderTable, $$OrdersTableReferences),
          OrderTable,
          PrefetchHooks Function({bool clientId, bool orderProductsRefs})
        > {
  $$OrdersTableTableManager(_$Database db, $OrdersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrdersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrdersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrdersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<double> totalAmount = const Value.absent(),
                Value<double> paidAmount = const Value.absent(),
                Value<int> orderStatus = const Value.absent(),
                Value<int> clientId = const Value.absent(),
              }) => OrdersCompanion(
                id: id,
                createdAt: createdAt,
                totalAmount: totalAmount,
                paidAmount: paidAmount,
                orderStatus: orderStatus,
                clientId: clientId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                required double totalAmount,
                Value<double> paidAmount = const Value.absent(),
                required int orderStatus,
                required int clientId,
              }) => OrdersCompanion.insert(
                id: id,
                createdAt: createdAt,
                totalAmount: totalAmount,
                paidAmount: paidAmount,
                orderStatus: orderStatus,
                clientId: clientId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$OrdersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({clientId = false, orderProductsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (orderProductsRefs) db.orderProducts,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (clientId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.clientId,
                                    referencedTable: $$OrdersTableReferences
                                        ._clientIdTable(db),
                                    referencedColumn: $$OrdersTableReferences
                                        ._clientIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (orderProductsRefs)
                        await $_getPrefetchedData<
                          OrderTable,
                          $OrdersTable,
                          OrderProductTable
                        >(
                          currentTable: table,
                          referencedTable: $$OrdersTableReferences
                              ._orderProductsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$OrdersTableReferences(
                                db,
                                table,
                                p0,
                              ).orderProductsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.orderId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$OrdersTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $OrdersTable,
      OrderTable,
      $$OrdersTableFilterComposer,
      $$OrdersTableOrderingComposer,
      $$OrdersTableAnnotationComposer,
      $$OrdersTableCreateCompanionBuilder,
      $$OrdersTableUpdateCompanionBuilder,
      (OrderTable, $$OrdersTableReferences),
      OrderTable,
      PrefetchHooks Function({bool clientId, bool orderProductsRefs})
    >;
typedef $$OrderProductsTableCreateCompanionBuilder =
    OrderProductsCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      required double customPrice,
      required int customQuantity,
      required int orderId,
      required int warehouseProductId,
    });
typedef $$OrderProductsTableUpdateCompanionBuilder =
    OrderProductsCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      Value<double> customPrice,
      Value<int> customQuantity,
      Value<int> orderId,
      Value<int> warehouseProductId,
    });

final class $$OrderProductsTableReferences
    extends BaseReferences<_$Database, $OrderProductsTable, OrderProductTable> {
  $$OrderProductsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $OrdersTable _orderIdTable(_$Database db) => db.orders.createAlias(
    $_aliasNameGenerator(db.orderProducts.orderId, db.orders.id),
  );

  $$OrdersTableProcessedTableManager get orderId {
    final $_column = $_itemColumn<int>('order_id')!;

    final manager = $$OrdersTableTableManager(
      $_db,
      $_db.orders,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_orderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $WarehouseProductsTable _warehouseProductIdTable(_$Database db) =>
      db.warehouseProducts.createAlias(
        $_aliasNameGenerator(
          db.orderProducts.warehouseProductId,
          db.warehouseProducts.id,
        ),
      );

  $$WarehouseProductsTableProcessedTableManager get warehouseProductId {
    final $_column = $_itemColumn<int>('warehouse_product_id')!;

    final manager = $$WarehouseProductsTableTableManager(
      $_db,
      $_db.warehouseProducts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_warehouseProductIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$OrderProductsTableFilterComposer
    extends Composer<_$Database, $OrderProductsTable> {
  $$OrderProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get customPrice => $composableBuilder(
    column: $table.customPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get customQuantity => $composableBuilder(
    column: $table.customQuantity,
    builder: (column) => ColumnFilters(column),
  );

  $$OrdersTableFilterComposer get orderId {
    final $$OrdersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderId,
      referencedTable: $db.orders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdersTableFilterComposer(
            $db: $db,
            $table: $db.orders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WarehouseProductsTableFilterComposer get warehouseProductId {
    final $$WarehouseProductsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.warehouseProductId,
      referencedTable: $db.warehouseProducts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WarehouseProductsTableFilterComposer(
            $db: $db,
            $table: $db.warehouseProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrderProductsTableOrderingComposer
    extends Composer<_$Database, $OrderProductsTable> {
  $$OrderProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get customPrice => $composableBuilder(
    column: $table.customPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get customQuantity => $composableBuilder(
    column: $table.customQuantity,
    builder: (column) => ColumnOrderings(column),
  );

  $$OrdersTableOrderingComposer get orderId {
    final $$OrdersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderId,
      referencedTable: $db.orders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdersTableOrderingComposer(
            $db: $db,
            $table: $db.orders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WarehouseProductsTableOrderingComposer get warehouseProductId {
    final $$WarehouseProductsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.warehouseProductId,
      referencedTable: $db.warehouseProducts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WarehouseProductsTableOrderingComposer(
            $db: $db,
            $table: $db.warehouseProducts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrderProductsTableAnnotationComposer
    extends Composer<_$Database, $OrderProductsTable> {
  $$OrderProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<double> get customPrice => $composableBuilder(
    column: $table.customPrice,
    builder: (column) => column,
  );

  GeneratedColumn<int> get customQuantity => $composableBuilder(
    column: $table.customQuantity,
    builder: (column) => column,
  );

  $$OrdersTableAnnotationComposer get orderId {
    final $$OrdersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.orderId,
      referencedTable: $db.orders,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdersTableAnnotationComposer(
            $db: $db,
            $table: $db.orders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$WarehouseProductsTableAnnotationComposer get warehouseProductId {
    final $$WarehouseProductsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.warehouseProductId,
          referencedTable: $db.warehouseProducts,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$WarehouseProductsTableAnnotationComposer(
                $db: $db,
                $table: $db.warehouseProducts,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$OrderProductsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $OrderProductsTable,
          OrderProductTable,
          $$OrderProductsTableFilterComposer,
          $$OrderProductsTableOrderingComposer,
          $$OrderProductsTableAnnotationComposer,
          $$OrderProductsTableCreateCompanionBuilder,
          $$OrderProductsTableUpdateCompanionBuilder,
          (OrderProductTable, $$OrderProductsTableReferences),
          OrderProductTable,
          PrefetchHooks Function({bool orderId, bool warehouseProductId})
        > {
  $$OrderProductsTableTableManager(_$Database db, $OrderProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrderProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrderProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrderProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<double> customPrice = const Value.absent(),
                Value<int> customQuantity = const Value.absent(),
                Value<int> orderId = const Value.absent(),
                Value<int> warehouseProductId = const Value.absent(),
              }) => OrderProductsCompanion(
                id: id,
                createdAt: createdAt,
                customPrice: customPrice,
                customQuantity: customQuantity,
                orderId: orderId,
                warehouseProductId: warehouseProductId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                required double customPrice,
                required int customQuantity,
                required int orderId,
                required int warehouseProductId,
              }) => OrderProductsCompanion.insert(
                id: id,
                createdAt: createdAt,
                customPrice: customPrice,
                customQuantity: customQuantity,
                orderId: orderId,
                warehouseProductId: warehouseProductId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$OrderProductsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({orderId = false, warehouseProductId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (orderId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.orderId,
                                    referencedTable:
                                        $$OrderProductsTableReferences
                                            ._orderIdTable(db),
                                    referencedColumn:
                                        $$OrderProductsTableReferences
                                            ._orderIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (warehouseProductId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.warehouseProductId,
                                    referencedTable:
                                        $$OrderProductsTableReferences
                                            ._warehouseProductIdTable(db),
                                    referencedColumn:
                                        $$OrderProductsTableReferences
                                            ._warehouseProductIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$OrderProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $OrderProductsTable,
      OrderProductTable,
      $$OrderProductsTableFilterComposer,
      $$OrderProductsTableOrderingComposer,
      $$OrderProductsTableAnnotationComposer,
      $$OrderProductsTableCreateCompanionBuilder,
      $$OrderProductsTableUpdateCompanionBuilder,
      (OrderProductTable, $$OrderProductsTableReferences),
      OrderProductTable,
      PrefetchHooks Function({bool orderId, bool warehouseProductId})
    >;
typedef $$AdminsTableCreateCompanionBuilder =
    AdminsCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      required String secretName,
      required String secretKey,
      required int adminPermission,
    });
typedef $$AdminsTableUpdateCompanionBuilder =
    AdminsCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
      Value<String> secretName,
      Value<String> secretKey,
      Value<int> adminPermission,
    });

class $$AdminsTableFilterComposer extends Composer<_$Database, $AdminsTable> {
  $$AdminsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get secretName => $composableBuilder(
    column: $table.secretName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get secretKey => $composableBuilder(
    column: $table.secretKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get adminPermission => $composableBuilder(
    column: $table.adminPermission,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AdminsTableOrderingComposer extends Composer<_$Database, $AdminsTable> {
  $$AdminsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get secretName => $composableBuilder(
    column: $table.secretName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get secretKey => $composableBuilder(
    column: $table.secretKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get adminPermission => $composableBuilder(
    column: $table.adminPermission,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AdminsTableAnnotationComposer
    extends Composer<_$Database, $AdminsTable> {
  $$AdminsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get secretName => $composableBuilder(
    column: $table.secretName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get secretKey =>
      $composableBuilder(column: $table.secretKey, builder: (column) => column);

  GeneratedColumn<int> get adminPermission => $composableBuilder(
    column: $table.adminPermission,
    builder: (column) => column,
  );
}

class $$AdminsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $AdminsTable,
          AdminTable,
          $$AdminsTableFilterComposer,
          $$AdminsTableOrderingComposer,
          $$AdminsTableAnnotationComposer,
          $$AdminsTableCreateCompanionBuilder,
          $$AdminsTableUpdateCompanionBuilder,
          (AdminTable, BaseReferences<_$Database, $AdminsTable, AdminTable>),
          AdminTable,
          PrefetchHooks Function()
        > {
  $$AdminsTableTableManager(_$Database db, $AdminsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AdminsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AdminsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AdminsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String> secretName = const Value.absent(),
                Value<String> secretKey = const Value.absent(),
                Value<int> adminPermission = const Value.absent(),
              }) => AdminsCompanion(
                id: id,
                createdAt: createdAt,
                secretName: secretName,
                secretKey: secretKey,
                adminPermission: adminPermission,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                required String secretName,
                required String secretKey,
                required int adminPermission,
              }) => AdminsCompanion.insert(
                id: id,
                createdAt: createdAt,
                secretName: secretName,
                secretKey: secretKey,
                adminPermission: adminPermission,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AdminsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $AdminsTable,
      AdminTable,
      $$AdminsTableFilterComposer,
      $$AdminsTableOrderingComposer,
      $$AdminsTableAnnotationComposer,
      $$AdminsTableCreateCompanionBuilder,
      $$AdminsTableUpdateCompanionBuilder,
      (AdminTable, BaseReferences<_$Database, $AdminsTable, AdminTable>),
      AdminTable,
      PrefetchHooks Function()
    >;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$WarehousesTableTableManager get warehouses =>
      $$WarehousesTableTableManager(_db, _db.warehouses);
  $$ClientsTableTableManager get clients =>
      $$ClientsTableTableManager(_db, _db.clients);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$WarehouseProductsTableTableManager get warehouseProducts =>
      $$WarehouseProductsTableTableManager(_db, _db.warehouseProducts);
  $$ClientProductsTableTableManager get clientProducts =>
      $$ClientProductsTableTableManager(_db, _db.clientProducts);
  $$OrdersTableTableManager get orders =>
      $$OrdersTableTableManager(_db, _db.orders);
  $$OrderProductsTableTableManager get orderProducts =>
      $$OrderProductsTableTableManager(_db, _db.orderProducts);
  $$AdminsTableTableManager get admins =>
      $$AdminsTableTableManager(_db, _db.admins);
}
