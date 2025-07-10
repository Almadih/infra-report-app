// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $LocalReportsTable extends LocalReports
    with TableInfo<$LocalReportsTable, LocalReport> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalReportsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _severityIdMeta = const VerificationMeta(
    'severityId',
  );
  @override
  late final GeneratedColumn<int> severityId = GeneratedColumn<int>(
    'severity_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusIdMeta = const VerificationMeta(
    'statusId',
  );
  @override
  late final GeneratedColumn<int> statusId = GeneratedColumn<int>(
    'status_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _damageTypeIdMeta = const VerificationMeta(
    'damageTypeId',
  );
  @override
  late final GeneratedColumn<int> damageTypeId = GeneratedColumn<int>(
    'damage_type_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
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
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatesMeta = const VerificationMeta(
    'updates',
  );
  @override
  late final GeneratedColumn<String> updates = GeneratedColumn<String>(
    'updates',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _flagsMeta = const VerificationMeta('flags');
  @override
  late final GeneratedColumn<String> flags = GeneratedColumn<String>(
    'flags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _damageTypeNameMeta = const VerificationMeta(
    'damageTypeName',
  );
  @override
  late final GeneratedColumn<String> damageTypeName = GeneratedColumn<String>(
    'damage_type_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _severityNameMeta = const VerificationMeta(
    'severityName',
  );
  @override
  late final GeneratedColumn<String> severityName = GeneratedColumn<String>(
    'severity_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusNameMeta = const VerificationMeta(
    'statusName',
  );
  @override
  late final GeneratedColumn<String> statusName = GeneratedColumn<String>(
    'status_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    severityId,
    statusId,
    damageTypeId,
    latitude,
    longitude,
    description,
    address,
    createdAt,
    updatedAt,
    city,
    updates,
    flags,
    damageTypeName,
    severityName,
    statusName,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_reports';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalReport> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('severity_id')) {
      context.handle(
        _severityIdMeta,
        severityId.isAcceptableOrUnknown(data['severity_id']!, _severityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_severityIdMeta);
    }
    if (data.containsKey('status_id')) {
      context.handle(
        _statusIdMeta,
        statusId.isAcceptableOrUnknown(data['status_id']!, _statusIdMeta),
      );
    } else if (isInserting) {
      context.missing(_statusIdMeta);
    }
    if (data.containsKey('damage_type_id')) {
      context.handle(
        _damageTypeIdMeta,
        damageTypeId.isAcceptableOrUnknown(
          data['damage_type_id']!,
          _damageTypeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_damageTypeIdMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    }
    if (data.containsKey('updates')) {
      context.handle(
        _updatesMeta,
        updates.isAcceptableOrUnknown(data['updates']!, _updatesMeta),
      );
    }
    if (data.containsKey('flags')) {
      context.handle(
        _flagsMeta,
        flags.isAcceptableOrUnknown(data['flags']!, _flagsMeta),
      );
    }
    if (data.containsKey('damage_type_name')) {
      context.handle(
        _damageTypeNameMeta,
        damageTypeName.isAcceptableOrUnknown(
          data['damage_type_name']!,
          _damageTypeNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_damageTypeNameMeta);
    }
    if (data.containsKey('severity_name')) {
      context.handle(
        _severityNameMeta,
        severityName.isAcceptableOrUnknown(
          data['severity_name']!,
          _severityNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_severityNameMeta);
    }
    if (data.containsKey('status_name')) {
      context.handle(
        _statusNameMeta,
        statusName.isAcceptableOrUnknown(data['status_name']!, _statusNameMeta),
      );
    } else if (isInserting) {
      context.missing(_statusNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalReport map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalReport(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      severityId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}severity_id'],
      )!,
      statusId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status_id'],
      )!,
      damageTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}damage_type_id'],
      )!,
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      ),
      updates: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updates'],
      )!,
      flags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}flags'],
      )!,
      damageTypeName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}damage_type_name'],
      )!,
      severityName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}severity_name'],
      )!,
      statusName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status_name'],
      )!,
    );
  }

  @override
  $LocalReportsTable createAlias(String alias) {
    return $LocalReportsTable(attachedDatabase, alias);
  }
}

class LocalReport extends DataClass implements Insertable<LocalReport> {
  final String id;
  final int userId;
  final int severityId;
  final int statusId;
  final int damageTypeId;
  final double latitude;
  final double longitude;
  final String? description;
  final String address;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? city;
  final String updates;
  final String flags;
  final String damageTypeName;
  final String severityName;
  final String statusName;
  const LocalReport({
    required this.id,
    required this.userId,
    required this.severityId,
    required this.statusId,
    required this.damageTypeId,
    required this.latitude,
    required this.longitude,
    this.description,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
    this.city,
    required this.updates,
    required this.flags,
    required this.damageTypeName,
    required this.severityName,
    required this.statusName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<int>(userId);
    map['severity_id'] = Variable<int>(severityId);
    map['status_id'] = Variable<int>(statusId);
    map['damage_type_id'] = Variable<int>(damageTypeId);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['address'] = Variable<String>(address);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    map['updates'] = Variable<String>(updates);
    map['flags'] = Variable<String>(flags);
    map['damage_type_name'] = Variable<String>(damageTypeName);
    map['severity_name'] = Variable<String>(severityName);
    map['status_name'] = Variable<String>(statusName);
    return map;
  }

  LocalReportsCompanion toCompanion(bool nullToAbsent) {
    return LocalReportsCompanion(
      id: Value(id),
      userId: Value(userId),
      severityId: Value(severityId),
      statusId: Value(statusId),
      damageTypeId: Value(damageTypeId),
      latitude: Value(latitude),
      longitude: Value(longitude),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      address: Value(address),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      updates: Value(updates),
      flags: Value(flags),
      damageTypeName: Value(damageTypeName),
      severityName: Value(severityName),
      statusName: Value(statusName),
    );
  }

  factory LocalReport.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalReport(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      severityId: serializer.fromJson<int>(json['severityId']),
      statusId: serializer.fromJson<int>(json['statusId']),
      damageTypeId: serializer.fromJson<int>(json['damageTypeId']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      description: serializer.fromJson<String?>(json['description']),
      address: serializer.fromJson<String>(json['address']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      city: serializer.fromJson<String?>(json['city']),
      updates: serializer.fromJson<String>(json['updates']),
      flags: serializer.fromJson<String>(json['flags']),
      damageTypeName: serializer.fromJson<String>(json['damageTypeName']),
      severityName: serializer.fromJson<String>(json['severityName']),
      statusName: serializer.fromJson<String>(json['statusName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<int>(userId),
      'severityId': serializer.toJson<int>(severityId),
      'statusId': serializer.toJson<int>(statusId),
      'damageTypeId': serializer.toJson<int>(damageTypeId),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'description': serializer.toJson<String?>(description),
      'address': serializer.toJson<String>(address),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'city': serializer.toJson<String?>(city),
      'updates': serializer.toJson<String>(updates),
      'flags': serializer.toJson<String>(flags),
      'damageTypeName': serializer.toJson<String>(damageTypeName),
      'severityName': serializer.toJson<String>(severityName),
      'statusName': serializer.toJson<String>(statusName),
    };
  }

  LocalReport copyWith({
    String? id,
    int? userId,
    int? severityId,
    int? statusId,
    int? damageTypeId,
    double? latitude,
    double? longitude,
    Value<String?> description = const Value.absent(),
    String? address,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<String?> city = const Value.absent(),
    String? updates,
    String? flags,
    String? damageTypeName,
    String? severityName,
    String? statusName,
  }) => LocalReport(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    severityId: severityId ?? this.severityId,
    statusId: statusId ?? this.statusId,
    damageTypeId: damageTypeId ?? this.damageTypeId,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    description: description.present ? description.value : this.description,
    address: address ?? this.address,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    city: city.present ? city.value : this.city,
    updates: updates ?? this.updates,
    flags: flags ?? this.flags,
    damageTypeName: damageTypeName ?? this.damageTypeName,
    severityName: severityName ?? this.severityName,
    statusName: statusName ?? this.statusName,
  );
  LocalReport copyWithCompanion(LocalReportsCompanion data) {
    return LocalReport(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      severityId: data.severityId.present
          ? data.severityId.value
          : this.severityId,
      statusId: data.statusId.present ? data.statusId.value : this.statusId,
      damageTypeId: data.damageTypeId.present
          ? data.damageTypeId.value
          : this.damageTypeId,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      description: data.description.present
          ? data.description.value
          : this.description,
      address: data.address.present ? data.address.value : this.address,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      city: data.city.present ? data.city.value : this.city,
      updates: data.updates.present ? data.updates.value : this.updates,
      flags: data.flags.present ? data.flags.value : this.flags,
      damageTypeName: data.damageTypeName.present
          ? data.damageTypeName.value
          : this.damageTypeName,
      severityName: data.severityName.present
          ? data.severityName.value
          : this.severityName,
      statusName: data.statusName.present
          ? data.statusName.value
          : this.statusName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalReport(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('severityId: $severityId, ')
          ..write('statusId: $statusId, ')
          ..write('damageTypeId: $damageTypeId, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('description: $description, ')
          ..write('address: $address, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('city: $city, ')
          ..write('updates: $updates, ')
          ..write('flags: $flags, ')
          ..write('damageTypeName: $damageTypeName, ')
          ..write('severityName: $severityName, ')
          ..write('statusName: $statusName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    severityId,
    statusId,
    damageTypeId,
    latitude,
    longitude,
    description,
    address,
    createdAt,
    updatedAt,
    city,
    updates,
    flags,
    damageTypeName,
    severityName,
    statusName,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalReport &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.severityId == this.severityId &&
          other.statusId == this.statusId &&
          other.damageTypeId == this.damageTypeId &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.description == this.description &&
          other.address == this.address &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.city == this.city &&
          other.updates == this.updates &&
          other.flags == this.flags &&
          other.damageTypeName == this.damageTypeName &&
          other.severityName == this.severityName &&
          other.statusName == this.statusName);
}

class LocalReportsCompanion extends UpdateCompanion<LocalReport> {
  final Value<String> id;
  final Value<int> userId;
  final Value<int> severityId;
  final Value<int> statusId;
  final Value<int> damageTypeId;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<String?> description;
  final Value<String> address;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String?> city;
  final Value<String> updates;
  final Value<String> flags;
  final Value<String> damageTypeName;
  final Value<String> severityName;
  final Value<String> statusName;
  final Value<int> rowid;
  const LocalReportsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.severityId = const Value.absent(),
    this.statusId = const Value.absent(),
    this.damageTypeId = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.description = const Value.absent(),
    this.address = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.city = const Value.absent(),
    this.updates = const Value.absent(),
    this.flags = const Value.absent(),
    this.damageTypeName = const Value.absent(),
    this.severityName = const Value.absent(),
    this.statusName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocalReportsCompanion.insert({
    required String id,
    required int userId,
    required int severityId,
    required int statusId,
    required int damageTypeId,
    required double latitude,
    required double longitude,
    this.description = const Value.absent(),
    required String address,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.city = const Value.absent(),
    this.updates = const Value.absent(),
    this.flags = const Value.absent(),
    required String damageTypeName,
    required String severityName,
    required String statusName,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       severityId = Value(severityId),
       statusId = Value(statusId),
       damageTypeId = Value(damageTypeId),
       latitude = Value(latitude),
       longitude = Value(longitude),
       address = Value(address),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       damageTypeName = Value(damageTypeName),
       severityName = Value(severityName),
       statusName = Value(statusName);
  static Insertable<LocalReport> custom({
    Expression<String>? id,
    Expression<int>? userId,
    Expression<int>? severityId,
    Expression<int>? statusId,
    Expression<int>? damageTypeId,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? description,
    Expression<String>? address,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? city,
    Expression<String>? updates,
    Expression<String>? flags,
    Expression<String>? damageTypeName,
    Expression<String>? severityName,
    Expression<String>? statusName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (severityId != null) 'severity_id': severityId,
      if (statusId != null) 'status_id': statusId,
      if (damageTypeId != null) 'damage_type_id': damageTypeId,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (description != null) 'description': description,
      if (address != null) 'address': address,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (city != null) 'city': city,
      if (updates != null) 'updates': updates,
      if (flags != null) 'flags': flags,
      if (damageTypeName != null) 'damage_type_name': damageTypeName,
      if (severityName != null) 'severity_name': severityName,
      if (statusName != null) 'status_name': statusName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocalReportsCompanion copyWith({
    Value<String>? id,
    Value<int>? userId,
    Value<int>? severityId,
    Value<int>? statusId,
    Value<int>? damageTypeId,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<String?>? description,
    Value<String>? address,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String?>? city,
    Value<String>? updates,
    Value<String>? flags,
    Value<String>? damageTypeName,
    Value<String>? severityName,
    Value<String>? statusName,
    Value<int>? rowid,
  }) {
    return LocalReportsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      severityId: severityId ?? this.severityId,
      statusId: statusId ?? this.statusId,
      damageTypeId: damageTypeId ?? this.damageTypeId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      description: description ?? this.description,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      city: city ?? this.city,
      updates: updates ?? this.updates,
      flags: flags ?? this.flags,
      damageTypeName: damageTypeName ?? this.damageTypeName,
      severityName: severityName ?? this.severityName,
      statusName: statusName ?? this.statusName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (severityId.present) {
      map['severity_id'] = Variable<int>(severityId.value);
    }
    if (statusId.present) {
      map['status_id'] = Variable<int>(statusId.value);
    }
    if (damageTypeId.present) {
      map['damage_type_id'] = Variable<int>(damageTypeId.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (updates.present) {
      map['updates'] = Variable<String>(updates.value);
    }
    if (flags.present) {
      map['flags'] = Variable<String>(flags.value);
    }
    if (damageTypeName.present) {
      map['damage_type_name'] = Variable<String>(damageTypeName.value);
    }
    if (severityName.present) {
      map['severity_name'] = Variable<String>(severityName.value);
    }
    if (statusName.present) {
      map['status_name'] = Variable<String>(statusName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalReportsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('severityId: $severityId, ')
          ..write('statusId: $statusId, ')
          ..write('damageTypeId: $damageTypeId, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('description: $description, ')
          ..write('address: $address, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('city: $city, ')
          ..write('updates: $updates, ')
          ..write('flags: $flags, ')
          ..write('damageTypeName: $damageTypeName, ')
          ..write('severityName: $severityName, ')
          ..write('statusName: $statusName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LocalReportImagesTable extends LocalReportImages
    with TableInfo<$LocalReportImagesTable, LocalReportImage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalReportImagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _reportIdMeta = const VerificationMeta(
    'reportId',
  );
  @override
  late final GeneratedColumn<String> reportId = GeneratedColumn<String>(
    'report_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES local_reports (id)',
    ),
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, reportId, url];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_report_images';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalReportImage> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('report_id')) {
      context.handle(
        _reportIdMeta,
        reportId.isAcceptableOrUnknown(data['report_id']!, _reportIdMeta),
      );
    } else if (isInserting) {
      context.missing(_reportIdMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalReportImage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalReportImage(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      reportId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}report_id'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
    );
  }

  @override
  $LocalReportImagesTable createAlias(String alias) {
    return $LocalReportImagesTable(attachedDatabase, alias);
  }
}

class LocalReportImage extends DataClass
    implements Insertable<LocalReportImage> {
  final int id;
  final String reportId;
  final String url;
  const LocalReportImage({
    required this.id,
    required this.reportId,
    required this.url,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['report_id'] = Variable<String>(reportId);
    map['url'] = Variable<String>(url);
    return map;
  }

  LocalReportImagesCompanion toCompanion(bool nullToAbsent) {
    return LocalReportImagesCompanion(
      id: Value(id),
      reportId: Value(reportId),
      url: Value(url),
    );
  }

  factory LocalReportImage.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalReportImage(
      id: serializer.fromJson<int>(json['id']),
      reportId: serializer.fromJson<String>(json['reportId']),
      url: serializer.fromJson<String>(json['url']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'reportId': serializer.toJson<String>(reportId),
      'url': serializer.toJson<String>(url),
    };
  }

  LocalReportImage copyWith({int? id, String? reportId, String? url}) =>
      LocalReportImage(
        id: id ?? this.id,
        reportId: reportId ?? this.reportId,
        url: url ?? this.url,
      );
  LocalReportImage copyWithCompanion(LocalReportImagesCompanion data) {
    return LocalReportImage(
      id: data.id.present ? data.id.value : this.id,
      reportId: data.reportId.present ? data.reportId.value : this.reportId,
      url: data.url.present ? data.url.value : this.url,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalReportImage(')
          ..write('id: $id, ')
          ..write('reportId: $reportId, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, reportId, url);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalReportImage &&
          other.id == this.id &&
          other.reportId == this.reportId &&
          other.url == this.url);
}

class LocalReportImagesCompanion extends UpdateCompanion<LocalReportImage> {
  final Value<int> id;
  final Value<String> reportId;
  final Value<String> url;
  const LocalReportImagesCompanion({
    this.id = const Value.absent(),
    this.reportId = const Value.absent(),
    this.url = const Value.absent(),
  });
  LocalReportImagesCompanion.insert({
    this.id = const Value.absent(),
    required String reportId,
    required String url,
  }) : reportId = Value(reportId),
       url = Value(url);
  static Insertable<LocalReportImage> custom({
    Expression<int>? id,
    Expression<String>? reportId,
    Expression<String>? url,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reportId != null) 'report_id': reportId,
      if (url != null) 'url': url,
    });
  }

  LocalReportImagesCompanion copyWith({
    Value<int>? id,
    Value<String>? reportId,
    Value<String>? url,
  }) {
    return LocalReportImagesCompanion(
      id: id ?? this.id,
      reportId: reportId ?? this.reportId,
      url: url ?? this.url,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (reportId.present) {
      map['report_id'] = Variable<String>(reportId.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalReportImagesCompanion(')
          ..write('id: $id, ')
          ..write('reportId: $reportId, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }
}

class $LocalDamageTypesTable extends LocalDamageTypes
    with TableInfo<$LocalDamageTypesTable, LocalDamageType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalDamageTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
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
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_damage_types';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalDamageType> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalDamageType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalDamageType(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $LocalDamageTypesTable createAlias(String alias) {
    return $LocalDamageTypesTable(attachedDatabase, alias);
  }
}

class LocalDamageType extends DataClass implements Insertable<LocalDamageType> {
  final int id;
  final String name;
  const LocalDamageType({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  LocalDamageTypesCompanion toCompanion(bool nullToAbsent) {
    return LocalDamageTypesCompanion(id: Value(id), name: Value(name));
  }

  factory LocalDamageType.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalDamageType(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  LocalDamageType copyWith({int? id, String? name}) =>
      LocalDamageType(id: id ?? this.id, name: name ?? this.name);
  LocalDamageType copyWithCompanion(LocalDamageTypesCompanion data) {
    return LocalDamageType(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalDamageType(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalDamageType &&
          other.id == this.id &&
          other.name == this.name);
}

class LocalDamageTypesCompanion extends UpdateCompanion<LocalDamageType> {
  final Value<int> id;
  final Value<String> name;
  const LocalDamageTypesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  LocalDamageTypesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<LocalDamageType> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  LocalDamageTypesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return LocalDamageTypesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalDamageTypesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $LocalSeveritiesTable extends LocalSeverities
    with TableInfo<$LocalSeveritiesTable, LocalSeverity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalSeveritiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
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
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_severities';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocalSeverity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocalSeverity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalSeverity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $LocalSeveritiesTable createAlias(String alias) {
    return $LocalSeveritiesTable(attachedDatabase, alias);
  }
}

class LocalSeverity extends DataClass implements Insertable<LocalSeverity> {
  final int id;
  final String name;
  const LocalSeverity({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  LocalSeveritiesCompanion toCompanion(bool nullToAbsent) {
    return LocalSeveritiesCompanion(id: Value(id), name: Value(name));
  }

  factory LocalSeverity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalSeverity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  LocalSeverity copyWith({int? id, String? name}) =>
      LocalSeverity(id: id ?? this.id, name: name ?? this.name);
  LocalSeverity copyWithCompanion(LocalSeveritiesCompanion data) {
    return LocalSeverity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalSeverity(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalSeverity &&
          other.id == this.id &&
          other.name == this.name);
}

class LocalSeveritiesCompanion extends UpdateCompanion<LocalSeverity> {
  final Value<int> id;
  final Value<String> name;
  const LocalSeveritiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  LocalSeveritiesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<LocalSeverity> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  LocalSeveritiesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return LocalSeveritiesCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalSeveritiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $MyLocalReportsTable extends MyLocalReports
    with TableInfo<$MyLocalReportsTable, MyLocalReport> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MyLocalReportsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _severityIdMeta = const VerificationMeta(
    'severityId',
  );
  @override
  late final GeneratedColumn<int> severityId = GeneratedColumn<int>(
    'severity_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusIdMeta = const VerificationMeta(
    'statusId',
  );
  @override
  late final GeneratedColumn<int> statusId = GeneratedColumn<int>(
    'status_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _damageTypeIdMeta = const VerificationMeta(
    'damageTypeId',
  );
  @override
  late final GeneratedColumn<int> damageTypeId = GeneratedColumn<int>(
    'damage_type_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
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
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _damageTypeNameMeta = const VerificationMeta(
    'damageTypeName',
  );
  @override
  late final GeneratedColumn<String> damageTypeName = GeneratedColumn<String>(
    'damage_type_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _severityNameMeta = const VerificationMeta(
    'severityName',
  );
  @override
  late final GeneratedColumn<String> severityName = GeneratedColumn<String>(
    'severity_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusNameMeta = const VerificationMeta(
    'statusName',
  );
  @override
  late final GeneratedColumn<String> statusName = GeneratedColumn<String>(
    'status_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    severityId,
    statusId,
    damageTypeId,
    latitude,
    longitude,
    description,
    address,
    createdAt,
    updatedAt,
    city,
    damageTypeName,
    severityName,
    statusName,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'my_local_reports';
  @override
  VerificationContext validateIntegrity(
    Insertable<MyLocalReport> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('severity_id')) {
      context.handle(
        _severityIdMeta,
        severityId.isAcceptableOrUnknown(data['severity_id']!, _severityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_severityIdMeta);
    }
    if (data.containsKey('status_id')) {
      context.handle(
        _statusIdMeta,
        statusId.isAcceptableOrUnknown(data['status_id']!, _statusIdMeta),
      );
    } else if (isInserting) {
      context.missing(_statusIdMeta);
    }
    if (data.containsKey('damage_type_id')) {
      context.handle(
        _damageTypeIdMeta,
        damageTypeId.isAcceptableOrUnknown(
          data['damage_type_id']!,
          _damageTypeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_damageTypeIdMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    }
    if (data.containsKey('damage_type_name')) {
      context.handle(
        _damageTypeNameMeta,
        damageTypeName.isAcceptableOrUnknown(
          data['damage_type_name']!,
          _damageTypeNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_damageTypeNameMeta);
    }
    if (data.containsKey('severity_name')) {
      context.handle(
        _severityNameMeta,
        severityName.isAcceptableOrUnknown(
          data['severity_name']!,
          _severityNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_severityNameMeta);
    }
    if (data.containsKey('status_name')) {
      context.handle(
        _statusNameMeta,
        statusName.isAcceptableOrUnknown(data['status_name']!, _statusNameMeta),
      );
    } else if (isInserting) {
      context.missing(_statusNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MyLocalReport map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MyLocalReport(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      severityId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}severity_id'],
      )!,
      statusId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status_id'],
      )!,
      damageTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}damage_type_id'],
      )!,
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      ),
      damageTypeName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}damage_type_name'],
      )!,
      severityName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}severity_name'],
      )!,
      statusName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status_name'],
      )!,
    );
  }

  @override
  $MyLocalReportsTable createAlias(String alias) {
    return $MyLocalReportsTable(attachedDatabase, alias);
  }
}

class MyLocalReport extends DataClass implements Insertable<MyLocalReport> {
  final String id;
  final int userId;
  final int severityId;
  final int statusId;
  final int damageTypeId;
  final double latitude;
  final double longitude;
  final String? description;
  final String address;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? city;
  final String damageTypeName;
  final String severityName;
  final String statusName;
  const MyLocalReport({
    required this.id,
    required this.userId,
    required this.severityId,
    required this.statusId,
    required this.damageTypeId,
    required this.latitude,
    required this.longitude,
    this.description,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
    this.city,
    required this.damageTypeName,
    required this.severityName,
    required this.statusName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<int>(userId);
    map['severity_id'] = Variable<int>(severityId);
    map['status_id'] = Variable<int>(statusId);
    map['damage_type_id'] = Variable<int>(damageTypeId);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['address'] = Variable<String>(address);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    map['damage_type_name'] = Variable<String>(damageTypeName);
    map['severity_name'] = Variable<String>(severityName);
    map['status_name'] = Variable<String>(statusName);
    return map;
  }

  MyLocalReportsCompanion toCompanion(bool nullToAbsent) {
    return MyLocalReportsCompanion(
      id: Value(id),
      userId: Value(userId),
      severityId: Value(severityId),
      statusId: Value(statusId),
      damageTypeId: Value(damageTypeId),
      latitude: Value(latitude),
      longitude: Value(longitude),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      address: Value(address),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      damageTypeName: Value(damageTypeName),
      severityName: Value(severityName),
      statusName: Value(statusName),
    );
  }

  factory MyLocalReport.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MyLocalReport(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      severityId: serializer.fromJson<int>(json['severityId']),
      statusId: serializer.fromJson<int>(json['statusId']),
      damageTypeId: serializer.fromJson<int>(json['damageTypeId']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      description: serializer.fromJson<String?>(json['description']),
      address: serializer.fromJson<String>(json['address']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      city: serializer.fromJson<String?>(json['city']),
      damageTypeName: serializer.fromJson<String>(json['damageTypeName']),
      severityName: serializer.fromJson<String>(json['severityName']),
      statusName: serializer.fromJson<String>(json['statusName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<int>(userId),
      'severityId': serializer.toJson<int>(severityId),
      'statusId': serializer.toJson<int>(statusId),
      'damageTypeId': serializer.toJson<int>(damageTypeId),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'description': serializer.toJson<String?>(description),
      'address': serializer.toJson<String>(address),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'city': serializer.toJson<String?>(city),
      'damageTypeName': serializer.toJson<String>(damageTypeName),
      'severityName': serializer.toJson<String>(severityName),
      'statusName': serializer.toJson<String>(statusName),
    };
  }

  MyLocalReport copyWith({
    String? id,
    int? userId,
    int? severityId,
    int? statusId,
    int? damageTypeId,
    double? latitude,
    double? longitude,
    Value<String?> description = const Value.absent(),
    String? address,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<String?> city = const Value.absent(),
    String? damageTypeName,
    String? severityName,
    String? statusName,
  }) => MyLocalReport(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    severityId: severityId ?? this.severityId,
    statusId: statusId ?? this.statusId,
    damageTypeId: damageTypeId ?? this.damageTypeId,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    description: description.present ? description.value : this.description,
    address: address ?? this.address,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    city: city.present ? city.value : this.city,
    damageTypeName: damageTypeName ?? this.damageTypeName,
    severityName: severityName ?? this.severityName,
    statusName: statusName ?? this.statusName,
  );
  MyLocalReport copyWithCompanion(MyLocalReportsCompanion data) {
    return MyLocalReport(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      severityId: data.severityId.present
          ? data.severityId.value
          : this.severityId,
      statusId: data.statusId.present ? data.statusId.value : this.statusId,
      damageTypeId: data.damageTypeId.present
          ? data.damageTypeId.value
          : this.damageTypeId,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      description: data.description.present
          ? data.description.value
          : this.description,
      address: data.address.present ? data.address.value : this.address,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      city: data.city.present ? data.city.value : this.city,
      damageTypeName: data.damageTypeName.present
          ? data.damageTypeName.value
          : this.damageTypeName,
      severityName: data.severityName.present
          ? data.severityName.value
          : this.severityName,
      statusName: data.statusName.present
          ? data.statusName.value
          : this.statusName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MyLocalReport(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('severityId: $severityId, ')
          ..write('statusId: $statusId, ')
          ..write('damageTypeId: $damageTypeId, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('description: $description, ')
          ..write('address: $address, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('city: $city, ')
          ..write('damageTypeName: $damageTypeName, ')
          ..write('severityName: $severityName, ')
          ..write('statusName: $statusName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    severityId,
    statusId,
    damageTypeId,
    latitude,
    longitude,
    description,
    address,
    createdAt,
    updatedAt,
    city,
    damageTypeName,
    severityName,
    statusName,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyLocalReport &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.severityId == this.severityId &&
          other.statusId == this.statusId &&
          other.damageTypeId == this.damageTypeId &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.description == this.description &&
          other.address == this.address &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.city == this.city &&
          other.damageTypeName == this.damageTypeName &&
          other.severityName == this.severityName &&
          other.statusName == this.statusName);
}

class MyLocalReportsCompanion extends UpdateCompanion<MyLocalReport> {
  final Value<String> id;
  final Value<int> userId;
  final Value<int> severityId;
  final Value<int> statusId;
  final Value<int> damageTypeId;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<String?> description;
  final Value<String> address;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String?> city;
  final Value<String> damageTypeName;
  final Value<String> severityName;
  final Value<String> statusName;
  final Value<int> rowid;
  const MyLocalReportsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.severityId = const Value.absent(),
    this.statusId = const Value.absent(),
    this.damageTypeId = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.description = const Value.absent(),
    this.address = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.city = const Value.absent(),
    this.damageTypeName = const Value.absent(),
    this.severityName = const Value.absent(),
    this.statusName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MyLocalReportsCompanion.insert({
    required String id,
    required int userId,
    required int severityId,
    required int statusId,
    required int damageTypeId,
    required double latitude,
    required double longitude,
    this.description = const Value.absent(),
    required String address,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.city = const Value.absent(),
    required String damageTypeName,
    required String severityName,
    required String statusName,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       severityId = Value(severityId),
       statusId = Value(statusId),
       damageTypeId = Value(damageTypeId),
       latitude = Value(latitude),
       longitude = Value(longitude),
       address = Value(address),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       damageTypeName = Value(damageTypeName),
       severityName = Value(severityName),
       statusName = Value(statusName);
  static Insertable<MyLocalReport> custom({
    Expression<String>? id,
    Expression<int>? userId,
    Expression<int>? severityId,
    Expression<int>? statusId,
    Expression<int>? damageTypeId,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? description,
    Expression<String>? address,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? city,
    Expression<String>? damageTypeName,
    Expression<String>? severityName,
    Expression<String>? statusName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (severityId != null) 'severity_id': severityId,
      if (statusId != null) 'status_id': statusId,
      if (damageTypeId != null) 'damage_type_id': damageTypeId,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (description != null) 'description': description,
      if (address != null) 'address': address,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (city != null) 'city': city,
      if (damageTypeName != null) 'damage_type_name': damageTypeName,
      if (severityName != null) 'severity_name': severityName,
      if (statusName != null) 'status_name': statusName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MyLocalReportsCompanion copyWith({
    Value<String>? id,
    Value<int>? userId,
    Value<int>? severityId,
    Value<int>? statusId,
    Value<int>? damageTypeId,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<String?>? description,
    Value<String>? address,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<String?>? city,
    Value<String>? damageTypeName,
    Value<String>? severityName,
    Value<String>? statusName,
    Value<int>? rowid,
  }) {
    return MyLocalReportsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      severityId: severityId ?? this.severityId,
      statusId: statusId ?? this.statusId,
      damageTypeId: damageTypeId ?? this.damageTypeId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      description: description ?? this.description,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      city: city ?? this.city,
      damageTypeName: damageTypeName ?? this.damageTypeName,
      severityName: severityName ?? this.severityName,
      statusName: statusName ?? this.statusName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (severityId.present) {
      map['severity_id'] = Variable<int>(severityId.value);
    }
    if (statusId.present) {
      map['status_id'] = Variable<int>(statusId.value);
    }
    if (damageTypeId.present) {
      map['damage_type_id'] = Variable<int>(damageTypeId.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (damageTypeName.present) {
      map['damage_type_name'] = Variable<String>(damageTypeName.value);
    }
    if (severityName.present) {
      map['severity_name'] = Variable<String>(severityName.value);
    }
    if (statusName.present) {
      map['status_name'] = Variable<String>(statusName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MyLocalReportsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('severityId: $severityId, ')
          ..write('statusId: $statusId, ')
          ..write('damageTypeId: $damageTypeId, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('description: $description, ')
          ..write('address: $address, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('city: $city, ')
          ..write('damageTypeName: $damageTypeName, ')
          ..write('severityName: $severityName, ')
          ..write('statusName: $statusName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PendingReportsTable extends PendingReports
    with TableInfo<$PendingReportsTable, PendingReport> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PendingReportsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _imagePathsMeta = const VerificationMeta(
    'imagePaths',
  );
  @override
  late final GeneratedColumn<String> imagePaths = GeneratedColumn<String>(
    'image_paths',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _damageTypeIdMeta = const VerificationMeta(
    'damageTypeId',
  );
  @override
  late final GeneratedColumn<int> damageTypeId = GeneratedColumn<int>(
    'damage_type_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _severityIdMeta = const VerificationMeta(
    'severityId',
  );
  @override
  late final GeneratedColumn<int> severityId = GeneratedColumn<int>(
    'severity_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    true,
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
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncingMeta = const VerificationMeta(
    'isSyncing',
  );
  @override
  late final GeneratedColumn<bool> isSyncing = GeneratedColumn<bool>(
    'is_syncing',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_syncing" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    uuid,
    imagePaths,
    latitude,
    longitude,
    damageTypeId,
    severityId,
    description,
    city,
    address,
    isSyncing,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pending_reports';
  @override
  VerificationContext validateIntegrity(
    Insertable<PendingReport> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('image_paths')) {
      context.handle(
        _imagePathsMeta,
        imagePaths.isAcceptableOrUnknown(data['image_paths']!, _imagePathsMeta),
      );
    } else if (isInserting) {
      context.missing(_imagePathsMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('damage_type_id')) {
      context.handle(
        _damageTypeIdMeta,
        damageTypeId.isAcceptableOrUnknown(
          data['damage_type_id']!,
          _damageTypeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_damageTypeIdMeta);
    }
    if (data.containsKey('severity_id')) {
      context.handle(
        _severityIdMeta,
        severityId.isAcceptableOrUnknown(data['severity_id']!, _severityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_severityIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('is_syncing')) {
      context.handle(
        _isSyncingMeta,
        isSyncing.isAcceptableOrUnknown(data['is_syncing']!, _isSyncingMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PendingReport map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PendingReport(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      imagePaths: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_paths'],
      )!,
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      damageTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}damage_type_id'],
      )!,
      severityId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}severity_id'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      isSyncing: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_syncing'],
      )!,
    );
  }

  @override
  $PendingReportsTable createAlias(String alias) {
    return $PendingReportsTable(attachedDatabase, alias);
  }
}

class PendingReport extends DataClass implements Insertable<PendingReport> {
  final int id;
  final String uuid;
  final String imagePaths;
  final double latitude;
  final double longitude;
  final int damageTypeId;
  final int severityId;
  final String? description;
  final String? city;
  final String address;
  final bool isSyncing;
  const PendingReport({
    required this.id,
    required this.uuid,
    required this.imagePaths,
    required this.latitude,
    required this.longitude,
    required this.damageTypeId,
    required this.severityId,
    this.description,
    this.city,
    required this.address,
    required this.isSyncing,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['uuid'] = Variable<String>(uuid);
    map['image_paths'] = Variable<String>(imagePaths);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['damage_type_id'] = Variable<int>(damageTypeId);
    map['severity_id'] = Variable<int>(severityId);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    map['address'] = Variable<String>(address);
    map['is_syncing'] = Variable<bool>(isSyncing);
    return map;
  }

  PendingReportsCompanion toCompanion(bool nullToAbsent) {
    return PendingReportsCompanion(
      id: Value(id),
      uuid: Value(uuid),
      imagePaths: Value(imagePaths),
      latitude: Value(latitude),
      longitude: Value(longitude),
      damageTypeId: Value(damageTypeId),
      severityId: Value(severityId),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      address: Value(address),
      isSyncing: Value(isSyncing),
    );
  }

  factory PendingReport.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendingReport(
      id: serializer.fromJson<int>(json['id']),
      uuid: serializer.fromJson<String>(json['uuid']),
      imagePaths: serializer.fromJson<String>(json['imagePaths']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      damageTypeId: serializer.fromJson<int>(json['damageTypeId']),
      severityId: serializer.fromJson<int>(json['severityId']),
      description: serializer.fromJson<String?>(json['description']),
      city: serializer.fromJson<String?>(json['city']),
      address: serializer.fromJson<String>(json['address']),
      isSyncing: serializer.fromJson<bool>(json['isSyncing']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'uuid': serializer.toJson<String>(uuid),
      'imagePaths': serializer.toJson<String>(imagePaths),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'damageTypeId': serializer.toJson<int>(damageTypeId),
      'severityId': serializer.toJson<int>(severityId),
      'description': serializer.toJson<String?>(description),
      'city': serializer.toJson<String?>(city),
      'address': serializer.toJson<String>(address),
      'isSyncing': serializer.toJson<bool>(isSyncing),
    };
  }

  PendingReport copyWith({
    int? id,
    String? uuid,
    String? imagePaths,
    double? latitude,
    double? longitude,
    int? damageTypeId,
    int? severityId,
    Value<String?> description = const Value.absent(),
    Value<String?> city = const Value.absent(),
    String? address,
    bool? isSyncing,
  }) => PendingReport(
    id: id ?? this.id,
    uuid: uuid ?? this.uuid,
    imagePaths: imagePaths ?? this.imagePaths,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    damageTypeId: damageTypeId ?? this.damageTypeId,
    severityId: severityId ?? this.severityId,
    description: description.present ? description.value : this.description,
    city: city.present ? city.value : this.city,
    address: address ?? this.address,
    isSyncing: isSyncing ?? this.isSyncing,
  );
  PendingReport copyWithCompanion(PendingReportsCompanion data) {
    return PendingReport(
      id: data.id.present ? data.id.value : this.id,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      imagePaths: data.imagePaths.present
          ? data.imagePaths.value
          : this.imagePaths,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      damageTypeId: data.damageTypeId.present
          ? data.damageTypeId.value
          : this.damageTypeId,
      severityId: data.severityId.present
          ? data.severityId.value
          : this.severityId,
      description: data.description.present
          ? data.description.value
          : this.description,
      city: data.city.present ? data.city.value : this.city,
      address: data.address.present ? data.address.value : this.address,
      isSyncing: data.isSyncing.present ? data.isSyncing.value : this.isSyncing,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendingReport(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('imagePaths: $imagePaths, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('damageTypeId: $damageTypeId, ')
          ..write('severityId: $severityId, ')
          ..write('description: $description, ')
          ..write('city: $city, ')
          ..write('address: $address, ')
          ..write('isSyncing: $isSyncing')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    uuid,
    imagePaths,
    latitude,
    longitude,
    damageTypeId,
    severityId,
    description,
    city,
    address,
    isSyncing,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendingReport &&
          other.id == this.id &&
          other.uuid == this.uuid &&
          other.imagePaths == this.imagePaths &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.damageTypeId == this.damageTypeId &&
          other.severityId == this.severityId &&
          other.description == this.description &&
          other.city == this.city &&
          other.address == this.address &&
          other.isSyncing == this.isSyncing);
}

class PendingReportsCompanion extends UpdateCompanion<PendingReport> {
  final Value<int> id;
  final Value<String> uuid;
  final Value<String> imagePaths;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<int> damageTypeId;
  final Value<int> severityId;
  final Value<String?> description;
  final Value<String?> city;
  final Value<String> address;
  final Value<bool> isSyncing;
  const PendingReportsCompanion({
    this.id = const Value.absent(),
    this.uuid = const Value.absent(),
    this.imagePaths = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.damageTypeId = const Value.absent(),
    this.severityId = const Value.absent(),
    this.description = const Value.absent(),
    this.city = const Value.absent(),
    this.address = const Value.absent(),
    this.isSyncing = const Value.absent(),
  });
  PendingReportsCompanion.insert({
    this.id = const Value.absent(),
    required String uuid,
    required String imagePaths,
    required double latitude,
    required double longitude,
    required int damageTypeId,
    required int severityId,
    this.description = const Value.absent(),
    this.city = const Value.absent(),
    required String address,
    this.isSyncing = const Value.absent(),
  }) : uuid = Value(uuid),
       imagePaths = Value(imagePaths),
       latitude = Value(latitude),
       longitude = Value(longitude),
       damageTypeId = Value(damageTypeId),
       severityId = Value(severityId),
       address = Value(address);
  static Insertable<PendingReport> custom({
    Expression<int>? id,
    Expression<String>? uuid,
    Expression<String>? imagePaths,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<int>? damageTypeId,
    Expression<int>? severityId,
    Expression<String>? description,
    Expression<String>? city,
    Expression<String>? address,
    Expression<bool>? isSyncing,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (uuid != null) 'uuid': uuid,
      if (imagePaths != null) 'image_paths': imagePaths,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (damageTypeId != null) 'damage_type_id': damageTypeId,
      if (severityId != null) 'severity_id': severityId,
      if (description != null) 'description': description,
      if (city != null) 'city': city,
      if (address != null) 'address': address,
      if (isSyncing != null) 'is_syncing': isSyncing,
    });
  }

  PendingReportsCompanion copyWith({
    Value<int>? id,
    Value<String>? uuid,
    Value<String>? imagePaths,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<int>? damageTypeId,
    Value<int>? severityId,
    Value<String?>? description,
    Value<String?>? city,
    Value<String>? address,
    Value<bool>? isSyncing,
  }) {
    return PendingReportsCompanion(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      imagePaths: imagePaths ?? this.imagePaths,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      damageTypeId: damageTypeId ?? this.damageTypeId,
      severityId: severityId ?? this.severityId,
      description: description ?? this.description,
      city: city ?? this.city,
      address: address ?? this.address,
      isSyncing: isSyncing ?? this.isSyncing,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (imagePaths.present) {
      map['image_paths'] = Variable<String>(imagePaths.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (damageTypeId.present) {
      map['damage_type_id'] = Variable<int>(damageTypeId.value);
    }
    if (severityId.present) {
      map['severity_id'] = Variable<int>(severityId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (isSyncing.present) {
      map['is_syncing'] = Variable<bool>(isSyncing.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendingReportsCompanion(')
          ..write('id: $id, ')
          ..write('uuid: $uuid, ')
          ..write('imagePaths: $imagePaths, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('damageTypeId: $damageTypeId, ')
          ..write('severityId: $severityId, ')
          ..write('description: $description, ')
          ..write('city: $city, ')
          ..write('address: $address, ')
          ..write('isSyncing: $isSyncing')
          ..write(')'))
        .toString();
  }
}

class $NotificationsTable extends Notifications
    with TableInfo<$NotificationsTable, Notification> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reportIdMeta = const VerificationMeta(
    'reportId',
  );
  @override
  late final GeneratedColumn<String> reportId = GeneratedColumn<String>(
    'report_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
    requiredDuringInsert: true,
  );
  static const VerificationMeta _readAtMeta = const VerificationMeta('readAt');
  @override
  late final GeneratedColumn<DateTime> readAt = GeneratedColumn<DateTime>(
    'read_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    body,
    type,
    reportId,
    createdAt,
    readAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notifications';
  @override
  VerificationContext validateIntegrity(
    Insertable<Notification> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('report_id')) {
      context.handle(
        _reportIdMeta,
        reportId.isAcceptableOrUnknown(data['report_id']!, _reportIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('read_at')) {
      context.handle(
        _readAtMeta,
        readAt.isAcceptableOrUnknown(data['read_at']!, _readAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Notification map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Notification(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      reportId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}report_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      readAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}read_at'],
      ),
    );
  }

  @override
  $NotificationsTable createAlias(String alias) {
    return $NotificationsTable(attachedDatabase, alias);
  }
}

class Notification extends DataClass implements Insertable<Notification> {
  final String id;
  final String title;
  final String body;
  final String type;
  final String? reportId;
  final DateTime createdAt;
  final DateTime? readAt;
  const Notification({
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    this.reportId,
    required this.createdAt,
    this.readAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || reportId != null) {
      map['report_id'] = Variable<String>(reportId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || readAt != null) {
      map['read_at'] = Variable<DateTime>(readAt);
    }
    return map;
  }

  NotificationsCompanion toCompanion(bool nullToAbsent) {
    return NotificationsCompanion(
      id: Value(id),
      title: Value(title),
      body: Value(body),
      type: Value(type),
      reportId: reportId == null && nullToAbsent
          ? const Value.absent()
          : Value(reportId),
      createdAt: Value(createdAt),
      readAt: readAt == null && nullToAbsent
          ? const Value.absent()
          : Value(readAt),
    );
  }

  factory Notification.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Notification(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      type: serializer.fromJson<String>(json['type']),
      reportId: serializer.fromJson<String?>(json['reportId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      readAt: serializer.fromJson<DateTime?>(json['readAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
      'type': serializer.toJson<String>(type),
      'reportId': serializer.toJson<String?>(reportId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'readAt': serializer.toJson<DateTime?>(readAt),
    };
  }

  Notification copyWith({
    String? id,
    String? title,
    String? body,
    String? type,
    Value<String?> reportId = const Value.absent(),
    DateTime? createdAt,
    Value<DateTime?> readAt = const Value.absent(),
  }) => Notification(
    id: id ?? this.id,
    title: title ?? this.title,
    body: body ?? this.body,
    type: type ?? this.type,
    reportId: reportId.present ? reportId.value : this.reportId,
    createdAt: createdAt ?? this.createdAt,
    readAt: readAt.present ? readAt.value : this.readAt,
  );
  Notification copyWithCompanion(NotificationsCompanion data) {
    return Notification(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      type: data.type.present ? data.type.value : this.type,
      reportId: data.reportId.present ? data.reportId.value : this.reportId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      readAt: data.readAt.present ? data.readAt.value : this.readAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Notification(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('type: $type, ')
          ..write('reportId: $reportId, ')
          ..write('createdAt: $createdAt, ')
          ..write('readAt: $readAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, body, type, reportId, createdAt, readAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Notification &&
          other.id == this.id &&
          other.title == this.title &&
          other.body == this.body &&
          other.type == this.type &&
          other.reportId == this.reportId &&
          other.createdAt == this.createdAt &&
          other.readAt == this.readAt);
}

class NotificationsCompanion extends UpdateCompanion<Notification> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> body;
  final Value<String> type;
  final Value<String?> reportId;
  final Value<DateTime> createdAt;
  final Value<DateTime?> readAt;
  final Value<int> rowid;
  const NotificationsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.type = const Value.absent(),
    this.reportId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.readAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NotificationsCompanion.insert({
    required String id,
    required String title,
    required String body,
    required String type,
    this.reportId = const Value.absent(),
    required DateTime createdAt,
    this.readAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       body = Value(body),
       type = Value(type),
       createdAt = Value(createdAt);
  static Insertable<Notification> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? body,
    Expression<String>? type,
    Expression<String>? reportId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? readAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (type != null) 'type': type,
      if (reportId != null) 'report_id': reportId,
      if (createdAt != null) 'created_at': createdAt,
      if (readAt != null) 'read_at': readAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NotificationsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? body,
    Value<String>? type,
    Value<String?>? reportId,
    Value<DateTime>? createdAt,
    Value<DateTime?>? readAt,
    Value<int>? rowid,
  }) {
    return NotificationsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      type: type ?? this.type,
      reportId: reportId ?? this.reportId,
      createdAt: createdAt ?? this.createdAt,
      readAt: readAt ?? this.readAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (reportId.present) {
      map['report_id'] = Variable<String>(reportId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (readAt.present) {
      map['read_at'] = Variable<DateTime>(readAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('type: $type, ')
          ..write('reportId: $reportId, ')
          ..write('createdAt: $createdAt, ')
          ..write('readAt: $readAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LocalReportsTable localReports = $LocalReportsTable(this);
  late final $LocalReportImagesTable localReportImages =
      $LocalReportImagesTable(this);
  late final $LocalDamageTypesTable localDamageTypes = $LocalDamageTypesTable(
    this,
  );
  late final $LocalSeveritiesTable localSeverities = $LocalSeveritiesTable(
    this,
  );
  late final $MyLocalReportsTable myLocalReports = $MyLocalReportsTable(this);
  late final $PendingReportsTable pendingReports = $PendingReportsTable(this);
  late final $NotificationsTable notifications = $NotificationsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    localReports,
    localReportImages,
    localDamageTypes,
    localSeverities,
    myLocalReports,
    pendingReports,
    notifications,
  ];
}

typedef $$LocalReportsTableCreateCompanionBuilder =
    LocalReportsCompanion Function({
      required String id,
      required int userId,
      required int severityId,
      required int statusId,
      required int damageTypeId,
      required double latitude,
      required double longitude,
      Value<String?> description,
      required String address,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<String?> city,
      Value<String> updates,
      Value<String> flags,
      required String damageTypeName,
      required String severityName,
      required String statusName,
      Value<int> rowid,
    });
typedef $$LocalReportsTableUpdateCompanionBuilder =
    LocalReportsCompanion Function({
      Value<String> id,
      Value<int> userId,
      Value<int> severityId,
      Value<int> statusId,
      Value<int> damageTypeId,
      Value<double> latitude,
      Value<double> longitude,
      Value<String?> description,
      Value<String> address,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String?> city,
      Value<String> updates,
      Value<String> flags,
      Value<String> damageTypeName,
      Value<String> severityName,
      Value<String> statusName,
      Value<int> rowid,
    });

final class $$LocalReportsTableReferences
    extends BaseReferences<_$AppDatabase, $LocalReportsTable, LocalReport> {
  $$LocalReportsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$LocalReportImagesTable, List<LocalReportImage>>
  _localReportImagesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.localReportImages,
        aliasName: $_aliasNameGenerator(
          db.localReports.id,
          db.localReportImages.reportId,
        ),
      );

  $$LocalReportImagesTableProcessedTableManager get localReportImagesRefs {
    final manager = $$LocalReportImagesTableTableManager(
      $_db,
      $_db.localReportImages,
    ).filter((f) => f.reportId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _localReportImagesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LocalReportsTableFilterComposer
    extends Composer<_$AppDatabase, $LocalReportsTable> {
  $$LocalReportsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get severityId => $composableBuilder(
    column: $table.severityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get statusId => $composableBuilder(
    column: $table.statusId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get damageTypeId => $composableBuilder(
    column: $table.damageTypeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updates => $composableBuilder(
    column: $table.updates,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get flags => $composableBuilder(
    column: $table.flags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get damageTypeName => $composableBuilder(
    column: $table.damageTypeName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get severityName => $composableBuilder(
    column: $table.severityName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statusName => $composableBuilder(
    column: $table.statusName,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> localReportImagesRefs(
    Expression<bool> Function($$LocalReportImagesTableFilterComposer f) f,
  ) {
    final $$LocalReportImagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.localReportImages,
      getReferencedColumn: (t) => t.reportId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocalReportImagesTableFilterComposer(
            $db: $db,
            $table: $db.localReportImages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LocalReportsTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalReportsTable> {
  $$LocalReportsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get severityId => $composableBuilder(
    column: $table.severityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get statusId => $composableBuilder(
    column: $table.statusId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get damageTypeId => $composableBuilder(
    column: $table.damageTypeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updates => $composableBuilder(
    column: $table.updates,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get flags => $composableBuilder(
    column: $table.flags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get damageTypeName => $composableBuilder(
    column: $table.damageTypeName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get severityName => $composableBuilder(
    column: $table.severityName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statusName => $composableBuilder(
    column: $table.statusName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalReportsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalReportsTable> {
  $$LocalReportsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get severityId => $composableBuilder(
    column: $table.severityId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get statusId =>
      $composableBuilder(column: $table.statusId, builder: (column) => column);

  GeneratedColumn<int> get damageTypeId => $composableBuilder(
    column: $table.damageTypeId,
    builder: (column) => column,
  );

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get updates =>
      $composableBuilder(column: $table.updates, builder: (column) => column);

  GeneratedColumn<String> get flags =>
      $composableBuilder(column: $table.flags, builder: (column) => column);

  GeneratedColumn<String> get damageTypeName => $composableBuilder(
    column: $table.damageTypeName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get severityName => $composableBuilder(
    column: $table.severityName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get statusName => $composableBuilder(
    column: $table.statusName,
    builder: (column) => column,
  );

  Expression<T> localReportImagesRefs<T extends Object>(
    Expression<T> Function($$LocalReportImagesTableAnnotationComposer a) f,
  ) {
    final $$LocalReportImagesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.localReportImages,
          getReferencedColumn: (t) => t.reportId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$LocalReportImagesTableAnnotationComposer(
                $db: $db,
                $table: $db.localReportImages,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$LocalReportsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalReportsTable,
          LocalReport,
          $$LocalReportsTableFilterComposer,
          $$LocalReportsTableOrderingComposer,
          $$LocalReportsTableAnnotationComposer,
          $$LocalReportsTableCreateCompanionBuilder,
          $$LocalReportsTableUpdateCompanionBuilder,
          (LocalReport, $$LocalReportsTableReferences),
          LocalReport,
          PrefetchHooks Function({bool localReportImagesRefs})
        > {
  $$LocalReportsTableTableManager(_$AppDatabase db, $LocalReportsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalReportsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalReportsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalReportsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<int> severityId = const Value.absent(),
                Value<int> statusId = const Value.absent(),
                Value<int> damageTypeId = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String> updates = const Value.absent(),
                Value<String> flags = const Value.absent(),
                Value<String> damageTypeName = const Value.absent(),
                Value<String> severityName = const Value.absent(),
                Value<String> statusName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LocalReportsCompanion(
                id: id,
                userId: userId,
                severityId: severityId,
                statusId: statusId,
                damageTypeId: damageTypeId,
                latitude: latitude,
                longitude: longitude,
                description: description,
                address: address,
                createdAt: createdAt,
                updatedAt: updatedAt,
                city: city,
                updates: updates,
                flags: flags,
                damageTypeName: damageTypeName,
                severityName: severityName,
                statusName: statusName,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int userId,
                required int severityId,
                required int statusId,
                required int damageTypeId,
                required double latitude,
                required double longitude,
                Value<String?> description = const Value.absent(),
                required String address,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<String?> city = const Value.absent(),
                Value<String> updates = const Value.absent(),
                Value<String> flags = const Value.absent(),
                required String damageTypeName,
                required String severityName,
                required String statusName,
                Value<int> rowid = const Value.absent(),
              }) => LocalReportsCompanion.insert(
                id: id,
                userId: userId,
                severityId: severityId,
                statusId: statusId,
                damageTypeId: damageTypeId,
                latitude: latitude,
                longitude: longitude,
                description: description,
                address: address,
                createdAt: createdAt,
                updatedAt: updatedAt,
                city: city,
                updates: updates,
                flags: flags,
                damageTypeName: damageTypeName,
                severityName: severityName,
                statusName: statusName,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LocalReportsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({localReportImagesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (localReportImagesRefs) db.localReportImages,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (localReportImagesRefs)
                    await $_getPrefetchedData<
                      LocalReport,
                      $LocalReportsTable,
                      LocalReportImage
                    >(
                      currentTable: table,
                      referencedTable: $$LocalReportsTableReferences
                          ._localReportImagesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$LocalReportsTableReferences(
                            db,
                            table,
                            p0,
                          ).localReportImagesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.reportId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$LocalReportsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalReportsTable,
      LocalReport,
      $$LocalReportsTableFilterComposer,
      $$LocalReportsTableOrderingComposer,
      $$LocalReportsTableAnnotationComposer,
      $$LocalReportsTableCreateCompanionBuilder,
      $$LocalReportsTableUpdateCompanionBuilder,
      (LocalReport, $$LocalReportsTableReferences),
      LocalReport,
      PrefetchHooks Function({bool localReportImagesRefs})
    >;
typedef $$LocalReportImagesTableCreateCompanionBuilder =
    LocalReportImagesCompanion Function({
      Value<int> id,
      required String reportId,
      required String url,
    });
typedef $$LocalReportImagesTableUpdateCompanionBuilder =
    LocalReportImagesCompanion Function({
      Value<int> id,
      Value<String> reportId,
      Value<String> url,
    });

final class $$LocalReportImagesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $LocalReportImagesTable,
          LocalReportImage
        > {
  $$LocalReportImagesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $LocalReportsTable _reportIdTable(_$AppDatabase db) =>
      db.localReports.createAlias(
        $_aliasNameGenerator(db.localReportImages.reportId, db.localReports.id),
      );

  $$LocalReportsTableProcessedTableManager get reportId {
    final $_column = $_itemColumn<String>('report_id')!;

    final manager = $$LocalReportsTableTableManager(
      $_db,
      $_db.localReports,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_reportIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LocalReportImagesTableFilterComposer
    extends Composer<_$AppDatabase, $LocalReportImagesTable> {
  $$LocalReportImagesTableFilterComposer({
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

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  $$LocalReportsTableFilterComposer get reportId {
    final $$LocalReportsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reportId,
      referencedTable: $db.localReports,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocalReportsTableFilterComposer(
            $db: $db,
            $table: $db.localReports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LocalReportImagesTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalReportImagesTable> {
  $$LocalReportImagesTableOrderingComposer({
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

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  $$LocalReportsTableOrderingComposer get reportId {
    final $$LocalReportsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reportId,
      referencedTable: $db.localReports,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocalReportsTableOrderingComposer(
            $db: $db,
            $table: $db.localReports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LocalReportImagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalReportImagesTable> {
  $$LocalReportImagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  $$LocalReportsTableAnnotationComposer get reportId {
    final $$LocalReportsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.reportId,
      referencedTable: $db.localReports,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LocalReportsTableAnnotationComposer(
            $db: $db,
            $table: $db.localReports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LocalReportImagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalReportImagesTable,
          LocalReportImage,
          $$LocalReportImagesTableFilterComposer,
          $$LocalReportImagesTableOrderingComposer,
          $$LocalReportImagesTableAnnotationComposer,
          $$LocalReportImagesTableCreateCompanionBuilder,
          $$LocalReportImagesTableUpdateCompanionBuilder,
          (LocalReportImage, $$LocalReportImagesTableReferences),
          LocalReportImage,
          PrefetchHooks Function({bool reportId})
        > {
  $$LocalReportImagesTableTableManager(
    _$AppDatabase db,
    $LocalReportImagesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalReportImagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalReportImagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalReportImagesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> reportId = const Value.absent(),
                Value<String> url = const Value.absent(),
              }) => LocalReportImagesCompanion(
                id: id,
                reportId: reportId,
                url: url,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String reportId,
                required String url,
              }) => LocalReportImagesCompanion.insert(
                id: id,
                reportId: reportId,
                url: url,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LocalReportImagesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({reportId = false}) {
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
                    if (reportId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.reportId,
                                referencedTable:
                                    $$LocalReportImagesTableReferences
                                        ._reportIdTable(db),
                                referencedColumn:
                                    $$LocalReportImagesTableReferences
                                        ._reportIdTable(db)
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

typedef $$LocalReportImagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalReportImagesTable,
      LocalReportImage,
      $$LocalReportImagesTableFilterComposer,
      $$LocalReportImagesTableOrderingComposer,
      $$LocalReportImagesTableAnnotationComposer,
      $$LocalReportImagesTableCreateCompanionBuilder,
      $$LocalReportImagesTableUpdateCompanionBuilder,
      (LocalReportImage, $$LocalReportImagesTableReferences),
      LocalReportImage,
      PrefetchHooks Function({bool reportId})
    >;
typedef $$LocalDamageTypesTableCreateCompanionBuilder =
    LocalDamageTypesCompanion Function({Value<int> id, required String name});
typedef $$LocalDamageTypesTableUpdateCompanionBuilder =
    LocalDamageTypesCompanion Function({Value<int> id, Value<String> name});

class $$LocalDamageTypesTableFilterComposer
    extends Composer<_$AppDatabase, $LocalDamageTypesTable> {
  $$LocalDamageTypesTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalDamageTypesTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalDamageTypesTable> {
  $$LocalDamageTypesTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalDamageTypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalDamageTypesTable> {
  $$LocalDamageTypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$LocalDamageTypesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalDamageTypesTable,
          LocalDamageType,
          $$LocalDamageTypesTableFilterComposer,
          $$LocalDamageTypesTableOrderingComposer,
          $$LocalDamageTypesTableAnnotationComposer,
          $$LocalDamageTypesTableCreateCompanionBuilder,
          $$LocalDamageTypesTableUpdateCompanionBuilder,
          (
            LocalDamageType,
            BaseReferences<
              _$AppDatabase,
              $LocalDamageTypesTable,
              LocalDamageType
            >,
          ),
          LocalDamageType,
          PrefetchHooks Function()
        > {
  $$LocalDamageTypesTableTableManager(
    _$AppDatabase db,
    $LocalDamageTypesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalDamageTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalDamageTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalDamageTypesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => LocalDamageTypesCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  LocalDamageTypesCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalDamageTypesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalDamageTypesTable,
      LocalDamageType,
      $$LocalDamageTypesTableFilterComposer,
      $$LocalDamageTypesTableOrderingComposer,
      $$LocalDamageTypesTableAnnotationComposer,
      $$LocalDamageTypesTableCreateCompanionBuilder,
      $$LocalDamageTypesTableUpdateCompanionBuilder,
      (
        LocalDamageType,
        BaseReferences<_$AppDatabase, $LocalDamageTypesTable, LocalDamageType>,
      ),
      LocalDamageType,
      PrefetchHooks Function()
    >;
typedef $$LocalSeveritiesTableCreateCompanionBuilder =
    LocalSeveritiesCompanion Function({Value<int> id, required String name});
typedef $$LocalSeveritiesTableUpdateCompanionBuilder =
    LocalSeveritiesCompanion Function({Value<int> id, Value<String> name});

class $$LocalSeveritiesTableFilterComposer
    extends Composer<_$AppDatabase, $LocalSeveritiesTable> {
  $$LocalSeveritiesTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocalSeveritiesTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalSeveritiesTable> {
  $$LocalSeveritiesTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocalSeveritiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalSeveritiesTable> {
  $$LocalSeveritiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$LocalSeveritiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LocalSeveritiesTable,
          LocalSeverity,
          $$LocalSeveritiesTableFilterComposer,
          $$LocalSeveritiesTableOrderingComposer,
          $$LocalSeveritiesTableAnnotationComposer,
          $$LocalSeveritiesTableCreateCompanionBuilder,
          $$LocalSeveritiesTableUpdateCompanionBuilder,
          (
            LocalSeverity,
            BaseReferences<_$AppDatabase, $LocalSeveritiesTable, LocalSeverity>,
          ),
          LocalSeverity,
          PrefetchHooks Function()
        > {
  $$LocalSeveritiesTableTableManager(
    _$AppDatabase db,
    $LocalSeveritiesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalSeveritiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalSeveritiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalSeveritiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => LocalSeveritiesCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  LocalSeveritiesCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocalSeveritiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LocalSeveritiesTable,
      LocalSeverity,
      $$LocalSeveritiesTableFilterComposer,
      $$LocalSeveritiesTableOrderingComposer,
      $$LocalSeveritiesTableAnnotationComposer,
      $$LocalSeveritiesTableCreateCompanionBuilder,
      $$LocalSeveritiesTableUpdateCompanionBuilder,
      (
        LocalSeverity,
        BaseReferences<_$AppDatabase, $LocalSeveritiesTable, LocalSeverity>,
      ),
      LocalSeverity,
      PrefetchHooks Function()
    >;
typedef $$MyLocalReportsTableCreateCompanionBuilder =
    MyLocalReportsCompanion Function({
      required String id,
      required int userId,
      required int severityId,
      required int statusId,
      required int damageTypeId,
      required double latitude,
      required double longitude,
      Value<String?> description,
      required String address,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<String?> city,
      required String damageTypeName,
      required String severityName,
      required String statusName,
      Value<int> rowid,
    });
typedef $$MyLocalReportsTableUpdateCompanionBuilder =
    MyLocalReportsCompanion Function({
      Value<String> id,
      Value<int> userId,
      Value<int> severityId,
      Value<int> statusId,
      Value<int> damageTypeId,
      Value<double> latitude,
      Value<double> longitude,
      Value<String?> description,
      Value<String> address,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<String?> city,
      Value<String> damageTypeName,
      Value<String> severityName,
      Value<String> statusName,
      Value<int> rowid,
    });

class $$MyLocalReportsTableFilterComposer
    extends Composer<_$AppDatabase, $MyLocalReportsTable> {
  $$MyLocalReportsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get severityId => $composableBuilder(
    column: $table.severityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get statusId => $composableBuilder(
    column: $table.statusId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get damageTypeId => $composableBuilder(
    column: $table.damageTypeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get damageTypeName => $composableBuilder(
    column: $table.damageTypeName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get severityName => $composableBuilder(
    column: $table.severityName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statusName => $composableBuilder(
    column: $table.statusName,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MyLocalReportsTableOrderingComposer
    extends Composer<_$AppDatabase, $MyLocalReportsTable> {
  $$MyLocalReportsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get severityId => $composableBuilder(
    column: $table.severityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get statusId => $composableBuilder(
    column: $table.statusId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get damageTypeId => $composableBuilder(
    column: $table.damageTypeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get damageTypeName => $composableBuilder(
    column: $table.damageTypeName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get severityName => $composableBuilder(
    column: $table.severityName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statusName => $composableBuilder(
    column: $table.statusName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MyLocalReportsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MyLocalReportsTable> {
  $$MyLocalReportsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get severityId => $composableBuilder(
    column: $table.severityId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get statusId =>
      $composableBuilder(column: $table.statusId, builder: (column) => column);

  GeneratedColumn<int> get damageTypeId => $composableBuilder(
    column: $table.damageTypeId,
    builder: (column) => column,
  );

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get damageTypeName => $composableBuilder(
    column: $table.damageTypeName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get severityName => $composableBuilder(
    column: $table.severityName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get statusName => $composableBuilder(
    column: $table.statusName,
    builder: (column) => column,
  );
}

class $$MyLocalReportsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MyLocalReportsTable,
          MyLocalReport,
          $$MyLocalReportsTableFilterComposer,
          $$MyLocalReportsTableOrderingComposer,
          $$MyLocalReportsTableAnnotationComposer,
          $$MyLocalReportsTableCreateCompanionBuilder,
          $$MyLocalReportsTableUpdateCompanionBuilder,
          (
            MyLocalReport,
            BaseReferences<_$AppDatabase, $MyLocalReportsTable, MyLocalReport>,
          ),
          MyLocalReport,
          PrefetchHooks Function()
        > {
  $$MyLocalReportsTableTableManager(
    _$AppDatabase db,
    $MyLocalReportsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MyLocalReportsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MyLocalReportsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MyLocalReportsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<int> severityId = const Value.absent(),
                Value<int> statusId = const Value.absent(),
                Value<int> damageTypeId = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String> damageTypeName = const Value.absent(),
                Value<String> severityName = const Value.absent(),
                Value<String> statusName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MyLocalReportsCompanion(
                id: id,
                userId: userId,
                severityId: severityId,
                statusId: statusId,
                damageTypeId: damageTypeId,
                latitude: latitude,
                longitude: longitude,
                description: description,
                address: address,
                createdAt: createdAt,
                updatedAt: updatedAt,
                city: city,
                damageTypeName: damageTypeName,
                severityName: severityName,
                statusName: statusName,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int userId,
                required int severityId,
                required int statusId,
                required int damageTypeId,
                required double latitude,
                required double longitude,
                Value<String?> description = const Value.absent(),
                required String address,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<String?> city = const Value.absent(),
                required String damageTypeName,
                required String severityName,
                required String statusName,
                Value<int> rowid = const Value.absent(),
              }) => MyLocalReportsCompanion.insert(
                id: id,
                userId: userId,
                severityId: severityId,
                statusId: statusId,
                damageTypeId: damageTypeId,
                latitude: latitude,
                longitude: longitude,
                description: description,
                address: address,
                createdAt: createdAt,
                updatedAt: updatedAt,
                city: city,
                damageTypeName: damageTypeName,
                severityName: severityName,
                statusName: statusName,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MyLocalReportsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MyLocalReportsTable,
      MyLocalReport,
      $$MyLocalReportsTableFilterComposer,
      $$MyLocalReportsTableOrderingComposer,
      $$MyLocalReportsTableAnnotationComposer,
      $$MyLocalReportsTableCreateCompanionBuilder,
      $$MyLocalReportsTableUpdateCompanionBuilder,
      (
        MyLocalReport,
        BaseReferences<_$AppDatabase, $MyLocalReportsTable, MyLocalReport>,
      ),
      MyLocalReport,
      PrefetchHooks Function()
    >;
typedef $$PendingReportsTableCreateCompanionBuilder =
    PendingReportsCompanion Function({
      Value<int> id,
      required String uuid,
      required String imagePaths,
      required double latitude,
      required double longitude,
      required int damageTypeId,
      required int severityId,
      Value<String?> description,
      Value<String?> city,
      required String address,
      Value<bool> isSyncing,
    });
typedef $$PendingReportsTableUpdateCompanionBuilder =
    PendingReportsCompanion Function({
      Value<int> id,
      Value<String> uuid,
      Value<String> imagePaths,
      Value<double> latitude,
      Value<double> longitude,
      Value<int> damageTypeId,
      Value<int> severityId,
      Value<String?> description,
      Value<String?> city,
      Value<String> address,
      Value<bool> isSyncing,
    });

class $$PendingReportsTableFilterComposer
    extends Composer<_$AppDatabase, $PendingReportsTable> {
  $$PendingReportsTableFilterComposer({
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

  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePaths => $composableBuilder(
    column: $table.imagePaths,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get damageTypeId => $composableBuilder(
    column: $table.damageTypeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get severityId => $composableBuilder(
    column: $table.severityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSyncing => $composableBuilder(
    column: $table.isSyncing,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PendingReportsTableOrderingComposer
    extends Composer<_$AppDatabase, $PendingReportsTable> {
  $$PendingReportsTableOrderingComposer({
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

  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePaths => $composableBuilder(
    column: $table.imagePaths,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get damageTypeId => $composableBuilder(
    column: $table.damageTypeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get severityId => $composableBuilder(
    column: $table.severityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSyncing => $composableBuilder(
    column: $table.isSyncing,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PendingReportsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PendingReportsTable> {
  $$PendingReportsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get imagePaths => $composableBuilder(
    column: $table.imagePaths,
    builder: (column) => column,
  );

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<int> get damageTypeId => $composableBuilder(
    column: $table.damageTypeId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get severityId => $composableBuilder(
    column: $table.severityId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<bool> get isSyncing =>
      $composableBuilder(column: $table.isSyncing, builder: (column) => column);
}

class $$PendingReportsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PendingReportsTable,
          PendingReport,
          $$PendingReportsTableFilterComposer,
          $$PendingReportsTableOrderingComposer,
          $$PendingReportsTableAnnotationComposer,
          $$PendingReportsTableCreateCompanionBuilder,
          $$PendingReportsTableUpdateCompanionBuilder,
          (
            PendingReport,
            BaseReferences<_$AppDatabase, $PendingReportsTable, PendingReport>,
          ),
          PendingReport,
          PrefetchHooks Function()
        > {
  $$PendingReportsTableTableManager(
    _$AppDatabase db,
    $PendingReportsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PendingReportsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PendingReportsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PendingReportsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> uuid = const Value.absent(),
                Value<String> imagePaths = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<int> damageTypeId = const Value.absent(),
                Value<int> severityId = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<bool> isSyncing = const Value.absent(),
              }) => PendingReportsCompanion(
                id: id,
                uuid: uuid,
                imagePaths: imagePaths,
                latitude: latitude,
                longitude: longitude,
                damageTypeId: damageTypeId,
                severityId: severityId,
                description: description,
                city: city,
                address: address,
                isSyncing: isSyncing,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String uuid,
                required String imagePaths,
                required double latitude,
                required double longitude,
                required int damageTypeId,
                required int severityId,
                Value<String?> description = const Value.absent(),
                Value<String?> city = const Value.absent(),
                required String address,
                Value<bool> isSyncing = const Value.absent(),
              }) => PendingReportsCompanion.insert(
                id: id,
                uuid: uuid,
                imagePaths: imagePaths,
                latitude: latitude,
                longitude: longitude,
                damageTypeId: damageTypeId,
                severityId: severityId,
                description: description,
                city: city,
                address: address,
                isSyncing: isSyncing,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PendingReportsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PendingReportsTable,
      PendingReport,
      $$PendingReportsTableFilterComposer,
      $$PendingReportsTableOrderingComposer,
      $$PendingReportsTableAnnotationComposer,
      $$PendingReportsTableCreateCompanionBuilder,
      $$PendingReportsTableUpdateCompanionBuilder,
      (
        PendingReport,
        BaseReferences<_$AppDatabase, $PendingReportsTable, PendingReport>,
      ),
      PendingReport,
      PrefetchHooks Function()
    >;
typedef $$NotificationsTableCreateCompanionBuilder =
    NotificationsCompanion Function({
      required String id,
      required String title,
      required String body,
      required String type,
      Value<String?> reportId,
      required DateTime createdAt,
      Value<DateTime?> readAt,
      Value<int> rowid,
    });
typedef $$NotificationsTableUpdateCompanionBuilder =
    NotificationsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> body,
      Value<String> type,
      Value<String?> reportId,
      Value<DateTime> createdAt,
      Value<DateTime?> readAt,
      Value<int> rowid,
    });

class $$NotificationsTableFilterComposer
    extends Composer<_$AppDatabase, $NotificationsTable> {
  $$NotificationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reportId => $composableBuilder(
    column: $table.reportId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get readAt => $composableBuilder(
    column: $table.readAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NotificationsTableOrderingComposer
    extends Composer<_$AppDatabase, $NotificationsTable> {
  $$NotificationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reportId => $composableBuilder(
    column: $table.reportId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get readAt => $composableBuilder(
    column: $table.readAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NotificationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotificationsTable> {
  $$NotificationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get reportId =>
      $composableBuilder(column: $table.reportId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get readAt =>
      $composableBuilder(column: $table.readAt, builder: (column) => column);
}

class $$NotificationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotificationsTable,
          Notification,
          $$NotificationsTableFilterComposer,
          $$NotificationsTableOrderingComposer,
          $$NotificationsTableAnnotationComposer,
          $$NotificationsTableCreateCompanionBuilder,
          $$NotificationsTableUpdateCompanionBuilder,
          (
            Notification,
            BaseReferences<_$AppDatabase, $NotificationsTable, Notification>,
          ),
          Notification,
          PrefetchHooks Function()
        > {
  $$NotificationsTableTableManager(_$AppDatabase db, $NotificationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotificationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotificationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotificationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String?> reportId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> readAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NotificationsCompanion(
                id: id,
                title: title,
                body: body,
                type: type,
                reportId: reportId,
                createdAt: createdAt,
                readAt: readAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required String body,
                required String type,
                Value<String?> reportId = const Value.absent(),
                required DateTime createdAt,
                Value<DateTime?> readAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NotificationsCompanion.insert(
                id: id,
                title: title,
                body: body,
                type: type,
                reportId: reportId,
                createdAt: createdAt,
                readAt: readAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NotificationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotificationsTable,
      Notification,
      $$NotificationsTableFilterComposer,
      $$NotificationsTableOrderingComposer,
      $$NotificationsTableAnnotationComposer,
      $$NotificationsTableCreateCompanionBuilder,
      $$NotificationsTableUpdateCompanionBuilder,
      (
        Notification,
        BaseReferences<_$AppDatabase, $NotificationsTable, Notification>,
      ),
      Notification,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LocalReportsTableTableManager get localReports =>
      $$LocalReportsTableTableManager(_db, _db.localReports);
  $$LocalReportImagesTableTableManager get localReportImages =>
      $$LocalReportImagesTableTableManager(_db, _db.localReportImages);
  $$LocalDamageTypesTableTableManager get localDamageTypes =>
      $$LocalDamageTypesTableTableManager(_db, _db.localDamageTypes);
  $$LocalSeveritiesTableTableManager get localSeverities =>
      $$LocalSeveritiesTableTableManager(_db, _db.localSeverities);
  $$MyLocalReportsTableTableManager get myLocalReports =>
      $$MyLocalReportsTableTableManager(_db, _db.myLocalReports);
  $$PendingReportsTableTableManager get pendingReports =>
      $$PendingReportsTableTableManager(_db, _db.pendingReports);
  $$NotificationsTableTableManager get notifications =>
      $$NotificationsTableTableManager(_db, _db.notifications);
}
