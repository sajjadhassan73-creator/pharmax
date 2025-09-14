// lib/models/product_model.dart
import 'package:drift/drift.dart';
import '../../database/app_database.dart';

class ProductModel {
  final int? id;
  final List<String> barcodes;
  final String name;
  final String? scientific;
  final String? company;
  final String? group;

  final String unit;
  final double primaryCost;
  final double primaryPrice;

  final String? secondaryUnitName;
  final int packing;
  final double? secondaryCost;
  final double? secondaryPrice;

  ProductModel({
    this.id,
    required this.barcodes,
    required this.name,
    this.scientific,
    this.company,
    this.group,
    required this.unit,
    required this.primaryCost,
    required this.primaryPrice,
    this.secondaryUnitName,
    this.packing = 1,
    this.secondaryCost,
    this.secondaryPrice,
  });

  factory ProductModel.fromDrift(ProductData product, List<String> barcodes) {
    return ProductModel(
      id: product.id,
      barcodes: barcodes,
      name: product.name,
      scientific: product.scientific,
      company: product.company,
      group: product.group,
      unit: product.primaryUnit,
      primaryCost: product.primaryCost,
      primaryPrice: product.primaryPrice,
      secondaryUnitName: product.secondaryUnit,
      packing: product.packing,
      secondaryCost: product.secondaryCost,
      secondaryPrice: product.secondaryPrice,
    );
  }

  ProductsCompanion toCompanion() {
    return ProductsCompanion.insert(
      mainBarcode:
          barcodes.isNotEmpty ? Value(barcodes.first) : const Value.absent(),
      name: name,
      scientific: Value(scientific),
      company: Value(company),
      group: Value(group),
      primaryUnit: unit,
      primaryCost: primaryCost,
      primaryPrice: primaryPrice,
      secondaryUnit: Value(secondaryUnitName),
      packing: Value(packing),
      secondaryCost: Value(secondaryCost),
      secondaryPrice: Value(secondaryPrice),
      minStockAlert: const Value(null),
    );
  }

  /// نسخة جديدة مع حقول معدلة
  ProductModel copyWith({
    int? id,
    List<String>? barcodes,
    String? name,
    String? scientific,
    String? company,
    String? group,
    String? unit,
    double? primaryCost,
    double? primaryPrice,
    String? secondaryUnitName,
    int? packing,
    double? secondaryCost,
    double? secondaryPrice,
  }) {
    return ProductModel(
      id: id ?? this.id,
      barcodes: barcodes ?? this.barcodes,
      name: name ?? this.name,
      scientific: scientific ?? this.scientific,
      company: company ?? this.company,
      group: group ?? this.group,
      unit: unit ?? this.unit,
      primaryCost: primaryCost ?? this.primaryCost,
      primaryPrice: primaryPrice ?? this.primaryPrice,
      secondaryUnitName: secondaryUnitName ?? this.secondaryUnitName,
      packing: packing ?? this.packing,
      secondaryCost: secondaryCost ?? this.secondaryCost,
      secondaryPrice: secondaryPrice ?? this.secondaryPrice,
    );
  }
}
