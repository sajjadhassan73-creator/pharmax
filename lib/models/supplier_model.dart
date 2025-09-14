import 'package:drift/drift.dart';
import 'package:pharmax/database/app_database.dart';

class SupplierModel {
  final int? id;
  final String name;
  final String? phone;
  final String? email;
  final String? address;
  final String? notes;

  SupplierModel({
    this.id,
    required this.name,
    this.phone,
    this.email,
    this.address,
    this.notes,
  });

  /// 🟢 نسخة جديدة مع تعديلات (مهم حتى يشتغل copyWith)
  SupplierModel copyWith({
    int? id,
    String? name,
    String? phone,
    String? email,
    String? address,
    String? notes,
  }) {
    return SupplierModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      notes: notes ?? this.notes,
    );
  }

  /// 🟢 تحويل من كلاس Drift (SupplierData) إلى نموذج
  factory SupplierModel.fromDrift(SupplierData supplier) {
    return SupplierModel(
      id: supplier.id,
      name: supplier.name,
      phone: supplier.phone,
      email: supplier.email,
      address: supplier.address,
      notes: supplier.notes,
    );
  }

  /// 🟢 تحويل من نموذج إلى Drift Companion (للاستخدام في insert/update)
  SuppliersCompanion toCompanion() {
    return SuppliersCompanion(
      id: id != null ? Value(id!) : const Value.absent(),
      name: Value(name),
      phone: Value(phone),
      email: Value(email),
      address: Value(address),
      notes: Value(notes),
    );
  }

  /// 🟢 تحويل إلى JSON (مفيد للتخزين/النقل)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
      'notes': notes,
    };
  }

  /// 🟢 إنشاء من JSON
  factory SupplierModel.fromJson(Map<String, dynamic> json) {
    return SupplierModel(
      id: json['id'] as int?,
      name: json['name'] as String,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      notes: json['notes'] as String?,
    );
  }
}
