// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProductsTable extends Products
    with TableInfo<$ProductsTable, ProductData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _mainBarcodeMeta =
      const VerificationMeta('mainBarcode');
  @override
  late final GeneratedColumn<String> mainBarcode = GeneratedColumn<String>(
      'main_barcode', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _scientificMeta =
      const VerificationMeta('scientific');
  @override
  late final GeneratedColumn<String> scientific = GeneratedColumn<String>(
      'scientific', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _companyMeta =
      const VerificationMeta('company');
  @override
  late final GeneratedColumn<String> company = GeneratedColumn<String>(
      'company', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _groupMeta = const VerificationMeta('group');
  @override
  late final GeneratedColumn<String> group = GeneratedColumn<String>(
      'group', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _primaryUnitMeta =
      const VerificationMeta('primaryUnit');
  @override
  late final GeneratedColumn<String> primaryUnit = GeneratedColumn<String>(
      'primary_unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _primaryCostMeta =
      const VerificationMeta('primaryCost');
  @override
  late final GeneratedColumn<double> primaryCost = GeneratedColumn<double>(
      'primary_cost', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _primaryPriceMeta =
      const VerificationMeta('primaryPrice');
  @override
  late final GeneratedColumn<double> primaryPrice = GeneratedColumn<double>(
      'primary_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _secondaryUnitMeta =
      const VerificationMeta('secondaryUnit');
  @override
  late final GeneratedColumn<String> secondaryUnit = GeneratedColumn<String>(
      'secondary_unit', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _packingMeta =
      const VerificationMeta('packing');
  @override
  late final GeneratedColumn<int> packing = GeneratedColumn<int>(
      'packing', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _secondaryCostMeta =
      const VerificationMeta('secondaryCost');
  @override
  late final GeneratedColumn<double> secondaryCost = GeneratedColumn<double>(
      'secondary_cost', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _secondaryPriceMeta =
      const VerificationMeta('secondaryPrice');
  @override
  late final GeneratedColumn<double> secondaryPrice = GeneratedColumn<double>(
      'secondary_price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _minStockAlertMeta =
      const VerificationMeta('minStockAlert');
  @override
  late final GeneratedColumn<int> minStockAlert = GeneratedColumn<int>(
      'min_stock_alert', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        mainBarcode,
        name,
        scientific,
        company,
        group,
        primaryUnit,
        primaryCost,
        primaryPrice,
        secondaryUnit,
        packing,
        secondaryCost,
        secondaryPrice,
        minStockAlert
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(Insertable<ProductData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('main_barcode')) {
      context.handle(
          _mainBarcodeMeta,
          mainBarcode.isAcceptableOrUnknown(
              data['main_barcode']!, _mainBarcodeMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('scientific')) {
      context.handle(
          _scientificMeta,
          scientific.isAcceptableOrUnknown(
              data['scientific']!, _scientificMeta));
    }
    if (data.containsKey('company')) {
      context.handle(_companyMeta,
          company.isAcceptableOrUnknown(data['company']!, _companyMeta));
    }
    if (data.containsKey('group')) {
      context.handle(
          _groupMeta, group.isAcceptableOrUnknown(data['group']!, _groupMeta));
    }
    if (data.containsKey('primary_unit')) {
      context.handle(
          _primaryUnitMeta,
          primaryUnit.isAcceptableOrUnknown(
              data['primary_unit']!, _primaryUnitMeta));
    } else if (isInserting) {
      context.missing(_primaryUnitMeta);
    }
    if (data.containsKey('primary_cost')) {
      context.handle(
          _primaryCostMeta,
          primaryCost.isAcceptableOrUnknown(
              data['primary_cost']!, _primaryCostMeta));
    } else if (isInserting) {
      context.missing(_primaryCostMeta);
    }
    if (data.containsKey('primary_price')) {
      context.handle(
          _primaryPriceMeta,
          primaryPrice.isAcceptableOrUnknown(
              data['primary_price']!, _primaryPriceMeta));
    } else if (isInserting) {
      context.missing(_primaryPriceMeta);
    }
    if (data.containsKey('secondary_unit')) {
      context.handle(
          _secondaryUnitMeta,
          secondaryUnit.isAcceptableOrUnknown(
              data['secondary_unit']!, _secondaryUnitMeta));
    }
    if (data.containsKey('packing')) {
      context.handle(_packingMeta,
          packing.isAcceptableOrUnknown(data['packing']!, _packingMeta));
    }
    if (data.containsKey('secondary_cost')) {
      context.handle(
          _secondaryCostMeta,
          secondaryCost.isAcceptableOrUnknown(
              data['secondary_cost']!, _secondaryCostMeta));
    }
    if (data.containsKey('secondary_price')) {
      context.handle(
          _secondaryPriceMeta,
          secondaryPrice.isAcceptableOrUnknown(
              data['secondary_price']!, _secondaryPriceMeta));
    }
    if (data.containsKey('min_stock_alert')) {
      context.handle(
          _minStockAlertMeta,
          minStockAlert.isAcceptableOrUnknown(
              data['min_stock_alert']!, _minStockAlertMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      mainBarcode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}main_barcode']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      scientific: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}scientific']),
      company: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}company']),
      group: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group']),
      primaryUnit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}primary_unit'])!,
      primaryCost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}primary_cost'])!,
      primaryPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}primary_price'])!,
      secondaryUnit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}secondary_unit']),
      packing: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}packing'])!,
      secondaryCost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}secondary_cost']),
      secondaryPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}secondary_price']),
      minStockAlert: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}min_stock_alert']),
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class ProductData extends DataClass implements Insertable<ProductData> {
  final int id;
  final String? mainBarcode;
  final String name;
  final String? scientific;
  final String? company;
  final String? group;
  final String primaryUnit;
  final double primaryCost;
  final double primaryPrice;
  final String? secondaryUnit;
  final int packing;
  final double? secondaryCost;
  final double? secondaryPrice;
  final int? minStockAlert;
  const ProductData(
      {required this.id,
      this.mainBarcode,
      required this.name,
      this.scientific,
      this.company,
      this.group,
      required this.primaryUnit,
      required this.primaryCost,
      required this.primaryPrice,
      this.secondaryUnit,
      required this.packing,
      this.secondaryCost,
      this.secondaryPrice,
      this.minStockAlert});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || mainBarcode != null) {
      map['main_barcode'] = Variable<String>(mainBarcode);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || scientific != null) {
      map['scientific'] = Variable<String>(scientific);
    }
    if (!nullToAbsent || company != null) {
      map['company'] = Variable<String>(company);
    }
    if (!nullToAbsent || group != null) {
      map['group'] = Variable<String>(group);
    }
    map['primary_unit'] = Variable<String>(primaryUnit);
    map['primary_cost'] = Variable<double>(primaryCost);
    map['primary_price'] = Variable<double>(primaryPrice);
    if (!nullToAbsent || secondaryUnit != null) {
      map['secondary_unit'] = Variable<String>(secondaryUnit);
    }
    map['packing'] = Variable<int>(packing);
    if (!nullToAbsent || secondaryCost != null) {
      map['secondary_cost'] = Variable<double>(secondaryCost);
    }
    if (!nullToAbsent || secondaryPrice != null) {
      map['secondary_price'] = Variable<double>(secondaryPrice);
    }
    if (!nullToAbsent || minStockAlert != null) {
      map['min_stock_alert'] = Variable<int>(minStockAlert);
    }
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      mainBarcode: mainBarcode == null && nullToAbsent
          ? const Value.absent()
          : Value(mainBarcode),
      name: Value(name),
      scientific: scientific == null && nullToAbsent
          ? const Value.absent()
          : Value(scientific),
      company: company == null && nullToAbsent
          ? const Value.absent()
          : Value(company),
      group:
          group == null && nullToAbsent ? const Value.absent() : Value(group),
      primaryUnit: Value(primaryUnit),
      primaryCost: Value(primaryCost),
      primaryPrice: Value(primaryPrice),
      secondaryUnit: secondaryUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(secondaryUnit),
      packing: Value(packing),
      secondaryCost: secondaryCost == null && nullToAbsent
          ? const Value.absent()
          : Value(secondaryCost),
      secondaryPrice: secondaryPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(secondaryPrice),
      minStockAlert: minStockAlert == null && nullToAbsent
          ? const Value.absent()
          : Value(minStockAlert),
    );
  }

  factory ProductData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductData(
      id: serializer.fromJson<int>(json['id']),
      mainBarcode: serializer.fromJson<String?>(json['mainBarcode']),
      name: serializer.fromJson<String>(json['name']),
      scientific: serializer.fromJson<String?>(json['scientific']),
      company: serializer.fromJson<String?>(json['company']),
      group: serializer.fromJson<String?>(json['group']),
      primaryUnit: serializer.fromJson<String>(json['primaryUnit']),
      primaryCost: serializer.fromJson<double>(json['primaryCost']),
      primaryPrice: serializer.fromJson<double>(json['primaryPrice']),
      secondaryUnit: serializer.fromJson<String?>(json['secondaryUnit']),
      packing: serializer.fromJson<int>(json['packing']),
      secondaryCost: serializer.fromJson<double?>(json['secondaryCost']),
      secondaryPrice: serializer.fromJson<double?>(json['secondaryPrice']),
      minStockAlert: serializer.fromJson<int?>(json['minStockAlert']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'mainBarcode': serializer.toJson<String?>(mainBarcode),
      'name': serializer.toJson<String>(name),
      'scientific': serializer.toJson<String?>(scientific),
      'company': serializer.toJson<String?>(company),
      'group': serializer.toJson<String?>(group),
      'primaryUnit': serializer.toJson<String>(primaryUnit),
      'primaryCost': serializer.toJson<double>(primaryCost),
      'primaryPrice': serializer.toJson<double>(primaryPrice),
      'secondaryUnit': serializer.toJson<String?>(secondaryUnit),
      'packing': serializer.toJson<int>(packing),
      'secondaryCost': serializer.toJson<double?>(secondaryCost),
      'secondaryPrice': serializer.toJson<double?>(secondaryPrice),
      'minStockAlert': serializer.toJson<int?>(minStockAlert),
    };
  }

  ProductData copyWith(
          {int? id,
          Value<String?> mainBarcode = const Value.absent(),
          String? name,
          Value<String?> scientific = const Value.absent(),
          Value<String?> company = const Value.absent(),
          Value<String?> group = const Value.absent(),
          String? primaryUnit,
          double? primaryCost,
          double? primaryPrice,
          Value<String?> secondaryUnit = const Value.absent(),
          int? packing,
          Value<double?> secondaryCost = const Value.absent(),
          Value<double?> secondaryPrice = const Value.absent(),
          Value<int?> minStockAlert = const Value.absent()}) =>
      ProductData(
        id: id ?? this.id,
        mainBarcode: mainBarcode.present ? mainBarcode.value : this.mainBarcode,
        name: name ?? this.name,
        scientific: scientific.present ? scientific.value : this.scientific,
        company: company.present ? company.value : this.company,
        group: group.present ? group.value : this.group,
        primaryUnit: primaryUnit ?? this.primaryUnit,
        primaryCost: primaryCost ?? this.primaryCost,
        primaryPrice: primaryPrice ?? this.primaryPrice,
        secondaryUnit:
            secondaryUnit.present ? secondaryUnit.value : this.secondaryUnit,
        packing: packing ?? this.packing,
        secondaryCost:
            secondaryCost.present ? secondaryCost.value : this.secondaryCost,
        secondaryPrice:
            secondaryPrice.present ? secondaryPrice.value : this.secondaryPrice,
        minStockAlert:
            minStockAlert.present ? minStockAlert.value : this.minStockAlert,
      );
  ProductData copyWithCompanion(ProductsCompanion data) {
    return ProductData(
      id: data.id.present ? data.id.value : this.id,
      mainBarcode:
          data.mainBarcode.present ? data.mainBarcode.value : this.mainBarcode,
      name: data.name.present ? data.name.value : this.name,
      scientific:
          data.scientific.present ? data.scientific.value : this.scientific,
      company: data.company.present ? data.company.value : this.company,
      group: data.group.present ? data.group.value : this.group,
      primaryUnit:
          data.primaryUnit.present ? data.primaryUnit.value : this.primaryUnit,
      primaryCost:
          data.primaryCost.present ? data.primaryCost.value : this.primaryCost,
      primaryPrice: data.primaryPrice.present
          ? data.primaryPrice.value
          : this.primaryPrice,
      secondaryUnit: data.secondaryUnit.present
          ? data.secondaryUnit.value
          : this.secondaryUnit,
      packing: data.packing.present ? data.packing.value : this.packing,
      secondaryCost: data.secondaryCost.present
          ? data.secondaryCost.value
          : this.secondaryCost,
      secondaryPrice: data.secondaryPrice.present
          ? data.secondaryPrice.value
          : this.secondaryPrice,
      minStockAlert: data.minStockAlert.present
          ? data.minStockAlert.value
          : this.minStockAlert,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductData(')
          ..write('id: $id, ')
          ..write('mainBarcode: $mainBarcode, ')
          ..write('name: $name, ')
          ..write('scientific: $scientific, ')
          ..write('company: $company, ')
          ..write('group: $group, ')
          ..write('primaryUnit: $primaryUnit, ')
          ..write('primaryCost: $primaryCost, ')
          ..write('primaryPrice: $primaryPrice, ')
          ..write('secondaryUnit: $secondaryUnit, ')
          ..write('packing: $packing, ')
          ..write('secondaryCost: $secondaryCost, ')
          ..write('secondaryPrice: $secondaryPrice, ')
          ..write('minStockAlert: $minStockAlert')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      mainBarcode,
      name,
      scientific,
      company,
      group,
      primaryUnit,
      primaryCost,
      primaryPrice,
      secondaryUnit,
      packing,
      secondaryCost,
      secondaryPrice,
      minStockAlert);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductData &&
          other.id == this.id &&
          other.mainBarcode == this.mainBarcode &&
          other.name == this.name &&
          other.scientific == this.scientific &&
          other.company == this.company &&
          other.group == this.group &&
          other.primaryUnit == this.primaryUnit &&
          other.primaryCost == this.primaryCost &&
          other.primaryPrice == this.primaryPrice &&
          other.secondaryUnit == this.secondaryUnit &&
          other.packing == this.packing &&
          other.secondaryCost == this.secondaryCost &&
          other.secondaryPrice == this.secondaryPrice &&
          other.minStockAlert == this.minStockAlert);
}

class ProductsCompanion extends UpdateCompanion<ProductData> {
  final Value<int> id;
  final Value<String?> mainBarcode;
  final Value<String> name;
  final Value<String?> scientific;
  final Value<String?> company;
  final Value<String?> group;
  final Value<String> primaryUnit;
  final Value<double> primaryCost;
  final Value<double> primaryPrice;
  final Value<String?> secondaryUnit;
  final Value<int> packing;
  final Value<double?> secondaryCost;
  final Value<double?> secondaryPrice;
  final Value<int?> minStockAlert;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.mainBarcode = const Value.absent(),
    this.name = const Value.absent(),
    this.scientific = const Value.absent(),
    this.company = const Value.absent(),
    this.group = const Value.absent(),
    this.primaryUnit = const Value.absent(),
    this.primaryCost = const Value.absent(),
    this.primaryPrice = const Value.absent(),
    this.secondaryUnit = const Value.absent(),
    this.packing = const Value.absent(),
    this.secondaryCost = const Value.absent(),
    this.secondaryPrice = const Value.absent(),
    this.minStockAlert = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    this.mainBarcode = const Value.absent(),
    required String name,
    this.scientific = const Value.absent(),
    this.company = const Value.absent(),
    this.group = const Value.absent(),
    required String primaryUnit,
    required double primaryCost,
    required double primaryPrice,
    this.secondaryUnit = const Value.absent(),
    this.packing = const Value.absent(),
    this.secondaryCost = const Value.absent(),
    this.secondaryPrice = const Value.absent(),
    this.minStockAlert = const Value.absent(),
  })  : name = Value(name),
        primaryUnit = Value(primaryUnit),
        primaryCost = Value(primaryCost),
        primaryPrice = Value(primaryPrice);
  static Insertable<ProductData> custom({
    Expression<int>? id,
    Expression<String>? mainBarcode,
    Expression<String>? name,
    Expression<String>? scientific,
    Expression<String>? company,
    Expression<String>? group,
    Expression<String>? primaryUnit,
    Expression<double>? primaryCost,
    Expression<double>? primaryPrice,
    Expression<String>? secondaryUnit,
    Expression<int>? packing,
    Expression<double>? secondaryCost,
    Expression<double>? secondaryPrice,
    Expression<int>? minStockAlert,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mainBarcode != null) 'main_barcode': mainBarcode,
      if (name != null) 'name': name,
      if (scientific != null) 'scientific': scientific,
      if (company != null) 'company': company,
      if (group != null) 'group': group,
      if (primaryUnit != null) 'primary_unit': primaryUnit,
      if (primaryCost != null) 'primary_cost': primaryCost,
      if (primaryPrice != null) 'primary_price': primaryPrice,
      if (secondaryUnit != null) 'secondary_unit': secondaryUnit,
      if (packing != null) 'packing': packing,
      if (secondaryCost != null) 'secondary_cost': secondaryCost,
      if (secondaryPrice != null) 'secondary_price': secondaryPrice,
      if (minStockAlert != null) 'min_stock_alert': minStockAlert,
    });
  }

  ProductsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? mainBarcode,
      Value<String>? name,
      Value<String?>? scientific,
      Value<String?>? company,
      Value<String?>? group,
      Value<String>? primaryUnit,
      Value<double>? primaryCost,
      Value<double>? primaryPrice,
      Value<String?>? secondaryUnit,
      Value<int>? packing,
      Value<double?>? secondaryCost,
      Value<double?>? secondaryPrice,
      Value<int?>? minStockAlert}) {
    return ProductsCompanion(
      id: id ?? this.id,
      mainBarcode: mainBarcode ?? this.mainBarcode,
      name: name ?? this.name,
      scientific: scientific ?? this.scientific,
      company: company ?? this.company,
      group: group ?? this.group,
      primaryUnit: primaryUnit ?? this.primaryUnit,
      primaryCost: primaryCost ?? this.primaryCost,
      primaryPrice: primaryPrice ?? this.primaryPrice,
      secondaryUnit: secondaryUnit ?? this.secondaryUnit,
      packing: packing ?? this.packing,
      secondaryCost: secondaryCost ?? this.secondaryCost,
      secondaryPrice: secondaryPrice ?? this.secondaryPrice,
      minStockAlert: minStockAlert ?? this.minStockAlert,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (mainBarcode.present) {
      map['main_barcode'] = Variable<String>(mainBarcode.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (scientific.present) {
      map['scientific'] = Variable<String>(scientific.value);
    }
    if (company.present) {
      map['company'] = Variable<String>(company.value);
    }
    if (group.present) {
      map['group'] = Variable<String>(group.value);
    }
    if (primaryUnit.present) {
      map['primary_unit'] = Variable<String>(primaryUnit.value);
    }
    if (primaryCost.present) {
      map['primary_cost'] = Variable<double>(primaryCost.value);
    }
    if (primaryPrice.present) {
      map['primary_price'] = Variable<double>(primaryPrice.value);
    }
    if (secondaryUnit.present) {
      map['secondary_unit'] = Variable<String>(secondaryUnit.value);
    }
    if (packing.present) {
      map['packing'] = Variable<int>(packing.value);
    }
    if (secondaryCost.present) {
      map['secondary_cost'] = Variable<double>(secondaryCost.value);
    }
    if (secondaryPrice.present) {
      map['secondary_price'] = Variable<double>(secondaryPrice.value);
    }
    if (minStockAlert.present) {
      map['min_stock_alert'] = Variable<int>(minStockAlert.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('mainBarcode: $mainBarcode, ')
          ..write('name: $name, ')
          ..write('scientific: $scientific, ')
          ..write('company: $company, ')
          ..write('group: $group, ')
          ..write('primaryUnit: $primaryUnit, ')
          ..write('primaryCost: $primaryCost, ')
          ..write('primaryPrice: $primaryPrice, ')
          ..write('secondaryUnit: $secondaryUnit, ')
          ..write('packing: $packing, ')
          ..write('secondaryCost: $secondaryCost, ')
          ..write('secondaryPrice: $secondaryPrice, ')
          ..write('minStockAlert: $minStockAlert')
          ..write(')'))
        .toString();
  }
}

class $ProductBarcodesTable extends ProductBarcodes
    with TableInfo<$ProductBarcodesTable, ProductBarcode> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductBarcodesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES products (id)'));
  static const VerificationMeta _barcodeMeta =
      const VerificationMeta('barcode');
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
      'barcode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, productId, barcode];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_barcodes';
  @override
  VerificationContext validateIntegrity(Insertable<ProductBarcode> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta));
    } else if (isInserting) {
      context.missing(_barcodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductBarcode map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductBarcode(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      barcode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}barcode'])!,
    );
  }

  @override
  $ProductBarcodesTable createAlias(String alias) {
    return $ProductBarcodesTable(attachedDatabase, alias);
  }
}

class ProductBarcode extends DataClass implements Insertable<ProductBarcode> {
  final int id;
  final int productId;
  final String barcode;
  const ProductBarcode(
      {required this.id, required this.productId, required this.barcode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<int>(productId);
    map['barcode'] = Variable<String>(barcode);
    return map;
  }

  ProductBarcodesCompanion toCompanion(bool nullToAbsent) {
    return ProductBarcodesCompanion(
      id: Value(id),
      productId: Value(productId),
      barcode: Value(barcode),
    );
  }

  factory ProductBarcode.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductBarcode(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<int>(json['productId']),
      barcode: serializer.fromJson<String>(json['barcode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<int>(productId),
      'barcode': serializer.toJson<String>(barcode),
    };
  }

  ProductBarcode copyWith({int? id, int? productId, String? barcode}) =>
      ProductBarcode(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        barcode: barcode ?? this.barcode,
      );
  ProductBarcode copyWithCompanion(ProductBarcodesCompanion data) {
    return ProductBarcode(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductBarcode(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('barcode: $barcode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, productId, barcode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductBarcode &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.barcode == this.barcode);
}

class ProductBarcodesCompanion extends UpdateCompanion<ProductBarcode> {
  final Value<int> id;
  final Value<int> productId;
  final Value<String> barcode;
  const ProductBarcodesCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.barcode = const Value.absent(),
  });
  ProductBarcodesCompanion.insert({
    this.id = const Value.absent(),
    required int productId,
    required String barcode,
  })  : productId = Value(productId),
        barcode = Value(barcode);
  static Insertable<ProductBarcode> custom({
    Expression<int>? id,
    Expression<int>? productId,
    Expression<String>? barcode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (barcode != null) 'barcode': barcode,
    });
  }

  ProductBarcodesCompanion copyWith(
      {Value<int>? id, Value<int>? productId, Value<String>? barcode}) {
    return ProductBarcodesCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      barcode: barcode ?? this.barcode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductBarcodesCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('barcode: $barcode')
          ..write(')'))
        .toString();
  }
}

class $SuppliersTable extends Suppliers
    with TableInfo<$SuppliersTable, SupplierData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SuppliersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, phone, email, address, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'suppliers';
  @override
  VerificationContext validateIntegrity(Insertable<SupplierData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SupplierData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SupplierData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $SuppliersTable createAlias(String alias) {
    return $SuppliersTable(attachedDatabase, alias);
  }
}

class SupplierData extends DataClass implements Insertable<SupplierData> {
  final int id;
  final String name;
  final String? phone;
  final String? email;
  final String? address;
  final String? notes;
  const SupplierData(
      {required this.id,
      required this.name,
      this.phone,
      this.email,
      this.address,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  SuppliersCompanion toCompanion(bool nullToAbsent) {
    return SuppliersCompanion(
      id: Value(id),
      name: Value(name),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory SupplierData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SupplierData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      address: serializer.fromJson<String?>(json['address']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'address': serializer.toJson<String?>(address),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  SupplierData copyWith(
          {int? id,
          String? name,
          Value<String?> phone = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> address = const Value.absent(),
          Value<String?> notes = const Value.absent()}) =>
      SupplierData(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone.present ? phone.value : this.phone,
        email: email.present ? email.value : this.email,
        address: address.present ? address.value : this.address,
        notes: notes.present ? notes.value : this.notes,
      );
  SupplierData copyWithCompanion(SuppliersCompanion data) {
    return SupplierData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      address: data.address.present ? data.address.value : this.address,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SupplierData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, phone, email, address, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SupplierData &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.address == this.address &&
          other.notes == this.notes);
}

class SuppliersCompanion extends UpdateCompanion<SupplierData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<String?> address;
  final Value<String?> notes;
  const SuppliersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.notes = const Value.absent(),
  });
  SuppliersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.notes = const Value.absent(),
  }) : name = Value(name);
  static Insertable<SupplierData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? address,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (address != null) 'address': address,
      if (notes != null) 'notes': notes,
    });
  }

  SuppliersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? phone,
      Value<String?>? email,
      Value<String?>? address,
      Value<String?>? notes}) {
    return SuppliersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      notes: notes ?? this.notes,
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
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SuppliersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $CustomersTable extends Customers
    with TableInfo<$CustomersTable, Customer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _medicalHistoryMeta =
      const VerificationMeta('medicalHistory');
  @override
  late final GeneratedColumn<String> medicalHistory = GeneratedColumn<String>(
      'medical_history', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, phone, email, address, notes, medicalHistory];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customers';
  @override
  VerificationContext validateIntegrity(Insertable<Customer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('medical_history')) {
      context.handle(
          _medicalHistoryMeta,
          medicalHistory.isAcceptableOrUnknown(
              data['medical_history']!, _medicalHistoryMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Customer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Customer(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      medicalHistory: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}medical_history']),
    );
  }

  @override
  $CustomersTable createAlias(String alias) {
    return $CustomersTable(attachedDatabase, alias);
  }
}

class Customer extends DataClass implements Insertable<Customer> {
  final int id;
  final String name;
  final String? phone;
  final String? email;
  final String? address;
  final String? notes;
  final String? medicalHistory;
  const Customer(
      {required this.id,
      required this.name,
      this.phone,
      this.email,
      this.address,
      this.notes,
      this.medicalHistory});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || medicalHistory != null) {
      map['medical_history'] = Variable<String>(medicalHistory);
    }
    return map;
  }

  CustomersCompanion toCompanion(bool nullToAbsent) {
    return CustomersCompanion(
      id: Value(id),
      name: Value(name),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      medicalHistory: medicalHistory == null && nullToAbsent
          ? const Value.absent()
          : Value(medicalHistory),
    );
  }

  factory Customer.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Customer(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      address: serializer.fromJson<String?>(json['address']),
      notes: serializer.fromJson<String?>(json['notes']),
      medicalHistory: serializer.fromJson<String?>(json['medicalHistory']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'address': serializer.toJson<String?>(address),
      'notes': serializer.toJson<String?>(notes),
      'medicalHistory': serializer.toJson<String?>(medicalHistory),
    };
  }

  Customer copyWith(
          {int? id,
          String? name,
          Value<String?> phone = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> address = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          Value<String?> medicalHistory = const Value.absent()}) =>
      Customer(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone.present ? phone.value : this.phone,
        email: email.present ? email.value : this.email,
        address: address.present ? address.value : this.address,
        notes: notes.present ? notes.value : this.notes,
        medicalHistory:
            medicalHistory.present ? medicalHistory.value : this.medicalHistory,
      );
  Customer copyWithCompanion(CustomersCompanion data) {
    return Customer(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      address: data.address.present ? data.address.value : this.address,
      notes: data.notes.present ? data.notes.value : this.notes,
      medicalHistory: data.medicalHistory.present
          ? data.medicalHistory.value
          : this.medicalHistory,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Customer(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('notes: $notes, ')
          ..write('medicalHistory: $medicalHistory')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, phone, email, address, notes, medicalHistory);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Customer &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.address == this.address &&
          other.notes == this.notes &&
          other.medicalHistory == this.medicalHistory);
}

class CustomersCompanion extends UpdateCompanion<Customer> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<String?> address;
  final Value<String?> notes;
  final Value<String?> medicalHistory;
  const CustomersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.notes = const Value.absent(),
    this.medicalHistory = const Value.absent(),
  });
  CustomersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.notes = const Value.absent(),
    this.medicalHistory = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Customer> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? address,
    Expression<String>? notes,
    Expression<String>? medicalHistory,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (address != null) 'address': address,
      if (notes != null) 'notes': notes,
      if (medicalHistory != null) 'medical_history': medicalHistory,
    });
  }

  CustomersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? phone,
      Value<String?>? email,
      Value<String?>? address,
      Value<String?>? notes,
      Value<String?>? medicalHistory}) {
    return CustomersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      notes: notes ?? this.notes,
      medicalHistory: medicalHistory ?? this.medicalHistory,
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
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (medicalHistory.present) {
      map['medical_history'] = Variable<String>(medicalHistory.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('notes: $notes, ')
          ..write('medicalHistory: $medicalHistory')
          ..write(')'))
        .toString();
  }
}

class $PurchaseInvoiceItemsTable extends PurchaseInvoiceItems
    with TableInfo<$PurchaseInvoiceItemsTable, PurchaseInvoiceItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchaseInvoiceItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _invoiceIdMeta =
      const VerificationMeta('invoiceId');
  @override
  late final GeneratedColumn<int> invoiceId = GeneratedColumn<int>(
      'invoice_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _expiryMeta = const VerificationMeta('expiry');
  @override
  late final GeneratedColumn<DateTime> expiry = GeneratedColumn<DateTime>(
      'expiry', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<double> cost = GeneratedColumn<double>(
      'cost', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _bonusMeta = const VerificationMeta('bonus');
  @override
  late final GeneratedColumn<int> bonus = GeneratedColumn<int>(
      'bonus', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _costAfterBonusMeta =
      const VerificationMeta('costAfterBonus');
  @override
  late final GeneratedColumn<double> costAfterBonus = GeneratedColumn<double>(
      'cost_after_bonus', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _profitPercentMeta =
      const VerificationMeta('profitPercent');
  @override
  late final GeneratedColumn<double> profitPercent = GeneratedColumn<double>(
      'profit_percent', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _price2Meta = const VerificationMeta('price2');
  @override
  late final GeneratedColumn<double> price2 = GeneratedColumn<double>(
      'price2', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        invoiceId,
        productId,
        name,
        unit,
        expiry,
        quantity,
        cost,
        bonus,
        costAfterBonus,
        profitPercent,
        price,
        price2
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchase_invoice_items';
  @override
  VerificationContext validateIntegrity(
      Insertable<PurchaseInvoiceItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('invoice_id')) {
      context.handle(_invoiceIdMeta,
          invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta));
    } else if (isInserting) {
      context.missing(_invoiceIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('expiry')) {
      context.handle(_expiryMeta,
          expiry.isAcceptableOrUnknown(data['expiry']!, _expiryMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('cost')) {
      context.handle(
          _costMeta, cost.isAcceptableOrUnknown(data['cost']!, _costMeta));
    } else if (isInserting) {
      context.missing(_costMeta);
    }
    if (data.containsKey('bonus')) {
      context.handle(
          _bonusMeta, bonus.isAcceptableOrUnknown(data['bonus']!, _bonusMeta));
    }
    if (data.containsKey('cost_after_bonus')) {
      context.handle(
          _costAfterBonusMeta,
          costAfterBonus.isAcceptableOrUnknown(
              data['cost_after_bonus']!, _costAfterBonusMeta));
    } else if (isInserting) {
      context.missing(_costAfterBonusMeta);
    }
    if (data.containsKey('profit_percent')) {
      context.handle(
          _profitPercentMeta,
          profitPercent.isAcceptableOrUnknown(
              data['profit_percent']!, _profitPercentMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('price2')) {
      context.handle(_price2Meta,
          price2.isAcceptableOrUnknown(data['price2']!, _price2Meta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchaseInvoiceItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchaseInvoiceItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      invoiceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}invoice_id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      expiry: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}expiry']),
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      cost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cost'])!,
      bonus: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}bonus'])!,
      costAfterBonus: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}cost_after_bonus'])!,
      profitPercent: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}profit_percent'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      price2: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price2']),
    );
  }

  @override
  $PurchaseInvoiceItemsTable createAlias(String alias) {
    return $PurchaseInvoiceItemsTable(attachedDatabase, alias);
  }
}

class PurchaseInvoiceItem extends DataClass
    implements Insertable<PurchaseInvoiceItem> {
  final int id;
  final int invoiceId;
  final int productId;
  final String name;
  final String unit;
  final DateTime? expiry;
  final int quantity;
  final double cost;
  final int bonus;
  final double costAfterBonus;
  final double profitPercent;
  final double price;
  final double? price2;
  const PurchaseInvoiceItem(
      {required this.id,
      required this.invoiceId,
      required this.productId,
      required this.name,
      required this.unit,
      this.expiry,
      required this.quantity,
      required this.cost,
      required this.bonus,
      required this.costAfterBonus,
      required this.profitPercent,
      required this.price,
      this.price2});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['invoice_id'] = Variable<int>(invoiceId);
    map['product_id'] = Variable<int>(productId);
    map['name'] = Variable<String>(name);
    map['unit'] = Variable<String>(unit);
    if (!nullToAbsent || expiry != null) {
      map['expiry'] = Variable<DateTime>(expiry);
    }
    map['quantity'] = Variable<int>(quantity);
    map['cost'] = Variable<double>(cost);
    map['bonus'] = Variable<int>(bonus);
    map['cost_after_bonus'] = Variable<double>(costAfterBonus);
    map['profit_percent'] = Variable<double>(profitPercent);
    map['price'] = Variable<double>(price);
    if (!nullToAbsent || price2 != null) {
      map['price2'] = Variable<double>(price2);
    }
    return map;
  }

  PurchaseInvoiceItemsCompanion toCompanion(bool nullToAbsent) {
    return PurchaseInvoiceItemsCompanion(
      id: Value(id),
      invoiceId: Value(invoiceId),
      productId: Value(productId),
      name: Value(name),
      unit: Value(unit),
      expiry:
          expiry == null && nullToAbsent ? const Value.absent() : Value(expiry),
      quantity: Value(quantity),
      cost: Value(cost),
      bonus: Value(bonus),
      costAfterBonus: Value(costAfterBonus),
      profitPercent: Value(profitPercent),
      price: Value(price),
      price2:
          price2 == null && nullToAbsent ? const Value.absent() : Value(price2),
    );
  }

  factory PurchaseInvoiceItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchaseInvoiceItem(
      id: serializer.fromJson<int>(json['id']),
      invoiceId: serializer.fromJson<int>(json['invoiceId']),
      productId: serializer.fromJson<int>(json['productId']),
      name: serializer.fromJson<String>(json['name']),
      unit: serializer.fromJson<String>(json['unit']),
      expiry: serializer.fromJson<DateTime?>(json['expiry']),
      quantity: serializer.fromJson<int>(json['quantity']),
      cost: serializer.fromJson<double>(json['cost']),
      bonus: serializer.fromJson<int>(json['bonus']),
      costAfterBonus: serializer.fromJson<double>(json['costAfterBonus']),
      profitPercent: serializer.fromJson<double>(json['profitPercent']),
      price: serializer.fromJson<double>(json['price']),
      price2: serializer.fromJson<double?>(json['price2']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'invoiceId': serializer.toJson<int>(invoiceId),
      'productId': serializer.toJson<int>(productId),
      'name': serializer.toJson<String>(name),
      'unit': serializer.toJson<String>(unit),
      'expiry': serializer.toJson<DateTime?>(expiry),
      'quantity': serializer.toJson<int>(quantity),
      'cost': serializer.toJson<double>(cost),
      'bonus': serializer.toJson<int>(bonus),
      'costAfterBonus': serializer.toJson<double>(costAfterBonus),
      'profitPercent': serializer.toJson<double>(profitPercent),
      'price': serializer.toJson<double>(price),
      'price2': serializer.toJson<double?>(price2),
    };
  }

  PurchaseInvoiceItem copyWith(
          {int? id,
          int? invoiceId,
          int? productId,
          String? name,
          String? unit,
          Value<DateTime?> expiry = const Value.absent(),
          int? quantity,
          double? cost,
          int? bonus,
          double? costAfterBonus,
          double? profitPercent,
          double? price,
          Value<double?> price2 = const Value.absent()}) =>
      PurchaseInvoiceItem(
        id: id ?? this.id,
        invoiceId: invoiceId ?? this.invoiceId,
        productId: productId ?? this.productId,
        name: name ?? this.name,
        unit: unit ?? this.unit,
        expiry: expiry.present ? expiry.value : this.expiry,
        quantity: quantity ?? this.quantity,
        cost: cost ?? this.cost,
        bonus: bonus ?? this.bonus,
        costAfterBonus: costAfterBonus ?? this.costAfterBonus,
        profitPercent: profitPercent ?? this.profitPercent,
        price: price ?? this.price,
        price2: price2.present ? price2.value : this.price2,
      );
  PurchaseInvoiceItem copyWithCompanion(PurchaseInvoiceItemsCompanion data) {
    return PurchaseInvoiceItem(
      id: data.id.present ? data.id.value : this.id,
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
      productId: data.productId.present ? data.productId.value : this.productId,
      name: data.name.present ? data.name.value : this.name,
      unit: data.unit.present ? data.unit.value : this.unit,
      expiry: data.expiry.present ? data.expiry.value : this.expiry,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      cost: data.cost.present ? data.cost.value : this.cost,
      bonus: data.bonus.present ? data.bonus.value : this.bonus,
      costAfterBonus: data.costAfterBonus.present
          ? data.costAfterBonus.value
          : this.costAfterBonus,
      profitPercent: data.profitPercent.present
          ? data.profitPercent.value
          : this.profitPercent,
      price: data.price.present ? data.price.value : this.price,
      price2: data.price2.present ? data.price2.value : this.price2,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseInvoiceItem(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('productId: $productId, ')
          ..write('name: $name, ')
          ..write('unit: $unit, ')
          ..write('expiry: $expiry, ')
          ..write('quantity: $quantity, ')
          ..write('cost: $cost, ')
          ..write('bonus: $bonus, ')
          ..write('costAfterBonus: $costAfterBonus, ')
          ..write('profitPercent: $profitPercent, ')
          ..write('price: $price, ')
          ..write('price2: $price2')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, invoiceId, productId, name, unit, expiry,
      quantity, cost, bonus, costAfterBonus, profitPercent, price, price2);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseInvoiceItem &&
          other.id == this.id &&
          other.invoiceId == this.invoiceId &&
          other.productId == this.productId &&
          other.name == this.name &&
          other.unit == this.unit &&
          other.expiry == this.expiry &&
          other.quantity == this.quantity &&
          other.cost == this.cost &&
          other.bonus == this.bonus &&
          other.costAfterBonus == this.costAfterBonus &&
          other.profitPercent == this.profitPercent &&
          other.price == this.price &&
          other.price2 == this.price2);
}

class PurchaseInvoiceItemsCompanion
    extends UpdateCompanion<PurchaseInvoiceItem> {
  final Value<int> id;
  final Value<int> invoiceId;
  final Value<int> productId;
  final Value<String> name;
  final Value<String> unit;
  final Value<DateTime?> expiry;
  final Value<int> quantity;
  final Value<double> cost;
  final Value<int> bonus;
  final Value<double> costAfterBonus;
  final Value<double> profitPercent;
  final Value<double> price;
  final Value<double?> price2;
  const PurchaseInvoiceItemsCompanion({
    this.id = const Value.absent(),
    this.invoiceId = const Value.absent(),
    this.productId = const Value.absent(),
    this.name = const Value.absent(),
    this.unit = const Value.absent(),
    this.expiry = const Value.absent(),
    this.quantity = const Value.absent(),
    this.cost = const Value.absent(),
    this.bonus = const Value.absent(),
    this.costAfterBonus = const Value.absent(),
    this.profitPercent = const Value.absent(),
    this.price = const Value.absent(),
    this.price2 = const Value.absent(),
  });
  PurchaseInvoiceItemsCompanion.insert({
    this.id = const Value.absent(),
    required int invoiceId,
    required int productId,
    required String name,
    required String unit,
    this.expiry = const Value.absent(),
    required int quantity,
    required double cost,
    this.bonus = const Value.absent(),
    required double costAfterBonus,
    this.profitPercent = const Value.absent(),
    required double price,
    this.price2 = const Value.absent(),
  })  : invoiceId = Value(invoiceId),
        productId = Value(productId),
        name = Value(name),
        unit = Value(unit),
        quantity = Value(quantity),
        cost = Value(cost),
        costAfterBonus = Value(costAfterBonus),
        price = Value(price);
  static Insertable<PurchaseInvoiceItem> custom({
    Expression<int>? id,
    Expression<int>? invoiceId,
    Expression<int>? productId,
    Expression<String>? name,
    Expression<String>? unit,
    Expression<DateTime>? expiry,
    Expression<int>? quantity,
    Expression<double>? cost,
    Expression<int>? bonus,
    Expression<double>? costAfterBonus,
    Expression<double>? profitPercent,
    Expression<double>? price,
    Expression<double>? price2,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (productId != null) 'product_id': productId,
      if (name != null) 'name': name,
      if (unit != null) 'unit': unit,
      if (expiry != null) 'expiry': expiry,
      if (quantity != null) 'quantity': quantity,
      if (cost != null) 'cost': cost,
      if (bonus != null) 'bonus': bonus,
      if (costAfterBonus != null) 'cost_after_bonus': costAfterBonus,
      if (profitPercent != null) 'profit_percent': profitPercent,
      if (price != null) 'price': price,
      if (price2 != null) 'price2': price2,
    });
  }

  PurchaseInvoiceItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? invoiceId,
      Value<int>? productId,
      Value<String>? name,
      Value<String>? unit,
      Value<DateTime?>? expiry,
      Value<int>? quantity,
      Value<double>? cost,
      Value<int>? bonus,
      Value<double>? costAfterBonus,
      Value<double>? profitPercent,
      Value<double>? price,
      Value<double?>? price2}) {
    return PurchaseInvoiceItemsCompanion(
      id: id ?? this.id,
      invoiceId: invoiceId ?? this.invoiceId,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      unit: unit ?? this.unit,
      expiry: expiry ?? this.expiry,
      quantity: quantity ?? this.quantity,
      cost: cost ?? this.cost,
      bonus: bonus ?? this.bonus,
      costAfterBonus: costAfterBonus ?? this.costAfterBonus,
      profitPercent: profitPercent ?? this.profitPercent,
      price: price ?? this.price,
      price2: price2 ?? this.price2,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = Variable<int>(invoiceId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (expiry.present) {
      map['expiry'] = Variable<DateTime>(expiry.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (cost.present) {
      map['cost'] = Variable<double>(cost.value);
    }
    if (bonus.present) {
      map['bonus'] = Variable<int>(bonus.value);
    }
    if (costAfterBonus.present) {
      map['cost_after_bonus'] = Variable<double>(costAfterBonus.value);
    }
    if (profitPercent.present) {
      map['profit_percent'] = Variable<double>(profitPercent.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (price2.present) {
      map['price2'] = Variable<double>(price2.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseInvoiceItemsCompanion(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('productId: $productId, ')
          ..write('name: $name, ')
          ..write('unit: $unit, ')
          ..write('expiry: $expiry, ')
          ..write('quantity: $quantity, ')
          ..write('cost: $cost, ')
          ..write('bonus: $bonus, ')
          ..write('costAfterBonus: $costAfterBonus, ')
          ..write('profitPercent: $profitPercent, ')
          ..write('price: $price, ')
          ..write('price2: $price2')
          ..write(')'))
        .toString();
  }
}

class $PurchaseInvoicesTable extends PurchaseInvoices
    with TableInfo<$PurchaseInvoicesTable, PurchaseInvoice> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PurchaseInvoicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _supplierIdMeta =
      const VerificationMeta('supplierId');
  @override
  late final GeneratedColumn<int> supplierId = GeneratedColumn<int>(
      'supplier_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _invoiceCodeMeta =
      const VerificationMeta('invoiceCode');
  @override
  late final GeneratedColumn<String> invoiceCode = GeneratedColumn<String>(
      'invoice_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _totalCostMeta =
      const VerificationMeta('totalCost');
  @override
  late final GeneratedColumn<double> totalCost = GeneratedColumn<double>(
      'total_cost', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _totalPriceMeta =
      const VerificationMeta('totalPrice');
  @override
  late final GeneratedColumn<double> totalPrice = GeneratedColumn<double>(
      'total_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _paymentTypeMeta =
      const VerificationMeta('paymentType');
  @override
  late final GeneratedColumn<String> paymentType = GeneratedColumn<String>(
      'payment_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _discountMeta =
      const VerificationMeta('discount');
  @override
  late final GeneratedColumn<double> discount = GeneratedColumn<double>(
      'discount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _discountTypeMeta =
      const VerificationMeta('discountType');
  @override
  late final GeneratedColumn<String> discountType = GeneratedColumn<String>(
      'discount_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant("مبلغ"));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        supplierId,
        invoiceCode,
        date,
        totalCost,
        totalPrice,
        paymentType,
        discount,
        discountType,
        notes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'purchase_invoices';
  @override
  VerificationContext validateIntegrity(Insertable<PurchaseInvoice> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('supplier_id')) {
      context.handle(
          _supplierIdMeta,
          supplierId.isAcceptableOrUnknown(
              data['supplier_id']!, _supplierIdMeta));
    } else if (isInserting) {
      context.missing(_supplierIdMeta);
    }
    if (data.containsKey('invoice_code')) {
      context.handle(
          _invoiceCodeMeta,
          invoiceCode.isAcceptableOrUnknown(
              data['invoice_code']!, _invoiceCodeMeta));
    } else if (isInserting) {
      context.missing(_invoiceCodeMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('total_cost')) {
      context.handle(_totalCostMeta,
          totalCost.isAcceptableOrUnknown(data['total_cost']!, _totalCostMeta));
    } else if (isInserting) {
      context.missing(_totalCostMeta);
    }
    if (data.containsKey('total_price')) {
      context.handle(
          _totalPriceMeta,
          totalPrice.isAcceptableOrUnknown(
              data['total_price']!, _totalPriceMeta));
    } else if (isInserting) {
      context.missing(_totalPriceMeta);
    }
    if (data.containsKey('payment_type')) {
      context.handle(
          _paymentTypeMeta,
          paymentType.isAcceptableOrUnknown(
              data['payment_type']!, _paymentTypeMeta));
    } else if (isInserting) {
      context.missing(_paymentTypeMeta);
    }
    if (data.containsKey('discount')) {
      context.handle(_discountMeta,
          discount.isAcceptableOrUnknown(data['discount']!, _discountMeta));
    }
    if (data.containsKey('discount_type')) {
      context.handle(
          _discountTypeMeta,
          discountType.isAcceptableOrUnknown(
              data['discount_type']!, _discountTypeMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PurchaseInvoice map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PurchaseInvoice(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      supplierId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}supplier_id'])!,
      invoiceCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}invoice_code'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      totalCost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_cost'])!,
      totalPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_price'])!,
      paymentType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_type'])!,
      discount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}discount'])!,
      discountType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}discount_type'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes'])!,
    );
  }

  @override
  $PurchaseInvoicesTable createAlias(String alias) {
    return $PurchaseInvoicesTable(attachedDatabase, alias);
  }
}

class PurchaseInvoice extends DataClass implements Insertable<PurchaseInvoice> {
  final int id;
  final int supplierId;
  final String invoiceCode;
  final DateTime date;
  final double totalCost;
  final double totalPrice;
  final String paymentType;
  final double discount;
  final String discountType;
  final String notes;
  const PurchaseInvoice(
      {required this.id,
      required this.supplierId,
      required this.invoiceCode,
      required this.date,
      required this.totalCost,
      required this.totalPrice,
      required this.paymentType,
      required this.discount,
      required this.discountType,
      required this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['supplier_id'] = Variable<int>(supplierId);
    map['invoice_code'] = Variable<String>(invoiceCode);
    map['date'] = Variable<DateTime>(date);
    map['total_cost'] = Variable<double>(totalCost);
    map['total_price'] = Variable<double>(totalPrice);
    map['payment_type'] = Variable<String>(paymentType);
    map['discount'] = Variable<double>(discount);
    map['discount_type'] = Variable<String>(discountType);
    map['notes'] = Variable<String>(notes);
    return map;
  }

  PurchaseInvoicesCompanion toCompanion(bool nullToAbsent) {
    return PurchaseInvoicesCompanion(
      id: Value(id),
      supplierId: Value(supplierId),
      invoiceCode: Value(invoiceCode),
      date: Value(date),
      totalCost: Value(totalCost),
      totalPrice: Value(totalPrice),
      paymentType: Value(paymentType),
      discount: Value(discount),
      discountType: Value(discountType),
      notes: Value(notes),
    );
  }

  factory PurchaseInvoice.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PurchaseInvoice(
      id: serializer.fromJson<int>(json['id']),
      supplierId: serializer.fromJson<int>(json['supplierId']),
      invoiceCode: serializer.fromJson<String>(json['invoiceCode']),
      date: serializer.fromJson<DateTime>(json['date']),
      totalCost: serializer.fromJson<double>(json['totalCost']),
      totalPrice: serializer.fromJson<double>(json['totalPrice']),
      paymentType: serializer.fromJson<String>(json['paymentType']),
      discount: serializer.fromJson<double>(json['discount']),
      discountType: serializer.fromJson<String>(json['discountType']),
      notes: serializer.fromJson<String>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'supplierId': serializer.toJson<int>(supplierId),
      'invoiceCode': serializer.toJson<String>(invoiceCode),
      'date': serializer.toJson<DateTime>(date),
      'totalCost': serializer.toJson<double>(totalCost),
      'totalPrice': serializer.toJson<double>(totalPrice),
      'paymentType': serializer.toJson<String>(paymentType),
      'discount': serializer.toJson<double>(discount),
      'discountType': serializer.toJson<String>(discountType),
      'notes': serializer.toJson<String>(notes),
    };
  }

  PurchaseInvoice copyWith(
          {int? id,
          int? supplierId,
          String? invoiceCode,
          DateTime? date,
          double? totalCost,
          double? totalPrice,
          String? paymentType,
          double? discount,
          String? discountType,
          String? notes}) =>
      PurchaseInvoice(
        id: id ?? this.id,
        supplierId: supplierId ?? this.supplierId,
        invoiceCode: invoiceCode ?? this.invoiceCode,
        date: date ?? this.date,
        totalCost: totalCost ?? this.totalCost,
        totalPrice: totalPrice ?? this.totalPrice,
        paymentType: paymentType ?? this.paymentType,
        discount: discount ?? this.discount,
        discountType: discountType ?? this.discountType,
        notes: notes ?? this.notes,
      );
  PurchaseInvoice copyWithCompanion(PurchaseInvoicesCompanion data) {
    return PurchaseInvoice(
      id: data.id.present ? data.id.value : this.id,
      supplierId:
          data.supplierId.present ? data.supplierId.value : this.supplierId,
      invoiceCode:
          data.invoiceCode.present ? data.invoiceCode.value : this.invoiceCode,
      date: data.date.present ? data.date.value : this.date,
      totalCost: data.totalCost.present ? data.totalCost.value : this.totalCost,
      totalPrice:
          data.totalPrice.present ? data.totalPrice.value : this.totalPrice,
      paymentType:
          data.paymentType.present ? data.paymentType.value : this.paymentType,
      discount: data.discount.present ? data.discount.value : this.discount,
      discountType: data.discountType.present
          ? data.discountType.value
          : this.discountType,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseInvoice(')
          ..write('id: $id, ')
          ..write('supplierId: $supplierId, ')
          ..write('invoiceCode: $invoiceCode, ')
          ..write('date: $date, ')
          ..write('totalCost: $totalCost, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('paymentType: $paymentType, ')
          ..write('discount: $discount, ')
          ..write('discountType: $discountType, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, supplierId, invoiceCode, date, totalCost,
      totalPrice, paymentType, discount, discountType, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PurchaseInvoice &&
          other.id == this.id &&
          other.supplierId == this.supplierId &&
          other.invoiceCode == this.invoiceCode &&
          other.date == this.date &&
          other.totalCost == this.totalCost &&
          other.totalPrice == this.totalPrice &&
          other.paymentType == this.paymentType &&
          other.discount == this.discount &&
          other.discountType == this.discountType &&
          other.notes == this.notes);
}

class PurchaseInvoicesCompanion extends UpdateCompanion<PurchaseInvoice> {
  final Value<int> id;
  final Value<int> supplierId;
  final Value<String> invoiceCode;
  final Value<DateTime> date;
  final Value<double> totalCost;
  final Value<double> totalPrice;
  final Value<String> paymentType;
  final Value<double> discount;
  final Value<String> discountType;
  final Value<String> notes;
  const PurchaseInvoicesCompanion({
    this.id = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.invoiceCode = const Value.absent(),
    this.date = const Value.absent(),
    this.totalCost = const Value.absent(),
    this.totalPrice = const Value.absent(),
    this.paymentType = const Value.absent(),
    this.discount = const Value.absent(),
    this.discountType = const Value.absent(),
    this.notes = const Value.absent(),
  });
  PurchaseInvoicesCompanion.insert({
    this.id = const Value.absent(),
    required int supplierId,
    required String invoiceCode,
    required DateTime date,
    required double totalCost,
    required double totalPrice,
    required String paymentType,
    this.discount = const Value.absent(),
    this.discountType = const Value.absent(),
    this.notes = const Value.absent(),
  })  : supplierId = Value(supplierId),
        invoiceCode = Value(invoiceCode),
        date = Value(date),
        totalCost = Value(totalCost),
        totalPrice = Value(totalPrice),
        paymentType = Value(paymentType);
  static Insertable<PurchaseInvoice> custom({
    Expression<int>? id,
    Expression<int>? supplierId,
    Expression<String>? invoiceCode,
    Expression<DateTime>? date,
    Expression<double>? totalCost,
    Expression<double>? totalPrice,
    Expression<String>? paymentType,
    Expression<double>? discount,
    Expression<String>? discountType,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (supplierId != null) 'supplier_id': supplierId,
      if (invoiceCode != null) 'invoice_code': invoiceCode,
      if (date != null) 'date': date,
      if (totalCost != null) 'total_cost': totalCost,
      if (totalPrice != null) 'total_price': totalPrice,
      if (paymentType != null) 'payment_type': paymentType,
      if (discount != null) 'discount': discount,
      if (discountType != null) 'discount_type': discountType,
      if (notes != null) 'notes': notes,
    });
  }

  PurchaseInvoicesCompanion copyWith(
      {Value<int>? id,
      Value<int>? supplierId,
      Value<String>? invoiceCode,
      Value<DateTime>? date,
      Value<double>? totalCost,
      Value<double>? totalPrice,
      Value<String>? paymentType,
      Value<double>? discount,
      Value<String>? discountType,
      Value<String>? notes}) {
    return PurchaseInvoicesCompanion(
      id: id ?? this.id,
      supplierId: supplierId ?? this.supplierId,
      invoiceCode: invoiceCode ?? this.invoiceCode,
      date: date ?? this.date,
      totalCost: totalCost ?? this.totalCost,
      totalPrice: totalPrice ?? this.totalPrice,
      paymentType: paymentType ?? this.paymentType,
      discount: discount ?? this.discount,
      discountType: discountType ?? this.discountType,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (supplierId.present) {
      map['supplier_id'] = Variable<int>(supplierId.value);
    }
    if (invoiceCode.present) {
      map['invoice_code'] = Variable<String>(invoiceCode.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (totalCost.present) {
      map['total_cost'] = Variable<double>(totalCost.value);
    }
    if (totalPrice.present) {
      map['total_price'] = Variable<double>(totalPrice.value);
    }
    if (paymentType.present) {
      map['payment_type'] = Variable<String>(paymentType.value);
    }
    if (discount.present) {
      map['discount'] = Variable<double>(discount.value);
    }
    if (discountType.present) {
      map['discount_type'] = Variable<String>(discountType.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PurchaseInvoicesCompanion(')
          ..write('id: $id, ')
          ..write('supplierId: $supplierId, ')
          ..write('invoiceCode: $invoiceCode, ')
          ..write('date: $date, ')
          ..write('totalCost: $totalCost, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('paymentType: $paymentType, ')
          ..write('discount: $discount, ')
          ..write('discountType: $discountType, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $ProductBarcodesTable productBarcodes =
      $ProductBarcodesTable(this);
  late final $SuppliersTable suppliers = $SuppliersTable(this);
  late final $CustomersTable customers = $CustomersTable(this);
  late final $PurchaseInvoiceItemsTable purchaseInvoiceItems =
      $PurchaseInvoiceItemsTable(this);
  late final $PurchaseInvoicesTable purchaseInvoices =
      $PurchaseInvoicesTable(this);
  late final ProductsDao productsDao = ProductsDao(this as AppDatabase);
  late final SuppliersDao suppliersDao = SuppliersDao(this as AppDatabase);
  late final CustomersDao customersDao = CustomersDao(this as AppDatabase);
  late final PurchaseInvoiceItemsDao purchaseInvoiceItemsDao =
      PurchaseInvoiceItemsDao(this as AppDatabase);
  late final PurchaseInvoicesDao purchaseInvoicesDao =
      PurchaseInvoicesDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        products,
        productBarcodes,
        suppliers,
        customers,
        purchaseInvoiceItems,
        purchaseInvoices
      ];
}

typedef $$ProductsTableCreateCompanionBuilder = ProductsCompanion Function({
  Value<int> id,
  Value<String?> mainBarcode,
  required String name,
  Value<String?> scientific,
  Value<String?> company,
  Value<String?> group,
  required String primaryUnit,
  required double primaryCost,
  required double primaryPrice,
  Value<String?> secondaryUnit,
  Value<int> packing,
  Value<double?> secondaryCost,
  Value<double?> secondaryPrice,
  Value<int?> minStockAlert,
});
typedef $$ProductsTableUpdateCompanionBuilder = ProductsCompanion Function({
  Value<int> id,
  Value<String?> mainBarcode,
  Value<String> name,
  Value<String?> scientific,
  Value<String?> company,
  Value<String?> group,
  Value<String> primaryUnit,
  Value<double> primaryCost,
  Value<double> primaryPrice,
  Value<String?> secondaryUnit,
  Value<int> packing,
  Value<double?> secondaryCost,
  Value<double?> secondaryPrice,
  Value<int?> minStockAlert,
});

final class $$ProductsTableReferences
    extends BaseReferences<_$AppDatabase, $ProductsTable, ProductData> {
  $$ProductsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProductBarcodesTable, List<ProductBarcode>>
      _productBarcodesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.productBarcodes,
              aliasName: $_aliasNameGenerator(
                  db.products.id, db.productBarcodes.productId));

  $$ProductBarcodesTableProcessedTableManager get productBarcodesRefs {
    final manager =
        $$ProductBarcodesTableTableManager($_db, $_db.productBarcodes)
            .filter((f) => f.productId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_productBarcodesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mainBarcode => $composableBuilder(
      column: $table.mainBarcode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get scientific => $composableBuilder(
      column: $table.scientific, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get company => $composableBuilder(
      column: $table.company, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get group => $composableBuilder(
      column: $table.group, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get primaryUnit => $composableBuilder(
      column: $table.primaryUnit, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get primaryCost => $composableBuilder(
      column: $table.primaryCost, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get primaryPrice => $composableBuilder(
      column: $table.primaryPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get secondaryUnit => $composableBuilder(
      column: $table.secondaryUnit, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get packing => $composableBuilder(
      column: $table.packing, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get secondaryCost => $composableBuilder(
      column: $table.secondaryCost, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get secondaryPrice => $composableBuilder(
      column: $table.secondaryPrice,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get minStockAlert => $composableBuilder(
      column: $table.minStockAlert, builder: (column) => ColumnFilters(column));

  Expression<bool> productBarcodesRefs(
      Expression<bool> Function($$ProductBarcodesTableFilterComposer f) f) {
    final $$ProductBarcodesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.productBarcodes,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductBarcodesTableFilterComposer(
              $db: $db,
              $table: $db.productBarcodes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mainBarcode => $composableBuilder(
      column: $table.mainBarcode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get scientific => $composableBuilder(
      column: $table.scientific, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get company => $composableBuilder(
      column: $table.company, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get group => $composableBuilder(
      column: $table.group, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get primaryUnit => $composableBuilder(
      column: $table.primaryUnit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get primaryCost => $composableBuilder(
      column: $table.primaryCost, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get primaryPrice => $composableBuilder(
      column: $table.primaryPrice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get secondaryUnit => $composableBuilder(
      column: $table.secondaryUnit,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get packing => $composableBuilder(
      column: $table.packing, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get secondaryCost => $composableBuilder(
      column: $table.secondaryCost,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get secondaryPrice => $composableBuilder(
      column: $table.secondaryPrice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get minStockAlert => $composableBuilder(
      column: $table.minStockAlert,
      builder: (column) => ColumnOrderings(column));
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get mainBarcode => $composableBuilder(
      column: $table.mainBarcode, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get scientific => $composableBuilder(
      column: $table.scientific, builder: (column) => column);

  GeneratedColumn<String> get company =>
      $composableBuilder(column: $table.company, builder: (column) => column);

  GeneratedColumn<String> get group =>
      $composableBuilder(column: $table.group, builder: (column) => column);

  GeneratedColumn<String> get primaryUnit => $composableBuilder(
      column: $table.primaryUnit, builder: (column) => column);

  GeneratedColumn<double> get primaryCost => $composableBuilder(
      column: $table.primaryCost, builder: (column) => column);

  GeneratedColumn<double> get primaryPrice => $composableBuilder(
      column: $table.primaryPrice, builder: (column) => column);

  GeneratedColumn<String> get secondaryUnit => $composableBuilder(
      column: $table.secondaryUnit, builder: (column) => column);

  GeneratedColumn<int> get packing =>
      $composableBuilder(column: $table.packing, builder: (column) => column);

  GeneratedColumn<double> get secondaryCost => $composableBuilder(
      column: $table.secondaryCost, builder: (column) => column);

  GeneratedColumn<double> get secondaryPrice => $composableBuilder(
      column: $table.secondaryPrice, builder: (column) => column);

  GeneratedColumn<int> get minStockAlert => $composableBuilder(
      column: $table.minStockAlert, builder: (column) => column);

  Expression<T> productBarcodesRefs<T extends Object>(
      Expression<T> Function($$ProductBarcodesTableAnnotationComposer a) f) {
    final $$ProductBarcodesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.productBarcodes,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductBarcodesTableAnnotationComposer(
              $db: $db,
              $table: $db.productBarcodes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProductsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductsTable,
    ProductData,
    $$ProductsTableFilterComposer,
    $$ProductsTableOrderingComposer,
    $$ProductsTableAnnotationComposer,
    $$ProductsTableCreateCompanionBuilder,
    $$ProductsTableUpdateCompanionBuilder,
    (ProductData, $$ProductsTableReferences),
    ProductData,
    PrefetchHooks Function({bool productBarcodesRefs})> {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> mainBarcode = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> scientific = const Value.absent(),
            Value<String?> company = const Value.absent(),
            Value<String?> group = const Value.absent(),
            Value<String> primaryUnit = const Value.absent(),
            Value<double> primaryCost = const Value.absent(),
            Value<double> primaryPrice = const Value.absent(),
            Value<String?> secondaryUnit = const Value.absent(),
            Value<int> packing = const Value.absent(),
            Value<double?> secondaryCost = const Value.absent(),
            Value<double?> secondaryPrice = const Value.absent(),
            Value<int?> minStockAlert = const Value.absent(),
          }) =>
              ProductsCompanion(
            id: id,
            mainBarcode: mainBarcode,
            name: name,
            scientific: scientific,
            company: company,
            group: group,
            primaryUnit: primaryUnit,
            primaryCost: primaryCost,
            primaryPrice: primaryPrice,
            secondaryUnit: secondaryUnit,
            packing: packing,
            secondaryCost: secondaryCost,
            secondaryPrice: secondaryPrice,
            minStockAlert: minStockAlert,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> mainBarcode = const Value.absent(),
            required String name,
            Value<String?> scientific = const Value.absent(),
            Value<String?> company = const Value.absent(),
            Value<String?> group = const Value.absent(),
            required String primaryUnit,
            required double primaryCost,
            required double primaryPrice,
            Value<String?> secondaryUnit = const Value.absent(),
            Value<int> packing = const Value.absent(),
            Value<double?> secondaryCost = const Value.absent(),
            Value<double?> secondaryPrice = const Value.absent(),
            Value<int?> minStockAlert = const Value.absent(),
          }) =>
              ProductsCompanion.insert(
            id: id,
            mainBarcode: mainBarcode,
            name: name,
            scientific: scientific,
            company: company,
            group: group,
            primaryUnit: primaryUnit,
            primaryCost: primaryCost,
            primaryPrice: primaryPrice,
            secondaryUnit: secondaryUnit,
            packing: packing,
            secondaryCost: secondaryCost,
            secondaryPrice: secondaryPrice,
            minStockAlert: minStockAlert,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ProductsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({productBarcodesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (productBarcodesRefs) db.productBarcodes
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productBarcodesRefs)
                    await $_getPrefetchedData<ProductData, $ProductsTable,
                            ProductBarcode>(
                        currentTable: table,
                        referencedTable: $$ProductsTableReferences
                            ._productBarcodesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProductsTableReferences(db, table, p0)
                                .productBarcodesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ProductsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductsTable,
    ProductData,
    $$ProductsTableFilterComposer,
    $$ProductsTableOrderingComposer,
    $$ProductsTableAnnotationComposer,
    $$ProductsTableCreateCompanionBuilder,
    $$ProductsTableUpdateCompanionBuilder,
    (ProductData, $$ProductsTableReferences),
    ProductData,
    PrefetchHooks Function({bool productBarcodesRefs})>;
typedef $$ProductBarcodesTableCreateCompanionBuilder = ProductBarcodesCompanion
    Function({
  Value<int> id,
  required int productId,
  required String barcode,
});
typedef $$ProductBarcodesTableUpdateCompanionBuilder = ProductBarcodesCompanion
    Function({
  Value<int> id,
  Value<int> productId,
  Value<String> barcode,
});

final class $$ProductBarcodesTableReferences extends BaseReferences<
    _$AppDatabase, $ProductBarcodesTable, ProductBarcode> {
  $$ProductBarcodesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ProductsTable _productIdTable(_$AppDatabase db) =>
      db.products.createAlias(
          $_aliasNameGenerator(db.productBarcodes.productId, db.products.id));

  $$ProductsTableProcessedTableManager get productId {
    final $_column = $_itemColumn<int>('product_id')!;

    final manager = $$ProductsTableTableManager($_db, $_db.products)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ProductBarcodesTableFilterComposer
    extends Composer<_$AppDatabase, $ProductBarcodesTable> {
  $$ProductBarcodesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnFilters(column));

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableFilterComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductBarcodesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductBarcodesTable> {
  $$ProductBarcodesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnOrderings(column));

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableOrderingComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductBarcodesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductBarcodesTable> {
  $$ProductBarcodesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableAnnotationComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductBarcodesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductBarcodesTable,
    ProductBarcode,
    $$ProductBarcodesTableFilterComposer,
    $$ProductBarcodesTableOrderingComposer,
    $$ProductBarcodesTableAnnotationComposer,
    $$ProductBarcodesTableCreateCompanionBuilder,
    $$ProductBarcodesTableUpdateCompanionBuilder,
    (ProductBarcode, $$ProductBarcodesTableReferences),
    ProductBarcode,
    PrefetchHooks Function({bool productId})> {
  $$ProductBarcodesTableTableManager(
      _$AppDatabase db, $ProductBarcodesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductBarcodesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductBarcodesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductBarcodesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> productId = const Value.absent(),
            Value<String> barcode = const Value.absent(),
          }) =>
              ProductBarcodesCompanion(
            id: id,
            productId: productId,
            barcode: barcode,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int productId,
            required String barcode,
          }) =>
              ProductBarcodesCompanion.insert(
            id: id,
            productId: productId,
            barcode: barcode,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ProductBarcodesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                      dynamic>>(state) {
                if (productId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productId,
                    referencedTable:
                        $$ProductBarcodesTableReferences._productIdTable(db),
                    referencedColumn:
                        $$ProductBarcodesTableReferences._productIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ProductBarcodesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductBarcodesTable,
    ProductBarcode,
    $$ProductBarcodesTableFilterComposer,
    $$ProductBarcodesTableOrderingComposer,
    $$ProductBarcodesTableAnnotationComposer,
    $$ProductBarcodesTableCreateCompanionBuilder,
    $$ProductBarcodesTableUpdateCompanionBuilder,
    (ProductBarcode, $$ProductBarcodesTableReferences),
    ProductBarcode,
    PrefetchHooks Function({bool productId})>;
typedef $$SuppliersTableCreateCompanionBuilder = SuppliersCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> phone,
  Value<String?> email,
  Value<String?> address,
  Value<String?> notes,
});
typedef $$SuppliersTableUpdateCompanionBuilder = SuppliersCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> phone,
  Value<String?> email,
  Value<String?> address,
  Value<String?> notes,
});

class $$SuppliersTableFilterComposer
    extends Composer<_$AppDatabase, $SuppliersTable> {
  $$SuppliersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));
}

class $$SuppliersTableOrderingComposer
    extends Composer<_$AppDatabase, $SuppliersTable> {
  $$SuppliersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));
}

class $$SuppliersTableAnnotationComposer
    extends Composer<_$AppDatabase, $SuppliersTable> {
  $$SuppliersTableAnnotationComposer({
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

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$SuppliersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SuppliersTable,
    SupplierData,
    $$SuppliersTableFilterComposer,
    $$SuppliersTableOrderingComposer,
    $$SuppliersTableAnnotationComposer,
    $$SuppliersTableCreateCompanionBuilder,
    $$SuppliersTableUpdateCompanionBuilder,
    (
      SupplierData,
      BaseReferences<_$AppDatabase, $SuppliersTable, SupplierData>
    ),
    SupplierData,
    PrefetchHooks Function()> {
  $$SuppliersTableTableManager(_$AppDatabase db, $SuppliersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SuppliersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SuppliersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SuppliersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              SuppliersCompanion(
            id: id,
            name: name,
            phone: phone,
            email: email,
            address: address,
            notes: notes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> phone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              SuppliersCompanion.insert(
            id: id,
            name: name,
            phone: phone,
            email: email,
            address: address,
            notes: notes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SuppliersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SuppliersTable,
    SupplierData,
    $$SuppliersTableFilterComposer,
    $$SuppliersTableOrderingComposer,
    $$SuppliersTableAnnotationComposer,
    $$SuppliersTableCreateCompanionBuilder,
    $$SuppliersTableUpdateCompanionBuilder,
    (
      SupplierData,
      BaseReferences<_$AppDatabase, $SuppliersTable, SupplierData>
    ),
    SupplierData,
    PrefetchHooks Function()>;
typedef $$CustomersTableCreateCompanionBuilder = CustomersCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> phone,
  Value<String?> email,
  Value<String?> address,
  Value<String?> notes,
  Value<String?> medicalHistory,
});
typedef $$CustomersTableUpdateCompanionBuilder = CustomersCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> phone,
  Value<String?> email,
  Value<String?> address,
  Value<String?> notes,
  Value<String?> medicalHistory,
});

class $$CustomersTableFilterComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get medicalHistory => $composableBuilder(
      column: $table.medicalHistory,
      builder: (column) => ColumnFilters(column));
}

class $$CustomersTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get medicalHistory => $composableBuilder(
      column: $table.medicalHistory,
      builder: (column) => ColumnOrderings(column));
}

class $$CustomersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomersTable> {
  $$CustomersTableAnnotationComposer({
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

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get medicalHistory => $composableBuilder(
      column: $table.medicalHistory, builder: (column) => column);
}

class $$CustomersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CustomersTable,
    Customer,
    $$CustomersTableFilterComposer,
    $$CustomersTableOrderingComposer,
    $$CustomersTableAnnotationComposer,
    $$CustomersTableCreateCompanionBuilder,
    $$CustomersTableUpdateCompanionBuilder,
    (Customer, BaseReferences<_$AppDatabase, $CustomersTable, Customer>),
    Customer,
    PrefetchHooks Function()> {
  $$CustomersTableTableManager(_$AppDatabase db, $CustomersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String?> medicalHistory = const Value.absent(),
          }) =>
              CustomersCompanion(
            id: id,
            name: name,
            phone: phone,
            email: email,
            address: address,
            notes: notes,
            medicalHistory: medicalHistory,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> phone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String?> medicalHistory = const Value.absent(),
          }) =>
              CustomersCompanion.insert(
            id: id,
            name: name,
            phone: phone,
            email: email,
            address: address,
            notes: notes,
            medicalHistory: medicalHistory,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CustomersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CustomersTable,
    Customer,
    $$CustomersTableFilterComposer,
    $$CustomersTableOrderingComposer,
    $$CustomersTableAnnotationComposer,
    $$CustomersTableCreateCompanionBuilder,
    $$CustomersTableUpdateCompanionBuilder,
    (Customer, BaseReferences<_$AppDatabase, $CustomersTable, Customer>),
    Customer,
    PrefetchHooks Function()>;
typedef $$PurchaseInvoiceItemsTableCreateCompanionBuilder
    = PurchaseInvoiceItemsCompanion Function({
  Value<int> id,
  required int invoiceId,
  required int productId,
  required String name,
  required String unit,
  Value<DateTime?> expiry,
  required int quantity,
  required double cost,
  Value<int> bonus,
  required double costAfterBonus,
  Value<double> profitPercent,
  required double price,
  Value<double?> price2,
});
typedef $$PurchaseInvoiceItemsTableUpdateCompanionBuilder
    = PurchaseInvoiceItemsCompanion Function({
  Value<int> id,
  Value<int> invoiceId,
  Value<int> productId,
  Value<String> name,
  Value<String> unit,
  Value<DateTime?> expiry,
  Value<int> quantity,
  Value<double> cost,
  Value<int> bonus,
  Value<double> costAfterBonus,
  Value<double> profitPercent,
  Value<double> price,
  Value<double?> price2,
});

class $$PurchaseInvoiceItemsTableFilterComposer
    extends Composer<_$AppDatabase, $PurchaseInvoiceItemsTable> {
  $$PurchaseInvoiceItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get invoiceId => $composableBuilder(
      column: $table.invoiceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get expiry => $composableBuilder(
      column: $table.expiry, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get cost => $composableBuilder(
      column: $table.cost, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get bonus => $composableBuilder(
      column: $table.bonus, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get costAfterBonus => $composableBuilder(
      column: $table.costAfterBonus,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get profitPercent => $composableBuilder(
      column: $table.profitPercent, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price2 => $composableBuilder(
      column: $table.price2, builder: (column) => ColumnFilters(column));
}

class $$PurchaseInvoiceItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchaseInvoiceItemsTable> {
  $$PurchaseInvoiceItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get invoiceId => $composableBuilder(
      column: $table.invoiceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get expiry => $composableBuilder(
      column: $table.expiry, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get cost => $composableBuilder(
      column: $table.cost, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get bonus => $composableBuilder(
      column: $table.bonus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get costAfterBonus => $composableBuilder(
      column: $table.costAfterBonus,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get profitPercent => $composableBuilder(
      column: $table.profitPercent,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price2 => $composableBuilder(
      column: $table.price2, builder: (column) => ColumnOrderings(column));
}

class $$PurchaseInvoiceItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchaseInvoiceItemsTable> {
  $$PurchaseInvoiceItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get invoiceId =>
      $composableBuilder(column: $table.invoiceId, builder: (column) => column);

  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<DateTime> get expiry =>
      $composableBuilder(column: $table.expiry, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get cost =>
      $composableBuilder(column: $table.cost, builder: (column) => column);

  GeneratedColumn<int> get bonus =>
      $composableBuilder(column: $table.bonus, builder: (column) => column);

  GeneratedColumn<double> get costAfterBonus => $composableBuilder(
      column: $table.costAfterBonus, builder: (column) => column);

  GeneratedColumn<double> get profitPercent => $composableBuilder(
      column: $table.profitPercent, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get price2 =>
      $composableBuilder(column: $table.price2, builder: (column) => column);
}

class $$PurchaseInvoiceItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PurchaseInvoiceItemsTable,
    PurchaseInvoiceItem,
    $$PurchaseInvoiceItemsTableFilterComposer,
    $$PurchaseInvoiceItemsTableOrderingComposer,
    $$PurchaseInvoiceItemsTableAnnotationComposer,
    $$PurchaseInvoiceItemsTableCreateCompanionBuilder,
    $$PurchaseInvoiceItemsTableUpdateCompanionBuilder,
    (
      PurchaseInvoiceItem,
      BaseReferences<_$AppDatabase, $PurchaseInvoiceItemsTable,
          PurchaseInvoiceItem>
    ),
    PurchaseInvoiceItem,
    PrefetchHooks Function()> {
  $$PurchaseInvoiceItemsTableTableManager(
      _$AppDatabase db, $PurchaseInvoiceItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchaseInvoiceItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchaseInvoiceItemsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PurchaseInvoiceItemsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> invoiceId = const Value.absent(),
            Value<int> productId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<DateTime?> expiry = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<double> cost = const Value.absent(),
            Value<int> bonus = const Value.absent(),
            Value<double> costAfterBonus = const Value.absent(),
            Value<double> profitPercent = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<double?> price2 = const Value.absent(),
          }) =>
              PurchaseInvoiceItemsCompanion(
            id: id,
            invoiceId: invoiceId,
            productId: productId,
            name: name,
            unit: unit,
            expiry: expiry,
            quantity: quantity,
            cost: cost,
            bonus: bonus,
            costAfterBonus: costAfterBonus,
            profitPercent: profitPercent,
            price: price,
            price2: price2,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int invoiceId,
            required int productId,
            required String name,
            required String unit,
            Value<DateTime?> expiry = const Value.absent(),
            required int quantity,
            required double cost,
            Value<int> bonus = const Value.absent(),
            required double costAfterBonus,
            Value<double> profitPercent = const Value.absent(),
            required double price,
            Value<double?> price2 = const Value.absent(),
          }) =>
              PurchaseInvoiceItemsCompanion.insert(
            id: id,
            invoiceId: invoiceId,
            productId: productId,
            name: name,
            unit: unit,
            expiry: expiry,
            quantity: quantity,
            cost: cost,
            bonus: bonus,
            costAfterBonus: costAfterBonus,
            profitPercent: profitPercent,
            price: price,
            price2: price2,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PurchaseInvoiceItemsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $PurchaseInvoiceItemsTable,
        PurchaseInvoiceItem,
        $$PurchaseInvoiceItemsTableFilterComposer,
        $$PurchaseInvoiceItemsTableOrderingComposer,
        $$PurchaseInvoiceItemsTableAnnotationComposer,
        $$PurchaseInvoiceItemsTableCreateCompanionBuilder,
        $$PurchaseInvoiceItemsTableUpdateCompanionBuilder,
        (
          PurchaseInvoiceItem,
          BaseReferences<_$AppDatabase, $PurchaseInvoiceItemsTable,
              PurchaseInvoiceItem>
        ),
        PurchaseInvoiceItem,
        PrefetchHooks Function()>;
typedef $$PurchaseInvoicesTableCreateCompanionBuilder
    = PurchaseInvoicesCompanion Function({
  Value<int> id,
  required int supplierId,
  required String invoiceCode,
  required DateTime date,
  required double totalCost,
  required double totalPrice,
  required String paymentType,
  Value<double> discount,
  Value<String> discountType,
  Value<String> notes,
});
typedef $$PurchaseInvoicesTableUpdateCompanionBuilder
    = PurchaseInvoicesCompanion Function({
  Value<int> id,
  Value<int> supplierId,
  Value<String> invoiceCode,
  Value<DateTime> date,
  Value<double> totalCost,
  Value<double> totalPrice,
  Value<String> paymentType,
  Value<double> discount,
  Value<String> discountType,
  Value<String> notes,
});

class $$PurchaseInvoicesTableFilterComposer
    extends Composer<_$AppDatabase, $PurchaseInvoicesTable> {
  $$PurchaseInvoicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get supplierId => $composableBuilder(
      column: $table.supplierId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get invoiceCode => $composableBuilder(
      column: $table.invoiceCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalCost => $composableBuilder(
      column: $table.totalCost, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentType => $composableBuilder(
      column: $table.paymentType, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get discount => $composableBuilder(
      column: $table.discount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get discountType => $composableBuilder(
      column: $table.discountType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));
}

class $$PurchaseInvoicesTableOrderingComposer
    extends Composer<_$AppDatabase, $PurchaseInvoicesTable> {
  $$PurchaseInvoicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get supplierId => $composableBuilder(
      column: $table.supplierId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get invoiceCode => $composableBuilder(
      column: $table.invoiceCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalCost => $composableBuilder(
      column: $table.totalCost, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentType => $composableBuilder(
      column: $table.paymentType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get discount => $composableBuilder(
      column: $table.discount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get discountType => $composableBuilder(
      column: $table.discountType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));
}

class $$PurchaseInvoicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PurchaseInvoicesTable> {
  $$PurchaseInvoicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get supplierId => $composableBuilder(
      column: $table.supplierId, builder: (column) => column);

  GeneratedColumn<String> get invoiceCode => $composableBuilder(
      column: $table.invoiceCode, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<double> get totalCost =>
      $composableBuilder(column: $table.totalCost, builder: (column) => column);

  GeneratedColumn<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => column);

  GeneratedColumn<String> get paymentType => $composableBuilder(
      column: $table.paymentType, builder: (column) => column);

  GeneratedColumn<double> get discount =>
      $composableBuilder(column: $table.discount, builder: (column) => column);

  GeneratedColumn<String> get discountType => $composableBuilder(
      column: $table.discountType, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$PurchaseInvoicesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PurchaseInvoicesTable,
    PurchaseInvoice,
    $$PurchaseInvoicesTableFilterComposer,
    $$PurchaseInvoicesTableOrderingComposer,
    $$PurchaseInvoicesTableAnnotationComposer,
    $$PurchaseInvoicesTableCreateCompanionBuilder,
    $$PurchaseInvoicesTableUpdateCompanionBuilder,
    (
      PurchaseInvoice,
      BaseReferences<_$AppDatabase, $PurchaseInvoicesTable, PurchaseInvoice>
    ),
    PurchaseInvoice,
    PrefetchHooks Function()> {
  $$PurchaseInvoicesTableTableManager(
      _$AppDatabase db, $PurchaseInvoicesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PurchaseInvoicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PurchaseInvoicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PurchaseInvoicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> supplierId = const Value.absent(),
            Value<String> invoiceCode = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<double> totalCost = const Value.absent(),
            Value<double> totalPrice = const Value.absent(),
            Value<String> paymentType = const Value.absent(),
            Value<double> discount = const Value.absent(),
            Value<String> discountType = const Value.absent(),
            Value<String> notes = const Value.absent(),
          }) =>
              PurchaseInvoicesCompanion(
            id: id,
            supplierId: supplierId,
            invoiceCode: invoiceCode,
            date: date,
            totalCost: totalCost,
            totalPrice: totalPrice,
            paymentType: paymentType,
            discount: discount,
            discountType: discountType,
            notes: notes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int supplierId,
            required String invoiceCode,
            required DateTime date,
            required double totalCost,
            required double totalPrice,
            required String paymentType,
            Value<double> discount = const Value.absent(),
            Value<String> discountType = const Value.absent(),
            Value<String> notes = const Value.absent(),
          }) =>
              PurchaseInvoicesCompanion.insert(
            id: id,
            supplierId: supplierId,
            invoiceCode: invoiceCode,
            date: date,
            totalCost: totalCost,
            totalPrice: totalPrice,
            paymentType: paymentType,
            discount: discount,
            discountType: discountType,
            notes: notes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PurchaseInvoicesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PurchaseInvoicesTable,
    PurchaseInvoice,
    $$PurchaseInvoicesTableFilterComposer,
    $$PurchaseInvoicesTableOrderingComposer,
    $$PurchaseInvoicesTableAnnotationComposer,
    $$PurchaseInvoicesTableCreateCompanionBuilder,
    $$PurchaseInvoicesTableUpdateCompanionBuilder,
    (
      PurchaseInvoice,
      BaseReferences<_$AppDatabase, $PurchaseInvoicesTable, PurchaseInvoice>
    ),
    PurchaseInvoice,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$ProductBarcodesTableTableManager get productBarcodes =>
      $$ProductBarcodesTableTableManager(_db, _db.productBarcodes);
  $$SuppliersTableTableManager get suppliers =>
      $$SuppliersTableTableManager(_db, _db.suppliers);
  $$CustomersTableTableManager get customers =>
      $$CustomersTableTableManager(_db, _db.customers);
  $$PurchaseInvoiceItemsTableTableManager get purchaseInvoiceItems =>
      $$PurchaseInvoiceItemsTableTableManager(_db, _db.purchaseInvoiceItems);
  $$PurchaseInvoicesTableTableManager get purchaseInvoices =>
      $$PurchaseInvoicesTableTableManager(_db, _db.purchaseInvoices);
}
